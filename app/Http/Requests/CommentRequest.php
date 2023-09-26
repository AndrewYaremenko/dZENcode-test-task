<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CommentRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules()
    {
        return [
            'name' => 'required|string',
            'email' => 'required|email',
            'homepage' => 'nullable|url',
            'content' => 'required|string',
            'file' => 'nullable|file|max:10240',
            'parent_id' => 'nullable',
        ];
    }
}