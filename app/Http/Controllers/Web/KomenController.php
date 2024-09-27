<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Api\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KomenController extends Controller
{
    public function store(Request $request)
    {
        $user = Auth::user();

        // Memeriksa apakah user sudah login
        if (!$user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $postIds = $request->validate([
            'post_id' => 'required',
            'pembuat_komen' => 'required',
            'isi_komen' => 'required',
        ]);

        $post = Post::findOrFail($postIds['post_id']);

        $komen = $post->komen()->create([
            'post_id' => $postIds['post_id'],
            'pembuat_komen' => $postIds['pembuat_komen'],
            'isi_komen' => $postIds['isi_komen'],
        ]);

        // return response()->json(['message' => 'Komen berhasil di posting'], 201);
        return redirect('/homepage');
    }
}
