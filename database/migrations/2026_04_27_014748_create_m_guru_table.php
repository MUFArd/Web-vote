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
        Schema::create('m_guru', function (Blueprint $table) {
            $table->integer('id_guru', true);
            $table->string('nama_guru', 100)->nullable();
            $table->string('no_telephone', 15)->nullable();
            $table->string('email', 100)->nullable()->index('email');
            $table->string('jenis_kelamin', 50)->nullable();
            $table->char('is_active', 50)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_guru');
    }
};
