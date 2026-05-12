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
        $kandidat = DB::table('vw_kandidat_mpk')
            ->get();

        return view('mpk-vote', compact('kandidat'));
    }
    public function cek()
    {
        $user = session('user');

        $nipd = $user['nipd'] ?? null;
        $npwp = $user['npwp'] ?? null;

        $osis = DB::select('CALL sp_check_vote_osis(?, ?)', [$nipd, $npwp]);
        $mpk = DB::select('CALL sp_check_vote_mpk(?, ?)', [$nipd, $npwp]);
        $all = DB::select('CALL sp_check_vote_all(?, ?)', [$nipd, $npwp]);

        $sudahVoteMpk = $mpk[0]->total > 0;
        $sudahVoteOsis = $osis[0]->total > 0;
        $sudahVoteSemua = $all[0]->total > 1;
        
        if ($sudahVoteSemua) {
            session()->flush();
            return redirect('/')->with('info', 'Sudah Vote');
        }
        return view('osismpk', compact('sudahVoteOsis', 'sudahVoteMpk' ));

        }
}
