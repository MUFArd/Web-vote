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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_vote`(
	IN `p_id_dvt` INT,
	IN `p_id_tahun_ajaran` INT,
	IN `p_tgl_vote` TIMESTAMP
)
BEGIN
INSERT INTO trs_vote (id_dvt, id_tahun_ajaran, tgl_vote) VALUES (p_id_dvt, p_id_tahun_ajaran, p_tgl_vote);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS sp_insert_vote");
    }
};
