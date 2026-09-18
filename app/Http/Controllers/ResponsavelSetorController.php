<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Requerimento;
use App\Models\Setor;


class ResponsavelSetorController extends Controller
{

    //  * Exibe o dashboard com os requerimentos dos setores gerenciados pelo usuário.

    public function index()
    {
        $usuario = auth()->user();

        // Busca apenas os setores gerenciados pelo usuário atual

        $setores = $usuario->setoresSobResponsabilidade()
            ->with(['requerimentos' => function ($query) {
                $query->latest();
            }, 'requerimentos.usuario'])
            ->get();

       return view('setor.responsavel.dashboard', compact('setores'));
    }
}
