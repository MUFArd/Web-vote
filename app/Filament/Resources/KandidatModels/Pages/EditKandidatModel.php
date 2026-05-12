<?php

namespace App\Filament\Resources\KandidatModels\Pages;

use App\Filament\Resources\KandidatModels\KandidatModelResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditKandidatModel extends EditRecord
{
    protected static string $resource = KandidatModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
