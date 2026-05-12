<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseStatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\UserModel;
use App\Models\SiswaModel;
use App\Models\GuruModel;
use App\Models\KandidatModel;
use App\Models\PeriodeModel;
use App\Models\Election;

class StatsOverviewWidget extends BaseStatsOverviewWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Total Users', UserModel::count())
                ->description('Registered users')
                ->color('primary')
                ->icon('heroicon-o-users'),

            Stat::make('Total Siswa', SiswaModel::count())
                ->description('Registered students')
                ->color('success')
                ->icon('heroicon-o-academic-cap'),

            Stat::make('Total Guru', GuruModel::count())
                ->description('Registered teachers')
                ->color('warning')
                ->icon('heroicon-o-briefcase'),

            Stat::make('Total Kandidat', KandidatModel::count())
                ->description('Registered candidates')
                ->color('danger')
                ->icon('heroicon-o-star'),

            Stat::make('Total Periode', PeriodeModel::count())
                ->description('Active periods')
                ->color('info')
                ->icon('heroicon-o-calendar'),

            Stat::make('Total Elections', Election::count())
                ->description('Elections held')
                ->color('gray')
                ->icon('heroicon-o-clipboard-document-list'),
        ];
    }
}