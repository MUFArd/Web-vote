<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_organisasi`(
	IN `p_nama_organisasi` VARCHAR(50)
)
BEGIN
INSERT INTO m_organisasi (nama_organisasi) VALUES (p_nama_organisasi);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS sp_insert_organisasi");
    }
};
