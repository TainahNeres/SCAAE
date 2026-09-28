<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Usuario;
use App\Models\Representante;

class RepresentanteController extends Controller
{
    /**
     * Lista os representantes ativos.
     */
    public function index()
    {
        $representantes = Representante::with('usuario')
            ->where('ativo', true)
            ->get();

        return view(
            'admin.representantes.index',
            compact('representantes')
        );
    }

    /**
     * Exibe o formulário para promover um aluno.
     */
    public function create()
    {
        return view('admin.representantes.promover');
    }

    /**
     * Promove um aluno a representante.
     */
    public function store(Request $request)
    {
        $request->validate([
            'matricula' => 'required|string'
        ], [
            'matricula.required' => 'Informe a matrícula do aluno.'
        ]);

        $usuario = Usuario::where(
            'matricula',
            $request->matricula
        )->first();

        if (!$usuario) {
            return back()
                ->withErrors([
                    'matricula' => 'Aluno não encontrado.'
                ])
                ->withInput();
        }

        if (!$usuario->isAluno()) {
            return back()
                ->withErrors([
                    'matricula' => 'O usuário informado não é um aluno.'
                ])
                ->withInput();
        }

        $representante = Representante::updateOrCreate(
            [
                'usuario_id' => $usuario->id
            ],
            [
                'ativo' => true,
                'inicio_mandato' => now(),
                'fim_mandato' => null
            ]
        );

        return redirect()
            ->route('admin.representantes.index')
            ->with(
                'success',
                $usuario->nome . ' foi promovido a representante.'
            );
    }

    public function remove()
{
    return view('admin.representantes.remover');
}


public function destroy(Request $request)
{
    $request->validate([
        'matricula' => 'required'
    ]);

    $usuario = \App\Models\Usuario::where(
        'matricula',
        $request->matricula
    )->first();

    if (!$usuario) {
        return back()->withErrors([
            'matricula' => 'Aluno não encontrado.'
        ]);
    }

    $representante = \App\Models\Representante::where(
        'usuario_id',
        $usuario->id
    )->where(
        'ativo',
        true
    )->first();

    if (!$representante) {
        return back()->withErrors([
            'matricula' => 'Este aluno não é um representante ativo.'
        ]);
    }

    $representante->ativo = false;
    $representante->save();

    $usuario->role = 'aluno';
    $usuario->save();

    return redirect()
        ->route('admin.representantes.index')
        ->with('success', 'Representante removido com sucesso.');
}
}