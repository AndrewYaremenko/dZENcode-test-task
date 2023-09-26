<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CommentResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'username' => $this->username,
            'email' => $this->email,
            'homepage' => $this->homepage,
            'date' => $this->date,
            'content' => $this->content,
            'file' => base64_encode($this->file),
            'parent_id' => $this->parent_id,
            'child_comments' => CommentResource::collection($this->childComments),
        ];
    }
}