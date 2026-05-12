<?php

namespace App\Filament\Resources\PeriodeModels\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class PeriodeModelInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('id_tahun_ajar')
                    ->numeric(),
                TextEntry::make('tahun_ajar')
                    ->placeholder('-'),
                TextEntry::make('deskripsi')
                    ->placeholder('-'),
                TextEntry::make('is_active')
                    ->badge()
                    ->placeholder('-'),
            ]);
    }
}
