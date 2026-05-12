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
        Schema::create('trs_vote', function (Blueprint $table) {
            $table->integer('id_vote', true);
            $table->integer('id_user')->default(0)->index('id_users');
            $table->integer('id_kandidat')->default(0)->index('id_kandidat');
            $table->integer('id_tahun_ajaran')->nullable()->index('tahun_ajaran');
            $table->timestamp('tgl_vote')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trs_vote');
    }
};
