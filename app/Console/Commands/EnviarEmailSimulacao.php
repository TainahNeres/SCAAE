<?php

namespace App\Console\Commands;

use App\Models\Evento;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;

class EnviarEmailSimulacao extends Command
{
    protected $signature = 'scaae:enviar-simulacao
                            {evento_id : ID do evento}
                            {email : E-mail do destinatário}';

    protected $description = 'Envia manualmente um e-mail de simulação de evento';

    public function handle()
    {
        $evento = Evento::find($this->argument('evento_id'));

        if (!$evento) {
            $this->error('Evento não encontrado.');
            return Command::FAILURE;
        }

        $email = $this->argument('email');

        $oferta = $evento->oferta;

        $disciplina = $oferta?->disciplina?->nome ?? 'Não informado';
        $professor = $oferta?->professor?->nome ?? 'Não informado';
        $criador = $evento->criador?->nome ?? 'Não informado';

        $tipos = [
            'prova' => 'Prova',
            'trabalho' => 'Trabalho',
            'seminario' => 'Seminário',
            'reuniao' => 'Reunião',
            'outro' => 'Outro',
        ];

        $tipo = $tipos[$evento->tipo] ?? $evento->tipo;

        $horario = 'Não informado';

        if ($evento->hora_inicio) {
            $horario = Carbon::parse($evento->hora_inicio)->format('H:i');

            if ($evento->hora_fim) {
                $horario .= ' às ' . Carbon::parse($evento->hora_fim)->format('H:i');
            }
        }

        $data = $evento->data_inicio
            ? Carbon::parse($evento->data_inicio)->format('d/m/Y')
            : 'Não informada';

        $descricao = $evento->descricao ?: 'Não informada';

$mensagem =
    "Olá!\n\n" .
    "Este é um lembrete de que o seguinte evento acontecerá em 24 horas:\n\n" .
    "Título: {$evento->titulo}\n" .
    "Disciplina: {$disciplina}\n" .
    "Professor: {$professor}\n" .
    "Criado por: {$criador}\n" .
    "Data: {$data}\n" .
    "Horário: {$horario}\n" .
    "Tipo: {$tipo}\n" .
    "Descrição: {$descricao}\n\n" .
    "Sistema de Controle de Avaliações e Atividades Escolares - SCAAE";

        Mail::raw($mensagem, function ($mail) use ($email, $evento) {
            $mail->to($email)
                 ->subject('Novo evento: ' . $evento->titulo);
        });

        $this->info('E-mail de simulação enviado com sucesso.');

        return Command::SUCCESS;
    }
}