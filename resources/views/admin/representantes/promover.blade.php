<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <title>Promover representante</title>

    <link rel="stylesheet"
          href="{{ asset('css/dashboardadmin.css') }}">
</head>

<body>

<div class="dashboard">

    <h1>Promover aluno a representante</h1>

    <p>
        Informe a matrícula do aluno que deseja promover.
    </p>

    <form
        method="POST"
        action="{{ route('admin.representantes.store') }}"
    >

        @csrf

        <input
            type="text"
            name="matricula"
            placeholder="Matrícula"
            value="{{ old('matricula') }}"
        >

        <button type="submit">
            Promover
        </button>

    </form>

    @if ($errors->any())

        <p style="color: red;">
            {{ $errors->first() }}
        </p>

    @endif

    <br>

    <a href="{{ route('admin.representantes.index') }}">
        Ver representantes
    </a>

    <br><br>

    <a href="{{ route('admin.dashboard') }}">
        Voltar ao dashboard
    </a>

</div>

</body>

</html>