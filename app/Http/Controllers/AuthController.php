<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    public function index()
    {
        return view('index');
    }

    public function login(Request $request)
    {
        $input = $request->username;
        $password = $request->password;

        $user = DB::select('CALL sp_login(?)', [
            $input
        ]);

        if (!$user || count($user) == 0) {
            return back()->withInput()->with('error', 'Username atau password salah');
        }

        $user = $user[0];

        if (!Hash::check($password, $user->password)) {

            return back()->withInput()->with('error', 'Username atau password salah');
        }

        Session::put('user', [
            'id_user' => $user->id_user,
            'nipd' => $user->nipd,
            'npwp' => $user->npwp,
            'nama' => $user->nama,
            'role' => $user->role
        ]);

        if ($user->role == 'siswa' || $user->role == 'guru') {
            return redirect('/osismpk');
        }

        return redirect('/admin');
    }


    public function logout()
    {
        Session::forget('user');
        Session::flush();

        return redirect('/');
    }
}
