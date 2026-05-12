<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiswaModel extends Model
{
    protected $table = 'm_siswa';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = [
        'nama_siswa',
        'nipd',
        'nomer_telefon',
        'alamat',
        'email',
        'jenis_kelamin',
        'kelas',
        'jurusan',
        'is_active' 
    ];
}
