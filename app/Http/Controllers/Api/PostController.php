<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\DetailPostResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function store(Request $request)
    {
        $user = Auth::user();

        // Memeriksa apakah user sudah login
        if (!$user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $request->validate([
            'judulPost' => 'required|string',
            'postingan' => 'required',
            'pembuat_post' => 'required',
            'fileImage' => 'nullable|image|mimes:jpg,png,jpeg|max:1024',
        ]);

        $filename = null;

        if ($request->hasFile('fileImage')) {
            $file = $request->file('fileImage');
            $ext = $file->getClientOriginalExtension();
            $filename = time() .'.'. $ext;

            $file->move('posts/images/', $filename);
        }

        Post::create([
            'judulPost' => $request->judulPost,
            'postingan' => $request->postingan,
            'pembuat_post' => Auth::user()->id,
            'fileImage' => $filename,
        ]);

        return response()->json(['message' => 'Postingan berhasil dibuat'], 201);
    }

    public function update(Request $request, $id)
    {
        $post = Post::findOrFail($id);

        // Memeriksa apakah user memiliki hak untuk mengupdate
        if ($post->pembuat_post != Auth::user()->id) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $request->validate([
            'judulPost' => 'nullable|string',
            'postingan' => 'nullable',
            'fileImage' => 'nullable|image|mimes:jpg,png,jpeg|max:1024',
        ]);

        if ($request->hasFile('fileImage')) {
            // Hapus file lama jika ada
            if ($post->fileImage) {
                $oldFilePath = public_path('posts/images/' . $post->fileImage);
                if (file_exists($oldFilePath)) {
                    unlink($oldFilePath);
                }
            }

            $file = $request->file('fileImage');
            $ext = $file->getClientOriginalExtension();
            $filename = time() . '.' . $ext;
            $file->move('posts/images/', $filename);

            $post->fileImage = $filename;
        }

        $post->update([
            'judulPost' => $request->input('judulPost', $post->judulPost),
            'postingan' => $request->input('postingan', $post->postingan),
        ]);

        return response()->json(['message' => 'Postingan berhasil diperbarui'], 200);
    }

    public function destroy($id)
    {
        $post = Post::findOrFail($id);

        if ($post->pembuat_post != Auth::user()->id) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        if ($post->file) {
            $oldFilePath = public_path('posts/images/' . $post->file);
            if (file_exists($oldFilePath)) {
                unlink($oldFilePath);
            }
        }

        $post->delete();

        return response()->json(['message' => 'Postingan berhasil dihapus'], 200);
    }

    // * Lihat Detail Postingan + (Komentar)
    public function read($id)
    {
        $postingan =  Post::with('komen')->findOrFail($id);

        return new DetailPostResource($postingan);
    }
}
