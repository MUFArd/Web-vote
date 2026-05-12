<?php

namespace App\Filament\Resources\GuruModels\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class GuruModelInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('nama_guru')
                    ->placeholder('-'),
                TextEntry::make('npwp')
                    ->placeholder('-'),
                TextEntry::make('no_telephone')
                    ->placeholder('-'),
                TextEntry::make('email')
                    ->label('Email address')
                    ->placeholder('-'),
                TextEntry::make('jenis_kelamin')
                    ->placeholder('-'),
                TextEntry::make('is_active')
                    ->placeholder('-'),
            ]);
    }
}
