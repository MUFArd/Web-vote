<?php

namespace App\Filament\Resources\SiswaModels\Pages;

use App\Filament\Resources\SiswaModels\SiswaModelResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditSiswaModel extends EditRecord
{
    protected static string $resource = SiswaModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
