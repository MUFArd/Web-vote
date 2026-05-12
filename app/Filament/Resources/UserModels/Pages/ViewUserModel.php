<?php

namespace App\Filament\Resources\UserModels\Pages;

use App\Filament\Resources\UserModels\UserModelResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewUserModel extends ViewRecord
{
    protected static string $resource = UserModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
