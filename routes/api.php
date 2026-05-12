<?php

use App\Http\Controllers\Api\AuthApiController;
use App\Http\Controllers\Api\KandidatApiController;
use App\Http\Controllers\Api\VoteApiController;
use Illuminate\Support\Facades\Route;

Route::post('/login', [AuthApiController::class, 'login']);
Route::get('/unauthorized', function () {
    return response()->json([
        'status'  => false,
        'message' => 'Anda belum login, silakan login terlebih dahulu'
    ], 401);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout',          [AuthApiController::class, 'logout']);
    Route::get('/cek-status',       [KandidatApiController::class, 'cekStatus']);
    Route::get('/kandidat/osis',    [KandidatApiController::class, 'indexOsis']);
    Route::get('/kandidat/mpk',     [KandidatApiController::class, 'indexMpk']);
    Route::post('/vote/osis',       [VoteApiController::class, 'voteOsis']);
    Route::post('/vote/mpk',        [VoteApiController::class, 'voteMpk']);
});