<?php

namespace App\Filament\Resources\GuruModels;

use App\Filament\Resources\GuruModels\Pages\CreateGuruModel;
use App\Filament\Resources\GuruModels\Pages\EditGuruModel;
use App\Filament\Resources\GuruModels\Pages\ListGuruModels;
use App\Filament\Resources\GuruModels\Pages\ViewGuruModel;
use App\Filament\Resources\GuruModels\Schemas\GuruModelForm;
use App\Filament\Resources\GuruModels\Schemas\GuruModelInfolist;
use App\Filament\Resources\GuruModels\Tables\GuruModelsTable;
use App\Models\GuruModel;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class GuruModelResource extends Resource
{
    protected static ?string $model = GuruModel::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'npwp';
    protected static ?string $slug = 'guru';
    protected static ?string $modelLabel = 'guru';
    protected static ?string $pluralModelLabel = 'guru';
    public static function getNavigationGroup(): string
{
    return 'Guru Management';
}

    public static function form(Schema $schema): Schema
    {
        return GuruModelForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return GuruModelInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return GuruModelsTable::configure($table);
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
            'index' => ListGuruModels::route('/'),
            'create' => CreateGuruModel::route('/create'),
            'view' => ViewGuruModel::route('/{record}'),
            'edit' => EditGuruModel::route('/{record}/edit'),
        ];
    }
}
