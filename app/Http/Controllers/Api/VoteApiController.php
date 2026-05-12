<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VoteApiController extends Controller
{
    public function voteOsis(Request $request)
    {
        $id_kandidat = $request->id_kandidat;

        if (!$id_kandidat) {
            return response()->json(['status' => false, 'message' => 'Kandidat Gagal Ditemukan'], 400);
        }

        $user = $request->user();
        $role = $user->role;

        $nipd = null;
        $npwp = null;

        if ($role == 'siswa') {
            $nipd = $user->nipd ?? null;
        } elseif ($role == 'guru') {
            $npwp = $user->npwp ?? null;
        }

        $cek = DB::select('CALL sp_check_vote_osis(?, ?)', [$nipd, $npwp]);
        if ($cek[0]->total > 0) {
            return response()->json([
                'status'  => false,
                'message' => 'Anda sudah melakukan vote OSIS'
            ], 409);
        }


        $vote = DB::select('CALL sp_insert_vote(?, ?,?)', [$nipd, $npwp, $id_kandidat]);
        if (!$vote) {
            return response()->json(['status' => false, 'message' => 'Gagal Melakukan VOte'], 400);
        }
        return response()->json(['status' => true, 'message' => 'Berhasil Melakukan Vote'], 200);
    }
    public function voteMpk(Request $request)
    {
        $id_kandidat = $request->id_kandidat;

        if (!$id_kandidat) {
            return response()->json([
                'status'  => false,
                'message' => 'Kandidat tidak ditemukan'
            ], 400);
        }

        $user = $request->user();
        $role = $user->role;

        $nipd = null;
        $npwp = null;

        if ($role == 'siswa') {
            $nipd = $user->nipd ?? null;
        } elseif ($role == 'guru') {
            $npwp = $user->npwp ?? null;
        }
        $cek = DB::select('CALL sp_check_vote_mpk(?, ?)', [$nipd, $npwp]);
        if ($cek[0]->total > 0) {
            return response()->json([
                'status'  => false,
                'message' => 'Anda sudah melakukan vote MPK'
            ], 409);
        }

        $vote = DB::select('CALL sp_insert_vote(?, ?, ?)', [$nipd, $npwp, $id_kandidat]);

        if (!$vote) {
            return response()->json([
                'status'  => false,
                'message' => 'Gagal melakukan vote'
            ], 500);
        }

        return response()->json([
            'status'  => true,
            'message' => 'Vote MPK berhasil'
        ], 201);
    }
}
