<?php

namespace App\Filament\Resources\SiswaModels\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class SiswaModelInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('id')
                    ->label('ID')
                    ->numeric(),
                TextEntry::make('nama_siswa')
                    ->placeholder('-'),
                TextEntry::make('nipd')
                    ->placeholder('-'),
                TextEntry::make('nomor_telefon')
                    ->placeholder('-'),
                TextEntry::make('alamat')
                    ->placeholder('-'),
                TextEntry::make('email')
                    ->label('Email address')
                    ->placeholder('-'),
                TextEntry::make('jenis_kelamin')
                    ->placeholder('-'),
                TextEntry::make('kelas')
                    ->numeric()
                    ->placeholder('-'),
                TextEntry::make('jurusan')
                    ->placeholder('-'),
                TextEntry::make('is_active')
                    ->badge()
                    ->placeholder('-'),
            ]);
    }
}
