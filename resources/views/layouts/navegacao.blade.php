<nav class="navbar">

    <div class="navbar-esquerda">

        <img src="{{ asset('img/logo-ifba-pa-horiz3.png') }}" alt="Logo IFBA">

    </div>

<div class="navbar-direita">

    <div class="usuario-logado">

        <strong>{{ auth()->user()->nome }}</strong>

        <span>
            {{ ucfirst(auth()->user()->role) }}
        </span>

    </div>

    <form method="POST" action="{{ route('logout') }}">

        @csrf

        <button type="submit"
                class="botao-sair"
                title="Sair do sistema">

            <span class="icone-sair">➜]</span>

        </button>

    </form>

</div>

    </details>

</div>

</nav>