<?php

namespace App\Services;

use Illuminate\Http\Request;
use App\Models\Comment;
use App\Http\Requests\CommentRequest;
use App\Http\Resources\CommentResource;
use Intervention\Image\Facades\Image;

class CommentService
{

    public function applySorting(Request $request)
    {

        $query = Comment::query();

        $sortOptions = [
            'new' => ['date', 'desc'],
            'old' => ['date', 'asc'],
            'name' => ['username', 'asc'],
            'email' => ['email', 'asc'],
        ];

        $sortedBy = $request->input('sort');
        if (!array_key_exists($sortedBy, $sortOptions)) {
            $sortedBy = 'new';
        }

        if (array_key_exists($sortedBy, $sortOptions)) {
            $sortParams = $sortOptions[$sortedBy];
            $query->orderBy(...$sortParams);
        }

        $query->whereNull('parent_id')->with('childComments')->get();

        return CommentResource::collection($query->paginate(25));
    }

    public function createComment(CommentRequest $request)
    {
        $data = $request->validated();

        $comment = Comment::create([
            'username' => $data['name'],
            'email' => $data['email'],
            'homepage' => $data['homepage'],
            'content' => $data['content'],
            'parent_id' => isset($data['parent_id']) ? $data['parent_id'] : null,
        ]);

        if ($request->hasFile('attachment')) {
            $file = $request->file('attachment');
            $fileName = time() . '_' . $file->getClientOriginalName();

            if ($file->getMimeType() === 'text/plain') {
                $file->storeAs('public/attachments', $fileName);
                $comment->update(['attachment' => $fileName]);
                $comment->update(['attachment_type' => $file->getMimeType()]);
            } elseif (in_array($file->getClientOriginalExtension(), ['jpg', 'jpeg', 'gif', 'png'])) {
                $image = Image::make($file);
                $width = $image->width();
                $height = $image->height();

                if ($width > 320 || $height > 240) {
                    $image->resize(320, 240, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    });
                }

                $image->save(storage_path('app/public/attachments/' . $fileName));
                $comment->update(['attachment' => $fileName]);
                $comment->update(['attachment_type' => 'image']);
            }
        }

        return response()->json([
            'status' => 'true',
            'message' => 'Comment is saved!',
            'comment' => $comment
        ], 201);
    }
}