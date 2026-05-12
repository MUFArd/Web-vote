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
        Schema::table('m_user', function (Blueprint $table) {
            $table->foreign(['email_guru'], 'FK__m_guru')->references(['email'])->on('m_guru')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['email_siswa'], 'FK__m_siswa')->references(['email'])->on('m_siswa')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('m_user', function (Blueprint $table) {
            $table->dropForeign('FK__m_guru');
            $table->dropForeign('FK__m_siswa');
        });
    }
};
