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
        DB::statement("CREATE VIEW `v_detail_vote` AS select `u`.`nama` AS `nama`,`k`.`id_kandidat` AS `id_kandidat`,`v`.`tgl_vote` AS `tgl_vote` from ((`db_vote1`.`trs_vote` `v` join `db_vote1`.`m_user` `u` on((`v`.`id_user` = `u`.`id_user`))) join `db_vote1`.`m_kandidat` `k` on((`v`.`id_kandidat` = `k`.`id_kandidat`)))");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("DROP VIEW IF EXISTS `v_detail_vote`");
    }
};
