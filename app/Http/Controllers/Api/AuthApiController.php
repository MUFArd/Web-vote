<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\UserModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthApiController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        $user = DB::select('CALL sp_login(?)', [$request->username]);

        if (!$user || count($user) == 0) {
            return response()->json([
                'status'  => false,
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $user = $user[0];

        if (!Hash::check($request->password, $user->password)) {
            return response()->json([
                'status'  => false,
                'message' => 'Password salah'
            ], 401);
        }

        $userModel = UserModel::where('id_user', $user->id_user)->first();

        $userModel->tokens()->delete();

        $token = $userModel->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status'  => true,
            'message' => 'Login berhasil',
            'token'   => $token,
            'user'    => [
                'id_user' => $user->id_user,
                'nipd'    => $user->nipd,
                'npwp'    => $user->npwp,
                'nama'    => $user->nama,
                'role'    => $user->role,
            ]
        ], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status'  => true,
            'message' => 'Logout berhasil'
        ], 200);
    }
}