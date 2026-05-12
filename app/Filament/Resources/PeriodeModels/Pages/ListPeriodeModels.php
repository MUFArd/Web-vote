<?php

namespace App\Filament\Resources\PeriodeModels\Pages;

use App\Filament\Resources\PeriodeModels\PeriodeModelResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListPeriodeModels extends ListRecords
{
    protected static string $resource = PeriodeModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
