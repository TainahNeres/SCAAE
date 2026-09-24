<nav class="navbar">

    <div class="navbar-esquerda">

        <img src="{{ asset('img/logo-ifba-pa-horiz3.png') }}" alt="Logo IFBA">

    </div>

<div class="navbar-direita">

    <details class="menu-usuario">

        <summary class="usuario-logado">

            <strong>{{ auth()->user()->nome }}</strong>

            <span>
                {{ ucfirst(auth()->user()->role) }}
                <span class="seta-menu">▾</span>
            </span>

        </summary>

        <div class="opcoes-usuario">

            <form method="POST" action="{{ route('logout') }}">

                @csrf

                <button type="submit" class="botao-sair">

                    <span class="icone-sair">⎋</span>

                    Sair

                </button>

            </form>

        </div>

    </details>

</div>

</nav>