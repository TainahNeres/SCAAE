<nav class="navbar">

    <div class="navbar-esquerda">

        <a href="#" class="nav-botao">
           
        </a>

        <a href="#" class="nav-botao">
            
        </a>

        <a href="#" class="nav-botao">
            
        </a>

        <a href="#" class="nav-botao">
           
        </a>

        <a href="#" class="nav-botao">
            
        </a>

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