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
        Schema::table('trs_vote', function (Blueprint $table) {
            $table->foreign(['id_tahun_ajaran'], 'FK_trs_kandidat_m_tahun_ajar')->references(['id_tahun_ajar'])->on('m_tahun_ajar')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign(['id_kandidat'], 'FK_trs_vote_m_kandidat')->references(['id_kandidat'])->on('m_kandidat')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign(['id_user'], 'FK_trs_vote_m_user')->references(['id_user'])->on('m_user')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('trs_vote', function (Blueprint $table) {
            $table->dropForeign('FK_trs_kandidat_m_tahun_ajar');
            $table->dropForeign('FK_trs_vote_m_kandidat');
            $table->dropForeign('FK_trs_vote_m_user');
        });
    }
};
