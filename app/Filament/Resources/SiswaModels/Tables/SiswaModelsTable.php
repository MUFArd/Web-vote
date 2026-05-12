<?php

namespace App\Filament\Resources\SiswaModels\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class SiswaModelsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')
                    ->label('ID')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('nama_siswa')
                    ->searchable(),
                TextColumn::make('nipd')
                    ->searchable(),
                TextColumn::make('nomor_telefon')
                    ->searchable(),
                TextColumn::make('alamat')
                    ->searchable(),
                TextColumn::make('email')
                    ->label('Email address')
                    ->searchable(),
                TextColumn::make('jenis_kelamin')
                    ->searchable(),
                TextColumn::make('kelas')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('jurusan')
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
