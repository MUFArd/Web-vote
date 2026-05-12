<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GuruModel extends Model
{
    protected $table = 'm_guru';
    protected $primaryKey = 'id_guru';
    public $timestamps = false;
    protected $fillable = [
        'nama_guru',
        'npwp',
        'no_telephone',
        'email',
        'jenis_kelamin',
        'is_active'
    ];
}
