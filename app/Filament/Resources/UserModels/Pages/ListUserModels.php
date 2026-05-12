<?php

namespace App\Filament\Resources\UserModels\Pages;

use App\Filament\Resources\UserModels\UserModelResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListUserModels extends ListRecords
{
    protected static string $resource = UserModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
