<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Admin\AlunoController;
use App\Http\Controllers\Admin\ProfessorController;
use App\Http\Controllers\Admin\TurmaController;
use App\Http\Controllers\CalendarioController;
use App\Http\Controllers\SuapCrawlerController;
use App\Http\Controllers\SuapExplorerController;
use App\Http\Controllers\SuapTestController;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Admin\RepresentanteController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| REDIRECIONAMENTO INICIAL
|--------------------------------------------------------------------------
*/
Route::redirect('/', '/login');

Route::get('/calendario/verificar-limite', [
    CalendarioController::class,
    'verificarLimite'
]);

/*
|--------------------------------------------------------------------------
| LOGIN
|--------------------------------------------------------------------------
| Admin: email + senha local
| Aluno/Professor: matrícula + senha SUAP
*/
Route::get('/login', function () {
    return view('auth.login');
});

Route::post('/login', [LoginController::class, 'login']);

Route::post('/logout', [LoginController::class, 'logout'])
    ->name('logout');


/*
|--------------------------------------------------------------------------
| DASHBOARD - ALUNO
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'role:aluno'])->group(function () {

    Route::get('/aluno/dashboard', function () {
        return view('aluno.dashboard');
    });

});


/*
|--------------------------------------------------------------------------
| DASHBOARD - PROFESSOR
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'role:professor'])->group(function () {

    Route::get('/professor/dashboard', function () {
        return view('professor.dashboard');
    });

});


/*
|--------------------------------------------------------------------------
| DASHBOARD - REPRESENTANTE
|--------------------------------------------------------------------------
|
| POR ENQUANTO:
| continua usando role:representante.
|
| FUTURAMENTE:
| trocar por middleware próprio consultando a tabela representantes.
|
*/


/*
|--------------------------------------------------------------------------
| ÁREA ADMINISTRATIVA
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'role:admin'])
    ->prefix('admin')
    ->group(function () {

        Route::get('/dashboard', function () {
            return view('admin.dashboard');
        })->name('admin.dashboard');

        Route::get(
            '/representantes',
            [RepresentanteController::class, 'index']
        )->name('admin.representantes.index');

        Route::get(
            '/representantes/promover',
            [RepresentanteController::class, 'create']
        )->name('admin.representantes.create');

        Route::post(
            '/representantes/promover',
            [RepresentanteController::class, 'store']
        )->name('admin.representantes.store');
    });


/*
|--------------------------------------------------------------------------
| CALENDÁRIO
|--------------------------------------------------------------------------
|
| Sem middleware por enquanto (modo teste).
|
*/
Route::get('/calendario', [CalendarioController::class, 'index']);

Route::get('/eventos', [CalendarioController::class, 'eventos']);

Route::post('/eventos', [CalendarioController::class, 'store']);

Route::put('/eventos/{evento}', [CalendarioController::class, 'update']);

Route::delete('/eventos/{evento}', [CalendarioController::class, 'destroy']);

//rota teste para email
Route::get('/teste-email', function () {
    Mail::raw('Este é um teste de envio de e-mail do SCAAE. Teste número 2', function ($message) {
        $message->to('senhormu12q@gmail.com')
                ->subject('Teste SCAAE');
    });

    return 'E-mail enviado!';
});

Route::middleware(['auth','role:admin'])
    ->prefix('admin')
    ->group(function () {

        Route::get(
            '/suap/explorador',
            [SuapExplorerController::class,'index']
        );

        Route::post(
            '/suap/explorador',
            [SuapExplorerController::class,'consultar']
        );
});
Route::get('/teste-suap', [SuapTestController::class, 'index'])
    ->name('suap.sync');
?>