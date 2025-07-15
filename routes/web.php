<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    dump('test');
    return view('welcome');
});
