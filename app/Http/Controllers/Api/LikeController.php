<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{
    public function like($postId)
    {
        $user = Auth::user();
        $post = Post::findOrFail($postId);

        if ($user->likedPosts()->where('post_id', $postId)->exists()) {
            return response()->json(['message' => 'Post already liked'], 400);
        }

        $user->likedPosts()->attach($postId);

        return response()->json(['message' => 'Post liked successfully'], 200);
    }

    // Unlike a post
    public function unlike($postId)
    {
        $user = Auth::user();
        $post = Post::findOrFail($postId);

        if (!$user->likedPosts()->where('post_id', $postId)->exists()) {
            return response()->json(['message' => 'Post not liked yet'], 400);
        }

        $user->likedPosts()->detach($postId);

        return response()->json(['message' => 'Post unliked successfully'], 200);
    }
}
