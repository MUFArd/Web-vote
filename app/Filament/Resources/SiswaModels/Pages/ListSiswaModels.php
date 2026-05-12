<?php

namespace App\Filament\Resources\SiswaModels\Pages;

use App\Filament\Resources\SiswaModels\SiswaModelResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListSiswaModels extends ListRecords
{
    protected static string $resource = SiswaModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
