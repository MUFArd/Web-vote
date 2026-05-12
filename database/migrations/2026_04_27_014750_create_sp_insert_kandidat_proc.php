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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_kandidat`(
	IN `p_nipd` INT,
	IN `p_tahun_ajaran` INT
)
BEGIN
INSERT INTO m_kandidat (nipd, tahun_ajaran) VALUES (p_nipd, p_tahun_ajaran);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS sp_insert_kandidat");
    }
};
