<?php

namespace App\Filament\Resources\UserModels\Pages;

use App\Filament\Resources\UserModels\UserModelResource;
use Filament\Resources\Pages\CreateRecord;

class CreateUserModel extends CreateRecord
{
    protected static string $resource = UserModelResource::class;
}
