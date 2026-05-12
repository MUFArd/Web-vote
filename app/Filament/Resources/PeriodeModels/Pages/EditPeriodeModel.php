<?php

namespace App\Filament\Resources\PeriodeModels\Pages;

use App\Filament\Resources\PeriodeModels\PeriodeModelResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditPeriodeModel extends EditRecord
{
    protected static string $resource = PeriodeModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
