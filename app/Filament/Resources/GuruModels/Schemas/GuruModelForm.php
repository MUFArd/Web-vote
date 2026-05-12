<?php

namespace App\Filament\Resources\GuruModels\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class GuruModelForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama_guru'),
                TextInput::make('npwp'),
                TextInput::make('no_telephone')
                    ->tel(),
                TextInput::make('email')
                    ->label('Email address')
                    ->email(),
                TextInput::make('jenis_kelamin'),
                TextInput::make('is_active'),
            ]);
    }
}
