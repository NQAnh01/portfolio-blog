<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('api')->group(function () {
    Route::prefix('posts')->group(base_path('routes/api/posts.php'));
    // Route::prefix('users')->group(base_path('routes/api/users.php'));
});
