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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_guru`(
	IN `p_nama` VARCHAR(100),
	IN `p_telp` VARCHAR(15),
	IN `p_jk` CHAR(50),
	IN `p_active` CHAR(50)
)
BEGIN
    INSERT INTO m_guru
    (nama_guru, no_telephone, jenis_kelamin, is_active)
    VALUES
    (p_nama, p_telp, p_jk, p_active);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS sp_insert_guru");
    }
};
