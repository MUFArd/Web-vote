<?php

namespace App\Filament\Resources\KandidatModels\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class KandidatModelInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('nipd_ketua')
                    ->placeholder('-'),
                TextEntry::make('nipd_wakil')
                    ->placeholder('-'),
                TextEntry::make('id_organisasi')
                    ->numeric()
                    ->placeholder('-'),
                TextEntry::make('id_tahun_ajaran')
                    ->numeric()
                    ->placeholder('-'),
                TextEntry::make('visi')
                    ->placeholder('-')
                    ->columnSpanFull(),
                TextEntry::make('misi')
                    ->placeholder('-')
                    ->columnSpanFull(),
                TextEntry::make('foto')
                    ->placeholder('-'),
                TextEntry::make('nomer_urut')
                    ->numeric()
                    ->placeholder('-'),
                TextEntry::make('is_active')
                    ->badge()
                    ->placeholder('-'),
            ]);
    }
}
