<?php

use Illuminate\Support\Facades\Route;
use Admin\UserController;
use Admin\PostController;
use User\Profile;
use User\ProfilePost;
//use PostController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Route::prefix('user')->middleware(['auth', 'verified'])->name('user.')->group(function(){
  Route::resource('/users', Profile::class);
  Route::resource('/posts', ProfilePost::class);

});

Route::prefix('admin')->middleware(['auth','auth.isAdmin','verified'])->name('admin.')->group(function (){
  Route::resource('/users', UserController::class);
  Route::resource('/posts', PostController::class);
});

