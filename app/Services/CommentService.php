<?php

namespace App\Services;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use App\Models\Comment;

class CommentService
{

    public function applySorting(Request $request, Builder $query)
    {
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

        return $query->paginate(2);
    }

    public function createComment(array $data)
    {
        $comment = Comment::create([
            'username' => $data['name'],
            'email' => $data['email'],
            'homepage' => $data['homepage'],
            'content' => $data['content'],
            'parent_id' => isset($data['parent_id']) ? $data['parent_id'] : null,
        ]);

        return $comment;
    }
}