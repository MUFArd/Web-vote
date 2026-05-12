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
        Schema::create('m_tahun_ajar', function (Blueprint $table) {
            $table->integer('id_tahun_ajar')->primary();
            $table->string('tahun_ajar', 9)->nullable();
            $table->string('deskripsi')->nullable();
            $table->char('is_active', 1)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_tahun_ajar');
    }
};
