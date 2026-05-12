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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_user`(
	IN `p_nama` VARCHAR(50),
	IN `p_email_siswa` VARCHAR(100),
	IN `p_email_guru` VARCHAR(100),
	IN `p_role` VARCHAR(15),
	IN `p_password` VARCHAR(50),
	IN `p_remember_token` VARCHAR(50)
)
BEGIN
    INSERT INTO m_guru
    (nama, email_siswa, email_guru, role, password, remember_token)
    VALUES
    (p_nama, p_email_siswa, p_email_guru, p_role, p_password, p_remember_token);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS sp_insert_user");
    }
};
