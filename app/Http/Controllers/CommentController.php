<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Requests\CommentRequest;
use App\Services\CommentService;
use App\Http\Resources\CommentResource;

class CommentController extends Controller
{

    protected $commentService;

    public function __construct(CommentService $commentService)
    {
        $this->commentService = $commentService;
    }

    public function index(Request $request)
    {
        $comments = Comment::query();
        $comments = $this->commentService->applySorting($request, $comments);

        return CommentResource::collection($comments);
    }


    public function store(CommentRequest $request)
    {
        $data = $request->validated();
        $this->commentService->createComment($data);

        return response()->json([
            'message' => 'Comment is saved!',
        ], 201);
    }
}