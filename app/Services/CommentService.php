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
            $sortedBy = 'old';
        }

        if (array_key_exists($sortedBy, $sortOptions)) {
            $sortParams = $sortOptions[$sortedBy];
            $query->orderBy(...$sortParams);
        }

        $query->whereNull('parent_id')->with('childComments')->get();

        return $query->paginate(5);
    }

    public function createComment(array $data)
    {
        $comment = new Comment();
        $comment->username = $data['name'];
        $comment->email = $data['email'];
        $comment->homepage = $data['homepage'];
        $comment->content = $data['content'];   
        $comment->parent_id = $data['parent_id'];   

        $comment->save();

        return $comment;
    }
}