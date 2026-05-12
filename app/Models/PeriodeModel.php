<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PeriodeModel extends Model
{
    protected $table = 'm_tahun_ajar';
    protected $primaryKey = 'id_tahun_ajar';
    public $timestamps = false;
    protected $fillable = [
        'tahun_ajar',
        'deskripsi',
        'is_active'
    ];
}
