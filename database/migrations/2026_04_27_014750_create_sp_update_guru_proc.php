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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_guru`(
	IN `p_id` INT,
	IN `p_nama` VARCHAR(50),
	IN `p_telp` VARCHAR(15),
	IN `p_jk` VARCHAR(50),
	IN `p_active` VARCHAR(1)
)
BEGIN
    UPDATE m_guru
    SET id_guru = p_id,
        nama_guru = p_nama,
        no_telephone = p_telp,
        jenis_kelamin = p_jk,
        is_active = p_active
    WHERE id_guru = p_id;
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS sp_update_guru");
    }
};
