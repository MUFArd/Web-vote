<?php

namespace App\Filament\Resources\Elections\Schemas;

use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class ElectionForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            TextInput::make('title')
                ->required()
                ->maxLength(255),

            Textarea::make('description')
                ->rows(3),

            DateTimePicker::make('start_at')
                ->required(),

            DateTimePicker::make('end_at')
                ->required(),

            Select::make('status')
                ->options([
                    'draft'  => 'Draft',
                    'active' => 'Active',
                    'closed' => 'Closed',
                ])
                ->default('draft')
                ->required(),
        ]);
    }
}