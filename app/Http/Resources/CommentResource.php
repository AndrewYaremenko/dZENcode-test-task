<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

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
            'parent_id' => $this->parent_id,
            'attachment' => $this->generateDownloadLink(),
            'attachment_type' => $this->attachment_type,
            'child_comments' => CommentResource::collection($this->childComments),
        ];
    }

    private function generateDownloadLink()
    {
        if ($this->attachment) {
            $url = Storage::url('public/attachments/' . $this->attachment);
            return url($url);
        }

        return null;
    }
}