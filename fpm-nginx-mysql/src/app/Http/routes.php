<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return $app->welcome();
});

use App\User;

$app->get('/user/{id}', function ($id) use ($app) {
    /*$usr = new User();
    $usr->name = 'Marc';
    $usr->email = 'markcial@gmail.com';
    $usr->save();
    return 'yay!';*/
    $user = User::query()->findOrFail($id);
    return $user;
});

$app->get('/user', function () use ($app) {

    $users = User::all();
    return $users;
});

$app->post('/user', function () use ($app) {
    $user = new User();
    $user->name = Request::input('name');
    $user->email = Request::input('email');
    $user->save();

    return $user;
});
