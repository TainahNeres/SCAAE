<nav class="navbar">

    <div class="navbar-esquerda">

        <img src="{{ asset('img/logo-ifba-pa-horiz3.png') }}" alt="Logo IFBA">

    </div>

    <div class="navbar-direita">

        <div class="usuario-logado">

            <strong>
                {{ auth()->user()->nome }}
            </strong>

            <span>
                {{ ucfirst(auth()->user()->role) }}
            </span>

        </div>

    </div>

</nav>