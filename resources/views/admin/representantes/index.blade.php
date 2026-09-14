<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <title>Representantes</title>

    <link rel="stylesheet"
          href="{{ asset('css/dashboardadmin.css') }}">
</head>

<body>

<div class="dashboard">

    <h1>Representantes</h1>

    @if (session('success'))
        <p style="color: green;">
            {{ session('success') }}
        </p>
    @endif

    <hr>

    @if ($representantes->isEmpty())

        <p>
            Nenhum representante ativo cadastrado.
        </p>

    @else

        <table>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Turma</th>
                    <th>E-mail pessoal</th>
                    <th>Telefone</th>
                </tr>
            </thead>

            <tbody>

                @foreach ($representantes as $representante)

                    <tr>

                        <td>
                            {{ $representante->usuario->nome }}
                        </td>

                        <td>
                            {{ $representante->usuario->turma_codigo ?? 'Não informado' }}
                        </td>

                        <td>
                            {{ $representante->usuario->email_pessoal ?? 'Não informado' }}
                        </td>

                        <td>
                            {{ $representante->usuario->telefone ?? '—' }}
                        </td>

                    </tr>

                @endforeach

            </tbody>
        </table>

    @endif

    <br>

    <a href="{{ route('admin.representantes.create') }}">
        Promover aluno a representante
    </a>

    <br><br>

    <a href="{{ route('admin.dashboard') }}">
        Voltar ao dashboard
    </a>

</div>

</body>
</html>