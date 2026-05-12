<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KandidatModel extends Model
{
    protected $table = 'm_kandidat';
    protected $primaryKey = 'id_kandidat';
    public $timestamps = false;
    protected $fillable = [
        'nipd_ketua',
        'nipd_wakil',
        'id_organisasi',
        'id_tahun_ajaran',
        'visi',
        'misi',
        'foto',
        'nomer_urut'
    ];

}
