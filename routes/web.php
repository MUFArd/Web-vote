<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\HasilVoteController;
use App\Http\Controllers\KandidatController;
use App\Http\Controllers\VoteController;
use Illuminate\Support\Facades\Route;

Route::get('/', [AuthController::class, 'index']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/logout', [AuthController::class, 'logout']);
Route::get('/voteosis', [VoteController::class, 'indexosis']);
Route::post('/voteosis', [VoteController::class, 'vote']);
Route::get('/votempk', [VoteController::class, 'indexmpk']);
Route::post('/votempk', [VoteController::class, 'vote']);
Route::get('/view-kandidat-progress', [HasilVoteController::class, 'ViewKandidat']);
Route::get('/vote-data', [HasilVoteController::class, 'getVoteData']);



Route::middleware(['auth.session'])->group(function () {

    Route::get('/osismpk', [KandidatController::class, 'cek']);
    Route::get('/osis-vote', [KandidatController::class, 'indexosis']);
    Route::get('/mpk-vote', [KandidatController::class, 'indexmpk']);

});