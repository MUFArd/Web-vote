<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseStatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class StatsOverviewWidget extends BaseStatsOverviewWidget
{
    protected static ?int $sort = 1;

    protected function getPollingInterval(): ?string
    {
        return '60s';
    }

    protected function getStats(): array
    {
        $stats = Cache::remember('stats_overview', now()->addMinutes(5), function () {
            return (array) DB::selectOne("
                SELECT
                    (SELECT COUNT(*) FROM m_user)       AS total_user,
                    (SELECT COUNT(*) FROM m_siswa)      AS total_siswa,
                    (SELECT COUNT(*) FROM m_guru)       AS total_guru,
                    (SELECT COUNT(*) FROM m_kandidat)   AS total_kandidat,
                    (SELECT COUNT(*) FROM m_tahun_ajar) AS total_periode,
                    (SELECT COUNT(*) FROM elections)    AS total_elections
            ");
        });

        return [
            Stat::make('Total Users', $stats['total_user'])
                ->description('Registered users')
                ->color('primary')
                ->icon('heroicon-o-users'),

            Stat::make('Total Siswa', $stats['total_siswa'])
                ->description('Registered students')
                ->color('success')
                ->icon('heroicon-o-academic-cap'),

            Stat::make('Total Guru', $stats['total_guru'])
                ->description('Registered teachers')
                ->color('warning')
                ->icon('heroicon-o-briefcase'),

            Stat::make('Total Kandidat', $stats['total_kandidat'])
                ->description('Registered candidates')
                ->color('danger')
                ->icon('heroicon-o-star'),

            Stat::make('Total Periode', $stats['total_periode'])
                ->description('Active periods')
                ->color('info')
                ->icon('heroicon-o-calendar'),

            Stat::make('Total Elections', $stats['total_elections'])
                ->description('Elections held')
                ->color('gray')
                ->icon('heroicon-o-clipboard-document-list'),
        ];
    }
}