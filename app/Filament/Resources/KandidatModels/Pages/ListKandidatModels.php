<?php

namespace App\Filament\Resources\KandidatModels\Pages;

use App\Filament\Resources\KandidatModels\KandidatModelResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListKandidatModels extends ListRecords
{
    protected static string $resource = KandidatModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
