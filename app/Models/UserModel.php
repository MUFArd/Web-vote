<?php

namespace App\Models;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
class UserModel extends Authenticatable
{
    use HasApiTokens;
    protected $table = 'm_user';
    protected $primaryKey = 'id_user';
    public $timestamps = false;
    protected $fillable = [
        'nama',
        'email_siswa',
        'email_guru',
        'role',
        'password',
        'remember_token'
    ];
    public function getAuthIdentifierName()
    {
        return 'id_user';
    }
}
