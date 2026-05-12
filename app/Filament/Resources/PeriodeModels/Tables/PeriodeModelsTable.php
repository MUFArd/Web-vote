<?php

namespace App\Filament\Resources\PeriodeModels\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class PeriodeModelsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id_tahun_ajar')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('tahun_ajar')
                    ->searchable(),
                TextColumn::make('deskripsi')
                    ->searchable(),
                TextColumn::make('is_active')
                    ->badge(),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
