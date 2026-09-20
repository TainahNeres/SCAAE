@extends('layouts.app')

@section('title', $setores->first()->setor_sigla . ' - SDP')
@section('tag', 'Aluno')

@section('content')
<h1>
    Olá! {{ auth()->user()->nome }}. Seja bem-vindo(a) ao seu painel de controle.
</h1>
<h1>Painel de controle: {{ $setores->first()->setor_sigla }}</h1>

@endsection
