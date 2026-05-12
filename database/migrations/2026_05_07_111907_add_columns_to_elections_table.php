<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  public function up(): void
{
    Schema::table('elections', function (Blueprint $table) {
        $table->unsignedInteger('id_tahun_ajar');
        $table->date('tanggal_mulai');
        $table->date('tanggal_selesai');
        $table->enum('status', ['aktif', 'tidak aktif'])->default('tidak aktif');

        $table->foreign('id_tahun_ajar')->references('id_tahun_ajar')->on('m_tahun_ajar');
    });
}

public function down(): void
{
    Schema::table('elections', function (Blueprint $table) {
        $table->dropColumn(['nama_election', 'id_organisasi', 'id_tahun_ajaran', 'tanggal_mulai', 'tanggal_selesai', 'status']);
    });
}
};
