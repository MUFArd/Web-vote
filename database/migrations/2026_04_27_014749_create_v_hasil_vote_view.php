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
        DB::statement("CREATE VIEW `v_hasil_vote` AS select `k`.`id_kandidat` AS `id_kandidat`,`k`.`nipd_ketua` AS `nipd_ketua`,`k`.`nipd_wakil` AS `nipd_wakil`,count(`v`.`id_vote`) AS `total_suara` from (`db_vote1`.`m_kandidat` `k` left join `db_vote1`.`trs_vote` `v` on((`k`.`id_kandidat` = `v`.`id_kandidat`))) group by `k`.`id_kandidat`,`k`.`nipd_ketua`,`k`.`nipd_wakil` order by `total_suara` desc");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("DROP VIEW IF EXISTS `v_hasil_vote`");
    }
};
