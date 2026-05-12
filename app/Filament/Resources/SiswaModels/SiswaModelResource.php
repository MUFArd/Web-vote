<?php

namespace App\Filament\Resources\SiswaModels;

use App\Filament\Resources\SiswaModels\Pages\CreateSiswaModel;
use App\Filament\Resources\SiswaModels\Pages\EditSiswaModel;
use App\Filament\Resources\SiswaModels\Pages\ListSiswaModels;
use App\Filament\Resources\SiswaModels\Pages\ViewSiswaModel;
use App\Filament\Resources\SiswaModels\Schemas\SiswaModelForm;
use App\Filament\Resources\SiswaModels\Schemas\SiswaModelInfolist;
use App\Filament\Resources\SiswaModels\Tables\SiswaModelsTable;
use App\Models\SiswaModel;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class SiswaModelResource extends Resource
{
    protected static ?string $model = SiswaModel::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'nipd';
    protected static ?string $slug = 'siswa';
    protected static ?string $modelLabel = 'siswa';
    protected static ?string $pluralModelLabel = 'siswa';
    public static function getNavigationGroup(): string
{
    return 'Siswa Management';
}

    public static function form(Schema $schema): Schema
    {
        return SiswaModelForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return SiswaModelInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return SiswaModelsTable::configure($table);
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
            'index' => ListSiswaModels::route('/'),
            'create' => CreateSiswaModel::route('/create'),
            'view' => ViewSiswaModel::route('/{record}'),
            'edit' => EditSiswaModel::route('/{record}/edit'),
        ];
    }
}
