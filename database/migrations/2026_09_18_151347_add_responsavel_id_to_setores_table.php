<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('setores', function (Blueprint $table) {
            // Adiciona a chave estrangeira vinculada à tabela 'usuarios'
            $table->foreignId('responsavel_id')
                  ->nullable() // Permite que um setor comece sem responsável
                  ->after('id')
                  ->constrained('usuarios')
                  ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('setores', function (Blueprint $table) {
            $table->dropForeign(['responsavel_id']);
            $table->dropColumn('responsavel_id');
        });
    }
};
