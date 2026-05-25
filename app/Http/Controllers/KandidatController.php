<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KandidatController extends Controller
{
    public function indexosis()
    {
        $kandidat = DB::table('vw_kandidat_osis')->get();
        return view('osis-vote', compact('kandidat'));
    }

    public function indexmpk()
    {
        $kandidat = DB::table('vw_kandidat_mpk')->get();
        return view('mpk-vote', compact('kandidat'));
    }

    public function cek()
    {
        $user = session('user');

        $nipd = $user['nipd'] ?? null;
        $npwp = $user['npwp'] ?? null;

        $result = DB::select('CALL sp_check_vote_all(?, ?)', [$nipd, $npwp]);

        $sudahVoteMpk  = $result[0]->total_mpk > 0;
        $sudahVoteOsis = $result[0]->total_osis > 0;
        $sudahVoteSemua = $result[0]->total_all > 1;

        if ($sudahVoteSemua) {
            session()->flush();
            return redirect('/')->with('info', 'Sudah Vote');
        }

        return view('osismpk', compact('sudahVoteOsis', 'sudahVoteMpk'));
    }
}