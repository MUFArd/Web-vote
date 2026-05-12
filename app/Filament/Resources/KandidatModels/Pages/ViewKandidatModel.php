<?php

namespace App\Filament\Resources\KandidatModels\Pages;

use App\Filament\Resources\KandidatModels\KandidatModelResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewKandidatModel extends ViewRecord
{
    protected static string $resource = KandidatModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
