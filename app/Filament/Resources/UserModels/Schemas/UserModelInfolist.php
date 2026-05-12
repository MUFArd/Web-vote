<?php

namespace App\Filament\Resources\UserModels\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class UserModelInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('id_user')
                    ->numeric(),
                TextEntry::make('nama')
                    ->placeholder('-'),
                TextEntry::make('nipd')
                    ->placeholder('-'),
                TextEntry::make('npwp')
                    ->placeholder('-'),
                TextEntry::make('role')
                    ->badge()
                    ->placeholder('-'),
                TextEntry::make('is_active')
                    ->badge()
                    ->placeholder('-'),
            ]);
    }
}
