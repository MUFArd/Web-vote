<?php

namespace App\Filament\Resources\PeriodeModels\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class PeriodeModelForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('tahun_ajar'),
                TextInput::make('deskripsi'),
                Select::make('is_active')
                    ->options(['Y' => 'Y', 'N' => 'N']),
            ]);
    }
}
