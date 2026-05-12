<?php

namespace App\Filament\Resources\UserModels\Pages;

use App\Filament\Resources\UserModels\UserModelResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditUserModel extends EditRecord
{
    protected static string $resource = UserModelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
