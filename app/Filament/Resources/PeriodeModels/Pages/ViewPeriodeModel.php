<?php

namespace App\Filament\Resources\PeriodeModels\Pages;

use App\Filament\Resources\PeriodeModels\PeriodeModelResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewPeriodeModel extends ViewRecord
{
    protected static string $resource = PeriodeModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
