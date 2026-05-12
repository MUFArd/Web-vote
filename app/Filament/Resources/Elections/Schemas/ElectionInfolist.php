<?php

namespace App\Filament\Resources\Elections\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class ElectionInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            TextEntry::make('title'),
            TextEntry::make('description'),
            TextEntry::make('start_at')->dateTime('d M Y, H:i'),
            TextEntry::make('end_at')->dateTime('d M Y, H:i'),
            TextEntry::make('status')->badge(),
        ]);
    }
}