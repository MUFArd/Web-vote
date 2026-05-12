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
        Schema::create('m_kandidat', function (Blueprint $table) {
            $table->integer('id_kandidat', true);
            $table->string('nipd_ketua', 50)->nullable()->index('fk_m_kandidat_m_siswaa');
            $table->string('nipd_wakil', 50)->nullable()->index('nipd_wakil');
            $table->integer('id_organisasi')->nullable()->index('id_organisasi');
            $table->integer('id_tahun_ajaran')->nullable()->index('fk_m_kandidat_m_tahun_ajar');
            $table->text('visi')->nullable();
            $table->text('misi')->nullable();
            $table->string('foto')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_kandidat');
    }
};
