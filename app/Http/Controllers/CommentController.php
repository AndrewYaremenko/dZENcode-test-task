<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index(Request $request)
    {
        $sortedBy = $request->input('sort');

        $comments = Comment::query();

        if ($sortedBy === 'new') {
            $comments->orderBy('date', 'desc');
        } elseif ($sortedBy === 'old') {
            $comments->orderBy('date', 'asc');
        } elseif ($sortedBy === 'name') {
            $comments->orderBy('username');
        } elseif ($sortedBy === 'email') {
            $comments->orderBy('email');
        }

        $comments = $comments->paginate(3);

        return response()->json([
            'comments' => $comments,
        ], 200);
    }


    public function store(Request $request)
    {
        $data = $request->json()->all();

        $comment = Comment::create([
            'username' => $data['name'],
            'email' => $data['email'],
            'homepage' => $data['homepage'],
            'content' => $data['content'],
        ])->save();

        return response()->json([
            'message' => 'comment is saved!',
        ], 201);
    }
}