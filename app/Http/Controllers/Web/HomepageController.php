<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Api\Controller;
use App\Models\Post;
use Illuminate\Http\Request;

class HomepageController extends Controller
{
    public function index(Request $request)
    {
        // Ambil semua postingan untuk ditampilkan di halaman
        $posts = Post::with('pembuatPost')->get();

        // Cek apakah ada ID yang diterima dari request (misalnya setelah klik)
        $postingan = null;
        if ($request->has('post_id')) {
            $postingan = Post::with('komen')->find($request->input('post_id'));
        }

        return view('app.homepage', compact('posts', 'postingan'));
    }
}
