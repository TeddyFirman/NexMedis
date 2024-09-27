<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Api\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index() {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $posts = Post::where('pembuat_post', $user->id)->with('pembuatPost')->get();


        return view('app.post.index', compact([
            'posts',
        ]));
    }

    public function store(Request $request)
    {
        // dd('Metode store dipanggil');

        $user = Auth::user();

        // Memeriksa apakah user sudah login
        if (!$user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $request->validate([
            'judulPost' => 'required|string',
            'postingan' => 'required|string',
            'pembuat_post' => 'required',
            'fileImage' => 'nullable|image|mimes:jpg,png,jpeg|max:1024',
        ]);

        $filename = null;

        if ($request->hasFile('fileImage')) {
            $file = $request->file('fileImage');
            $ext = $file->getClientOriginalExtension();
            $filename = time().'.'. $ext;

            $file->move('posts/images/', $filename);
        }

        Post::create([
            'judulPost' => $request->judulPost,
            'postingan' => $request->postingan,
            'pembuat_post' => Auth::user()->id,
            'fileImage' => $filename,
        ]);

        return redirect()->back();
    }

    public function update(Request $request, $id) {
        $post = Post::findOrFail($id);

        $user = Auth::user();

        if ($post->pembuatPost != $user->id) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $request->validate([
            'judulPost' => 'nullable|string',
            'postingan' => 'nullable|string',
            'fileImage' => 'nullable|image|mimes:jpg,png,jpeg|max:1024',
        ]);

        if ($request->hasFile('fileImage')) {
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

        return redirect('/buat-postingan');
    }

    public function destroy($id)
    {
        $post = Post::findOrFail($id);

        $user = Auth::user();

        if ($post->pembuat_post != $user->id) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        if ($post->file) {
            $oldFilePath = public_path('posts/images/' . $post->file);
            if (file_exists($oldFilePath)) {
                unlink($oldFilePath);
            }
        }

        $post->delete();

        return redirect('/buat-postingan');
    }

}
