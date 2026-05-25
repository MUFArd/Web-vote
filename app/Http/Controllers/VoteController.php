<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;


use Illuminate\Http\Request;

class VoteController extends Controller
{
    public function indexosis()
    {
        return view('vote-osis');
    }

    public function vote()
    {
        $id_kandidat = request('id_kandidat');
        $user= session('user');

        if (!$id_kandidat) {
            return redirect('/osismpk')->with('error', 'Kandidat tidak ditemukan.');
        }

        if (!$user) {
            return redirect('/')->with('error', 'User tidak ditemukan.');
        }
        $id_user = $user['id_user'] ?? null;
        $role = $user['role'];

        $nipd = null;
        $npwp = null;

        if ($role == 'siswa') {
            $nipd = $user['nipd'] ?? null;
        } elseif ($role == 'guru') {
            $npwp = $user['npwp'] ?? null;
        }


        $vote = DB::select(
            'CALL sp_insert_vote(?, ?,?)',
            [$nipd, $npwp, $id_kandidat]
        );
        if (!$vote) {
            return redirect('/osismpk')->with('error', 'Gagal melakukan vote.');
        }
        
        return redirect('/osismpk')->with('success', 'Vote berhasil dilakukan.');
    }

    
    public function indexmpk()
    {
        return view('vote-mpk');
    }
}
