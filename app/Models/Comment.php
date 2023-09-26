<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = [
        'username',
        'email',
        'homepage',
        'date',
        'content',
        'parent_id'
    ];

    public function parentComment()
    {
        return $this->belongsTo(Comment::class, 'parent_id');
    }

    public function childComments()
    {
        return $this->hasMany(Comment::class, 'parent_id')->with('childComments');
    }
}
