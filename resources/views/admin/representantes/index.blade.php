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

    <div class="tabela-representantes-container">

        <table class="tabela-representantes">

            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Turma</th>
                    <th>E-mail pessoal</th>
                </tr>
            </thead>

            <tbody>

                @foreach ($representantes as $representante)

                    <tr>

                        <td class="coluna-nome">
                            <div class="campo-tabela">
                                <span class="rotulo-mobile">
                                    Nome
                                </span>

                                <span>
                                    {{ $representante->usuario->nome }}
                                </span>
                            </div>
                        </td>

                        <td class="coluna-turma">
                            <div class="campo-tabela">
                                <span class="rotulo-mobile">
                                    Turma
                                </span>

                                <span class="turma-destaque">
                                    {{ $representante->usuario->turma_codigo ?? 'Não informado' }}
                                </span>
                            </div>
                        </td>

                        <td class="coluna-email">
                            <div class="campo-tabela">
                                <span class="rotulo-mobile">
                                    E-mail pessoal
                                </span>

                                <span>
                                    {{ $representante->usuario->email_pessoal ?? 'Não informado' }}
                                </span>
                            </div>
                        </td>

                    </tr>

                @endforeach

            </tbody>

        </table>

    </div>

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