<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HasilVoteController extends Controller
{
    public function ViewKandidat()
    {
        $kandidat_osis = DB::table('vw_progress_osis')->get();
        $kandidat_mpk  = DB::table('vw_progress_mpk')->get();

        $kandidat_osis_periode = DB::table('vw_progress_osis_periode')
            ->get()
            ->groupBy('id_tahun_ajaran');

        $kandidat_mpk_periode = DB::table('vw_progress_mpk_periode')
            ->get()
            ->groupBy('id_tahun_ajaran');

        return view('progress-vote', compact(
            'kandidat_osis',
            'kandidat_mpk',
            'kandidat_osis_periode',
            'kandidat_mpk_periode'
        ));
    }

    public function getVoteData()
    {
        $kandidat_osis = DB::table('vw_progress_osis')->get();
        $kandidat_mpk  = DB::table('vw_progress_mpk')->get();

        return response()->json([
            'osis' => $kandidat_osis,
            'mpk'  => $kandidat_mpk,
        ]);
    }
}