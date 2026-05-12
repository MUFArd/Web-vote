<?php

namespace App\Filament\Resources\GuruModels\Pages;

use App\Filament\Resources\GuruModels\GuruModelResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListGuruModels extends ListRecords
{
    protected static string $resource = GuruModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
