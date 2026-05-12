<?php

namespace App\Filament\Resources\KandidatModels\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class KandidatModelsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nipd_ketua')
                    ->searchable(),
                TextColumn::make('nipd_wakil')
                    ->searchable(),
                TextColumn::make('id_organisasi')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('id_tahun_ajaran')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('foto')
                    ->searchable(),
                TextColumn::make('nomer_urut')
                    ->numeric()
                    ->sortable(),
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
