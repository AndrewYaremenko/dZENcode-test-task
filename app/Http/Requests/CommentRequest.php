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
            'parent_id' => 'nullable|integer',
        ];
    }
}