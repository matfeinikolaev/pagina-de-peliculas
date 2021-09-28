<?php

use Illuminate\Support\Facades\Route;

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
    return view('welcome');
});

Route::get('/movies', function () {
    return view('movies');
});

Route::get('/movie', function () {
    return view('movie');
});

Route::get('/actors', function () {
    return view('actors');
});

Route::get('/actor', function () {
    return view('actor');
});

Route::get('/genres', function () {
    return view('genres');
});

Route::get('/years', function () {
    return view('years');
});

Route::get('/saveActor', function () {
    return view('saveActor');
});

Route::get('/addMovie', function () {
    return view('addMovie');
});

Route::get('/deleteActor', function () {
    return view('deleteActor');
});

Route::get('/deleteMovie', function () {
    return view('deleteMovie');
});

