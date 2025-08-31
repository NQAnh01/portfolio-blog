<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;

Route::get('/', [PostController::class, 'getAll']);
Route::get('/{id}', [PostController::class, 'show']);
Route::post('/', [PostController::class, 'store']);
