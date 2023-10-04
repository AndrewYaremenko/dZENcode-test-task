<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Requests\CommentRequest;
use App\Services\CommentService;


class CommentController extends Controller
{

    protected $commentService;

    public function __construct(CommentService $commentService)
    {
        $this->commentService = $commentService;
    }

    public function index(Request $request)
    {
        $comments = $this->commentService->applySorting($request);

        return $comments;
    }


    public function store(CommentRequest $request)
    {
        
        $response = $this->commentService->createComment($request);

        return $response;
    }
}