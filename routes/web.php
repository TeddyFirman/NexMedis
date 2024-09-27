<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Web\DashboardAdminController;
use App\Http\Controllers\Web\HomepageController;
use App\Http\Controllers\Web\KomenController;
use App\Http\Controllers\Web\PostController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'user'])->group(function () {
    Route::get('/homepage', [HomepageController::class, 'index'])->name('homepage');
    Route::get('/buat-postingan', [PostController::class, 'index'])->name('buat');
    Route::post('/buat-postingan', [PostController::class, 'store']);
    Route::put('edit-postingan/{id}', [PostController::class, 'update']);
    Route::delete('hapus-postingan/{id}', [PostController::class, 'destroy']);

    //Komentar
    // * Lihat detail postingan
    Route::get('postingan/{id}', [HomepageController::class, 'read']);

    //Todo: CRUD Komen
    Route::post('buat-komen', [KomenController::class, 'store']);
    Route::put('edit-komentar/{id}', [KomenController::class, 'update']);
    Route::delete('hapus-komentar/{id}', [KomenController::class, 'destroy']);
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
