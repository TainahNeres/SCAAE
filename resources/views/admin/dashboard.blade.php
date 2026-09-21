<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <title>Dashboard do Administrador</title>

    <link rel="stylesheet"
          href="{{ asset('css/dashboardadmin.css') }}">
</head>

<body>

    @include('layouts.navegacao')

    <main class="dashboard">

        <section class="dashboard-section">

            <h3>Calendário Acadêmico</h3>

            <p>
                Visualize e gerencie os eventos acadêmicos de todas as turmas.
            </p>

            <a href="{{ url('/calendario') }}">
                Acessar calendário
            </a>

        </section>

        <hr>

        <section class="dashboard-section">

            <h3>Representantes</h3>

            <p>
                Gerencie os representantes das turmas.
            </p>

            <a href="{{ route('admin.representantes.index') }}">
                Listar representantes
            </a>

            <a href="{{ route('admin.representantes.create') }}">
                Promover aluno a representante
            </a>

        </section>

    </main>

</body>

</html>