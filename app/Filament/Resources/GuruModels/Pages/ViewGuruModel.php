<?php

namespace App\Filament\Resources\GuruModels\Pages;

use App\Filament\Resources\GuruModels\GuruModelResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewGuruModel extends ViewRecord
{
    protected static string $resource = GuruModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
