<?php

namespace App\Filament\Resources\KandidatModels;

use App\Filament\Resources\KandidatModels\Pages\CreateKandidatModel;
use App\Filament\Resources\KandidatModels\Pages\EditKandidatModel;
use App\Filament\Resources\KandidatModels\Pages\ListKandidatModels;
use App\Filament\Resources\KandidatModels\Pages\ViewKandidatModel;
use App\Filament\Resources\KandidatModels\Schemas\KandidatModelForm;
use App\Filament\Resources\KandidatModels\Schemas\KandidatModelInfolist;
use App\Filament\Resources\KandidatModels\Tables\KandidatModelsTable;
use App\Models\KandidatModel;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class KandidatModelResource extends Resource
{
    protected static ?string $model = KandidatModel::class;
    protected static ?string $slug = 'kandidat';
    protected static ?string $modelLabel = 'Kandidat';
    protected static ?string $pluralModelLabel = 'Kandidat';
    public static function getNavigationGroup(): string
{
    return 'Voting Management';
}
    protected static ?int $navigationSort = 2;
    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'nomer_urut';

    public static function form(Schema $schema): Schema
    {
        return KandidatModelForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return KandidatModelInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return KandidatModelsTable::configure($table);
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
            'index' => ListKandidatModels::route('/'),
            'create' => CreateKandidatModel::route('/create'),
            'view' => ViewKandidatModel::route('/{record}'),
            'edit' => EditKandidatModel::route('/{record}/edit'),
        ];
    }
}
