<?php

namespace App\Filament\Resources\PeriodeModels;

use App\Filament\Resources\PeriodeModels\Pages\CreatePeriodeModel;
use App\Filament\Resources\PeriodeModels\Pages\EditPeriodeModel;
use App\Filament\Resources\PeriodeModels\Pages\ListPeriodeModels;
use App\Filament\Resources\PeriodeModels\Pages\ViewPeriodeModel;
use App\Filament\Resources\PeriodeModels\Schemas\PeriodeModelForm;
use App\Filament\Resources\PeriodeModels\Schemas\PeriodeModelInfolist;
use App\Filament\Resources\PeriodeModels\Tables\PeriodeModelsTable;
use App\Models\PeriodeModel;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class PeriodeModelResource extends Resource
{
    protected static ?string $model = PeriodeModel::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'tahun_ajar';
    protected static ?string $slug = 'tahun_ajar';
    protected static ?string $modelLabel = 'tahun_ajar';
    protected static ?string $navigationLabel = 'Periode';
    protected static ?string $pluralModelLabel = 'tahun_ajar';
    public static function getNavigationGroup(): string
{
    return 'Periode Management';
}

    public static function form(Schema $schema): Schema
    {
        return PeriodeModelForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return PeriodeModelInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return PeriodeModelsTable::configure($table);
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
            'index' => ListPeriodeModels::route('/'),
            'create' => CreatePeriodeModel::route('/create'),
            'view' => ViewPeriodeModel::route('/{record}'),
            'edit' => EditPeriodeModel::route('/{record}/edit'),
        ];
    }
}
