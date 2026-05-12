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
        Schema::table('m_kandidat', function (Blueprint $table) {
            $table->foreign(['id_organisasi'], 'FK_m_kandidat_m_organisasi')->references(['id_organisasi'])->on('m_organisasi')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign(['id_tahun_ajaran'], 'FK_m_kandidat_m_tahun_ajar')->references(['id_tahun_ajar'])->on('m_tahun_ajar')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('m_kandidat', function (Blueprint $table) {
            $table->dropForeign('FK_m_kandidat_m_organisasi');
            $table->dropForeign('FK_m_kandidat_m_tahun_ajar');
        });
    }
};
