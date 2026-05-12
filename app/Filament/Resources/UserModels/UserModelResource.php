<?php

namespace App\Filament\Resources\UserModels;

use App\Filament\Resources\UserModels\Pages\CreateUserModel;
use App\Filament\Resources\UserModels\Pages\EditUserModel;
use App\Filament\Resources\UserModels\Pages\ListUserModels;
use App\Filament\Resources\UserModels\Pages\ViewUserModel;
use App\Filament\Resources\UserModels\Schemas\UserModelForm;
use App\Filament\Resources\UserModels\Schemas\UserModelInfolist;
use App\Filament\Resources\UserModels\Tables\UserModelsTable;
use App\Models\UserModel;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class UserModelResource extends Resource
{
    protected static ?string $model = UserModel::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $slug = 'user';
    protected static ?string $modelLabel = 'user';
    protected static ?string $pluralModelLabel = 'users';
    public static function getNavigationGroup(): string
{
    return 'User Management';
}
    protected static ?string $recordTitleAttribute = 'nama';

    public static function form(Schema $schema): Schema
    {
        return UserModelForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return UserModelInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return UserModelsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListUserModels::route('/'),
            'create' => CreateUserModel::route('/create'),
            'view' => ViewUserModel::route('/{record}'),
            'edit' => EditUserModel::route('/{record}/edit'),
        ];
    }
}
