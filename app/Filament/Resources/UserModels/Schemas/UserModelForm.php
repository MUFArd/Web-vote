<?php

namespace App\Filament\Resources\UserModels\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class UserModelForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama'),
                TextInput::make('nipd'),
                TextInput::make('npwp'),
                Select::make('role')
                    ->options(['siswa' => 'Siswa', 'guru' => 'Guru', 'admin' => 'Admin'])
                    ->default('siswa'),
                TextInput::make('password')
                    ->password(),
                Select::make('is_active')
                    ->options(['Y' => 'Y', 'N' => 'N']),
            ]);
    }
}
