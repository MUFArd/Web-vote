<?php

namespace App\Filament\Resources\SiswaModels\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class SiswaModelForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama_siswa'),
                TextInput::make('nipd'),
                TextInput::make('nomor_telefon')
                    ->tel(),
                TextInput::make('alamat'),
                TextInput::make('email')
                    ->label('Email address')
                    ->email(),
                TextInput::make('jenis_kelamin'),
                TextInput::make('kelas')
                    ->numeric(),
                TextInput::make('jurusan'),
                Select::make('is_active')
                    ->options(['Y' => 'Y', 'N' => 'N']),
            ]);
    }
}
