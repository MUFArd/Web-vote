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
        Schema::create('m_user', function (Blueprint $table) {
            $table->integer('id_user')->primary();
            $table->string('nama', 50)->nullable();
            $table->string('email_siswa', 100)->nullable()->index('email_murid');
            $table->string('email_guru', 100)->nullable()->index('email_guru');
            $table->string('role', 15)->nullable();
            $table->string('password', 20)->nullable();
            $table->string('remember_token', 50)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_user');
    }
};
