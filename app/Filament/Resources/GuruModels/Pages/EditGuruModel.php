<?php

namespace App\Filament\Resources\GuruModels\Pages;

use App\Filament\Resources\GuruModels\GuruModelResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditGuruModel extends EditRecord
{
    protected static string $resource = GuruModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
