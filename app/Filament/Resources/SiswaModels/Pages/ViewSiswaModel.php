<?php

namespace App\Filament\Resources\SiswaModels\Pages;

use App\Filament\Resources\SiswaModels\SiswaModelResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewSiswaModel extends ViewRecord
{
    protected static string $resource = SiswaModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
