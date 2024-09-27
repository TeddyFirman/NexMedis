<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Post extends Model
{
    use HasFactory;

    protected $table = 'posts';

    protected $fillable = [
        'judulPost',
        'postingan',
        'pembuat_post',
        'fileImage',
    ];

    public function pembuatPost()
    {
        return $this->belongsTo(User::class, 'pembuat_post', 'id');
    }

    public function komen()
    {
        return $this->hasMany(Komen::class, 'post_id', 'id');
    }

    public function likes()
    {
        return $this->belongsToMany(User::class, 'likes')->withTimestamps();
    }

    public function likeCount()
    {
        return $this->likes()->count();
    }
}
