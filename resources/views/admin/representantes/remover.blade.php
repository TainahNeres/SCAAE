<!DOCTYPE html>
<html lang="pt-BR">

<head>

    <meta charset="UTF-8">

    <title>Remover representante</title>

    <link rel="stylesheet"
          href="{{ asset('css/dashboardadmin.css') }}">

</head>

<body>

@include('layouts.navegacao')

<div class="dashboard">

    <h1>Remover representante</h1>

    <p>
        Informe a matrícula do representante que deseja remover.
    </p>
<hr>
    <form
        method="POST"
        action="{{ route('admin.representantes.destroy') }}"
    >

        @csrf

        <input
            type="text"
            name="matricula"
            placeholder="Matrícula"
            value="{{ old('matricula') }}"
        >

<button type="submit" class="botao-remover">
    Remover representante
</button>


    </form>


    @if ($errors->any())

        <p style="color: red;">
            {{ $errors->first() }}
        </p>

    @endif


    @if (session('success'))

        <p style="color: green;">
            {{ session('success') }}
        </p>

    @endif


    <br>

<a class="botao-secundario"
   href="{{ route('admin.representantes.index') }}">
    Ver representantes
</a>
<br><br>
<a class="botao-secundario"
   href="{{ route('admin.dashboard') }}">
    Voltar ao dashboard
</a>

</div>

</body>

</html>