<?php

namespace App\Filament\Resources\KandidatModels\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class KandidatModelForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nipd_ketua'),
                TextInput::make('nipd_wakil'),
                TextInput::make('id_organisasi')
                    ->numeric(),
                TextInput::make('id_tahun_ajaran')
                    ->numeric(),
                Textarea::make('visi')
                    ->columnSpanFull(),
                Textarea::make('misi')
                    ->columnSpanFull(),
                TextInput::make('foto'),
                TextInput::make('nomer_urut')
                    ->numeric(),
                Select::make('is_active')
                    ->options(['Y' => 'Y', 'N' => 'N']),
            ]);
    }
}
