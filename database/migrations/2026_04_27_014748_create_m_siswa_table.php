<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('m_siswa', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('nama_siswa', 100)->nullable()->index('nama_siswa');
            $table->string('nipd', 20)->nullable()->index('nipd');
            $table->string('nomor_telefon', 20)->nullable();
            $table->string('alamat')->nullable();
            $table->string('email', 100)->nullable()->unique('email');
            $table->char('jenis_kelamin', 1)->nullable();
            $table->integer('kelas')->nullable();
            $table->string('jurusan', 10)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_siswa');
    }
};
