CREATE DATABASE IF NOT EXISTS `agenda`;
USE `agenda`;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `administradores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_admin_usuario` (`usuario_id`),
  CONSTRAINT `fk_admin_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `alunos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `matricula` varchar(100) NOT NULL,
  `turma_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `fk_aluno_usuario` (`usuario_id`),
  KEY `fk_aluno_turma` (`turma_id`),
  CONSTRAINT `fk_aluno_turma` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_aluno_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `atendimentos_agendados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `evento_id` bigint NOT NULL,
  `aluno_id` bigint NOT NULL,
  `status` enum('solicitado','confirmado','cancelado') DEFAULT 'solicitado',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_atendimento_evento` (`evento_id`),
  KEY `fk_atendimento_aluno` (`aluno_id`),
  CONSTRAINT `fk_atendimento_aluno` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_atendimento_evento` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `suap_id` bigint unsigned NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_suap_disciplina` (`suap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `disciplinas` (`id`, `suap_id`, `codigo`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 252849, 'TIN.0030', 'PROJETO PRÁTICO', '2026-07-07 00:21:51', '2026-08-13 22:01:56'),
	(2, 252850, 'TIN.1398', 'GEOGRAFIA', '2026-07-07 00:21:51', '2026-07-07 00:21:51'),
	(3, 252851, 'TIN.1407', 'INGLÊS', '2026-07-07 00:21:51', '2026-08-13 22:01:56'),
	(4, 252852, 'TIN.0012', 'ORGANIZAÇÃO E NORMAS DA QUALIDADE GESTÃO DE ORGANIZAÇÕES E EMPREENDEDORISMO', '2026-07-07 00:21:52', '2026-08-13 22:01:56'),
	(5, 252853, 'TIN.0025', 'PROJETO DE SISTEMAS COM BANCO DE DADOS', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(6, 252854, 'TIN.0029', 'SISTEMAS OPERACIONAIS', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(7, 252855, 'TIN.1382', 'BIOLOGIA', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(8, 252856, 'TIN.1395', 'FILOSOFIA - IV', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(9, 252857, 'TIN.0027', 'FUNDAMENTOS DE ENGENHARIA DE SOFTWARE', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(10, 252858, 'TIN.0013', 'SEGURANÇA DO TRABALHO, MEIO AMBIENTE E SAÚDE', '2026-07-07 00:21:52', '2026-08-13 22:01:56'),
	(11, 252859, 'TIN.1405', 'SOCIOLOGIA', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(12, 252860, 'TIN.0018', 'ESPANHOL', '2026-07-07 00:21:52', '2026-07-07 00:21:52'),
	(13, 252925, 'TIN.1379', 'EDUCA', '2026-07-09 22:34:13', '2026-07-09 22:34:13'),
	(14, 252926, 'TIN.1381', 'BIOLOGIA', '2026-07-09 22:45:48', '2026-07-09 22:45:48'),
	(15, 252927, 'TIN.1394', 'FILOSOFIA', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(16, 252928, 'TIN.1385', 'F', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(17, 252929, 'TIN.1397', 'GEOGRAFIA', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(18, 252930, 'TIN.1401', 'HIST', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(19, 252931, 'TIN.1376', 'PORTUGU', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(20, 252932, 'TIN.1388', 'MATEM', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(21, 252933, 'TIN.1391', 'QUIMICA III', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(22, 252934, 'TIN.1404', 'SOCIOLOGIA', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(23, 252935, 'TIN.1415', 'GEST', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(24, 252936, 'TIN.0039', 'IMPACTOS E MONITORAMENTO AMBIENTAL', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(25, 252937, 'TIN.0040', 'SANEAMENTO AMBIENTAL E SAUDE P', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(26, 252938, 'TIN.0035', 'SOLOS E MEIO AMBIENTE', '2026-07-09 22:45:49', '2026-07-09 22:45:49'),
	(27, 252819, 'TIN.1388', 'MATEMÁTICA', '2026-07-21 17:33:07', '2026-08-31 19:31:01'),
	(28, 252823, 'TIN.1376', 'PORTUGUÊS', '2026-07-21 17:33:07', '2026-08-31 19:31:01'),
	(29, 252820, 'TIN.0015', 'EDUCAÇÃO AMBIENTAL', '2026-07-21 17:33:07', '2026-08-31 19:31:01'),
	(30, 252821, 'TIN.1397', 'GEOGRAFIA', '2026-07-21 17:33:07', '2026-07-21 17:33:07'),
	(31, 252822, 'TIN.0024', 'BANCO DE DADOS', '2026-07-21 17:33:07', '2026-07-21 17:33:07'),
	(32, 252824, 'TIN.1391', 'QUIMICA III', '2026-07-21 17:33:07', '2026-07-21 17:33:07'),
	(33, 252825, 'TIN.0014', 'REDAÇÃO TÉCNICA E CIENTÍFICA', '2026-07-21 17:33:07', '2026-08-31 19:31:01'),
	(34, 252826, 'TIN.0028', 'REDES DE COMPUTADORES', '2026-07-21 17:33:07', '2026-07-21 17:33:07'),
	(35, 252827, 'TIN.1394', 'FILOSOFIA', '2026-07-21 17:33:07', '2026-07-21 17:33:07'),
	(36, 252828, 'TIN.1379', 'EDUCAÇÃO FÍSICA', '2026-07-21 17:33:08', '2026-08-31 19:31:01'),
	(37, 252829, 'TIN.1401', 'HISTÓRIA', '2026-07-21 17:33:08', '2026-08-31 19:31:01'),
	(38, 252830, 'TIN.1381', 'BIOLOGIA', '2026-07-21 17:33:08', '2026-07-21 17:33:08'),
	(39, 252831, 'TIN.1385', 'FÍSICA - III', '2026-07-21 17:33:08', '2026-08-31 19:31:01'),
	(40, 252832, 'TIN.0022', 'LINGUAGEM DE PROGRAMAÇÃO II', '2026-07-21 17:33:08', '2026-08-31 19:31:02'),
	(41, 252833, 'TIN.1404', 'SOCIOLOGIA', '2026-07-21 17:33:08', '2026-07-21 17:33:08');

CREATE TABLE IF NOT EXISTS `disciplina_professor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `disciplina_id` bigint unsigned NOT NULL,
  `professor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `turma_codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_disc_prof` (`disciplina_id`,`professor_id`),
  KEY `fk_dp_professor` (`professor_id`),
  CONSTRAINT `fk_dp_disciplina` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dp_professor` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `disciplina_professor` (`id`, `disciplina_id`, `professor_id`, `created_at`, `updated_at`, `turma_codigo`) VALUES
	(56, 1, 51, NULL, NULL, '20261.4.18.1I'),
	(57, 2, 52, NULL, NULL, '20261.4.18.1I'),
	(58, 3, 53, NULL, NULL, '20261.4.18.1I'),
	(59, 3, 54, NULL, NULL, '20261.4.18.1I'),
	(60, 4, 55, NULL, NULL, '20261.4.18.1I'),
	(61, 5, 56, NULL, NULL, '20261.4.18.1I'),
	(62, 6, 57, NULL, NULL, '20261.4.18.1I'),
	(63, 7, 58, NULL, NULL, '20261.4.18.1I'),
	(64, 8, 59, NULL, NULL, '20261.4.18.1I'),
	(65, 9, 51, NULL, NULL, '20261.4.18.1I'),
	(66, 10, 60, NULL, NULL, '20261.4.18.1I'),
	(67, 11, 61, NULL, NULL, '20261.4.18.1I'),
	(68, 12, 62, NULL, NULL, '20261.4.18.1I'),
	(69, 27, 63, NULL, NULL, '20261.3.18.1I'),
	(70, 28, 64, NULL, NULL, '20261.3.18.1I'),
	(71, 29, 60, NULL, NULL, '20261.3.18.1I'),
	(72, 30, 65, NULL, NULL, '20261.3.18.1I'),
	(73, 31, 51, NULL, NULL, '20261.3.18.1I'),
	(74, 31, 66, NULL, NULL, '20261.3.18.1I'),
	(75, 32, 67, NULL, NULL, '20261.3.18.1I'),
	(76, 32, 60, NULL, NULL, '20261.3.18.1I'),
	(77, 33, 62, NULL, NULL, '20261.3.18.1I'),
	(78, 34, 57, NULL, NULL, '20261.3.18.1I'),
	(79, 35, 68, NULL, NULL, '20261.3.18.1I'),
	(80, 36, 69, NULL, NULL, '20261.3.18.1I'),
	(81, 37, 70, NULL, NULL, '20261.3.18.1I'),
	(82, 38, 58, NULL, NULL, '20261.3.18.1I'),
	(83, 39, 71, NULL, NULL, '20261.3.18.1I'),
	(84, 40, 72, NULL, NULL, '20261.3.18.1I'),
	(85, 41, 61, NULL, NULL, '20261.3.18.1I'),
	(86, 1, 69, NULL, NULL, '20261.4.18.1I'),
	(87, 1, 73, NULL, NULL, '20261.4.18.1I'),
	(88, 4, 74, NULL, NULL, '20261.4.18.1I'),
	(89, 5, 75, NULL, NULL, '20261.4.18.1I'),
	(90, 29, 76, NULL, NULL, '20261.3.18.1I'),
	(91, 31, 72, NULL, NULL, '20261.3.18.1I'),
	(92, 3, 77, NULL, NULL, '20261.4.18.1I'),
	(93, 12, 78, NULL, NULL, '20261.4.18.1I');

CREATE TABLE IF NOT EXISTS `eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `tipo` enum('prova','trabalho','seminario','reuniao','outro') NOT NULL,
  `data_inicio` date NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fim` time DEFAULT NULL,
  `descricao` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `professor_id` bigint unsigned DEFAULT NULL,
  `turma_id` bigint DEFAULT NULL,
  `disciplina_professor_id` bigint unsigned DEFAULT NULL,
  `criado_por` bigint DEFAULT NULL,
  `lembrete_enviado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_professores` (`professor_id`),
  KEY `fk_turmas` (`turma_id`),
  KEY `fk_evento_oferta` (`disciplina_professor_id`),
  KEY `eventos_criado_por_foreign` (`criado_por`),
  CONSTRAINT `fk_evento_oferta` FOREIGN KEY (`disciplina_professor_id`) REFERENCES `disciplina_professor` (`id`),
  CONSTRAINT `fk_professores` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_turmas` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `eventos` (`id`, `titulo`, `tipo`, `data_inicio`, `hora_inicio`, `hora_fim`, `descricao`, `created_at`, `updated_at`, `professor_id`, `turma_id`, `disciplina_professor_id`, `criado_por`, `lembrete_enviado`) VALUES
	(3, 'aaaaaaaaaaa', 'seminario', '2026-08-24', '16:39:00', '16:40:00', 'aaaaaaaaaaaaa', '2026-06-12 00:36:30', '2026-08-24 19:38:38', NULL, NULL, NULL, NULL, 0),
	(4, 'asd', 'prova', '2026-06-24', '11:01:00', '11:01:00', NULL, '2026-06-12 01:37:19', '2026-06-19 00:32:55', NULL, NULL, NULL, NULL, 0),
	(5, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'prova', '2026-06-07', NULL, NULL, NULL, '2026-06-12 01:37:34', '2026-06-19 00:33:02', NULL, NULL, NULL, NULL, 0),
	(6, 'Prova de filosofia', 'prova', '2026-06-30', '12:34:00', '13:56:00', 'Levem folha de of', '2026-07-13 20:38:53', '2026-07-13 20:38:53', NULL, NULL, NULL, NULL, 0),
	(7, 'fsdfsdfds', 'prova', '2026-07-28', '04:04:00', '05:05:00', 'dsadads', '2026-08-03 21:12:31', '2026-08-03 21:12:31', NULL, NULL, 56, NULL, 0),
	(8, 'fsdfsdfds', 'prova', '2026-07-28', '04:04:00', '05:05:00', 'dsadads', '2026-08-03 21:12:32', '2026-08-03 21:12:32', NULL, NULL, 56, NULL, 0),
	(9, 'sdasdas', 'prova', '2026-08-06', '05:05:00', '06:06:00', 'fasassa', '2026-08-03 23:02:52', '2026-08-03 23:02:52', NULL, NULL, 63, NULL, 0),
	(10, 'Prova projeto pr', 'prova', '2026-08-19', '10:00:00', '11:01:00', 'Aaasasa', '2026-08-10 21:23:28', '2026-08-10 21:23:28', NULL, NULL, 56, NULL, 0),
	(11, 'TRABALHO PROJETOpratico', 'trabalho', '2026-08-14', '12:04:00', '12:08:00', 'aaaaaaaaaaaaa', '2026-08-13 21:18:14', '2026-08-13 21:18:14', NULL, NULL, 87, NULL, 0),
	(13, '4.181I', 'prova', '2026-08-05', '11:01:00', '12:23:00', NULL, '2026-08-17 21:51:33', '2026-08-17 21:51:33', NULL, NULL, 56, NULL, 0),
	(24, 'Seminário', 'seminario', '2026-08-21', '12:02:00', '21:02:00', NULL, '2026-08-20 22:54:37', '2026-08-20 23:32:07', NULL, NULL, 87, NULL, 0),
	(26, 'Prova', 'prova', '2026-08-21', '12:13:00', '12:44:00', NULL, '2026-08-20 23:12:52', '2026-08-20 23:31:58', NULL, NULL, 87, 21, 0),
	(29, 'Trabalho', 'trabalho', '2026-08-21', '12:00:00', '12:59:00', NULL, '2026-08-20 23:32:29', '2026-08-20 23:32:29', NULL, NULL, 87, 21, 0),
	(30, 'Reunião', 'reuniao', '2026-08-21', '12:04:00', '13:56:00', NULL, '2026-08-20 23:33:34', '2026-08-20 23:33:34', NULL, NULL, 87, 21, 0),
	(31, 'Outro', 'outro', '2026-08-21', '12:34:00', '13:56:00', NULL, '2026-08-20 23:33:45', '2026-08-20 23:35:13', NULL, NULL, 87, 21, 0),
	(32, 'Teste', 'prova', '2026-08-25', '17:40:00', '18:00:00', NULL, '2026-08-24 22:44:39', '2026-08-24 20:38:12', NULL, NULL, 87, 21, 1),
	(36, 'Teste', 'prova', '2026-08-28', '16:06:00', '17:00:00', NULL, '2026-08-27 19:00:05', '2026-08-27 19:28:15', NULL, NULL, 87, 21, 1),
	(37, 'segundo', 'prova', '2026-08-28', '12:12:00', '12:12:00', NULL, '2026-08-27 19:23:46', '2026-08-27 19:23:46', NULL, NULL, 87, 21, 0),
	(38, 'sdasdad', 'prova', '2026-08-28', '14:41:00', '14:14:00', NULL, '2026-08-27 19:23:57', '2026-08-27 19:23:57', NULL, NULL, 87, 21, 0),
	(39, 'asdasda', 'prova', '2026-08-28', '12:12:00', '12:23:00', NULL, '2026-08-27 19:26:02', '2026-08-27 20:24:08', NULL, NULL, 87, 21, 0),
	(52, 'Prova de Casos de Uso', 'prova', '2026-09-10', '15:00:00', '16:00:00', '- Valendo 1/3 da nota\n- Com consulta', '2026-09-10 17:25:30', '2026-09-10 17:25:30', NULL, NULL, 87, 21, 0),
	(53, 'Seminário de Projeto Prático', 'seminario', '2026-09-15', '11:00:00', '12:00:00', '- Proibido uso do celular durante apresentação', '2026-09-10 17:26:33', '2026-09-28 18:33:01', NULL, NULL, 87, 21, 0),
	(54, 'Trabalho de Projeto Prático', 'trabalho', '2026-09-17', '11:00:00', '12:00:00', '- Entregar relatório escrito', '2026-09-10 17:28:23', '2026-09-10 17:28:23', NULL, NULL, 87, 21, 0),
	(55, 'Roda de Conversa', 'outro', '2026-09-16', '11:00:00', '12:00:00', NULL, '2026-09-10 17:29:09', '2026-09-10 17:29:09', NULL, NULL, 87, 21, 0),
	(57, 'Prova filosofia', 'prova', '2026-12-08', '11:00:00', '12:00:00', NULL, '2026-09-17 19:58:13', '2026-09-17 19:58:13', NULL, NULL, 64, 15, 0),
	(60, 'teste', 'prova', '2026-10-06', '11:11:00', '12:12:00', NULL, '2026-10-01 20:00:56', '2026-10-01 20:19:46', NULL, NULL, 56, 15, 0);

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_07_30_193031_remove_turma_id_from_representantes_table', 2);

CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `professores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `suap_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `matricula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `professores` (`id`, `suap_id`, `nome`, `created_at`, `updated_at`, `matricula`) VALUES
	(51, NULL, 'Rui Santos Carige Junior', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '2880403'),
	(52, NULL, 'Romulo Lima Meira', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '2569497'),
	(53, NULL, 'Adailton di Lauro Dias', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '1334408'),
	(54, NULL, 'Geferson Silva Souza', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '3419691'),
	(55, NULL, 'Antonio Fernando Teixeira da Silva', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '3397527'),
	(56, NULL, 'Neidson Sampaio de Oliveira', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '3509853'),
	(57, NULL, 'Joao Gabriel Silva Gomes', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '2026834'),
	(58, NULL, 'Alex Oliveira do Lago', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '3505211'),
	(59, NULL, 'Azamor Coelho Guedes', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '1813363'),
	(60, NULL, 'Eider Esdras Silva Oliveira', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '1182171'),
	(61, NULL, 'Nivaldo Correia da Silva', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '3272172'),
	(62, NULL, 'Michele Santos Barbosa', '2026-07-16 23:01:34', '2026-07-16 23:01:34', '3060668'),
	(63, NULL, 'Joao Marcos Ribeiro do Carmo', '2026-07-21 17:33:07', '2026-07-21 17:33:07', '1250897'),
	(64, NULL, 'Deisiane Alecrim de Mello Oliveira', '2026-07-21 17:33:07', '2026-07-21 17:33:07', '1037266'),
	(65, NULL, 'Jeovangela de Matos Rosa Ribeiro', '2026-07-21 17:33:07', '2026-07-21 17:33:07', '2122906'),
	(66, NULL, 'Maria Alice Oliveira Costa Leal', '2026-07-21 17:33:07', '2026-07-21 17:33:07', '2161528'),
	(67, NULL, 'Leanderson Bispo Pires', '2026-07-21 17:33:07', '2026-07-21 17:33:07', '3489632'),
	(68, NULL, 'Cleiton Gil Barbosa', '2026-07-21 17:33:07', '2026-07-21 17:33:07', '1354500'),
	(69, NULL, 'Keila Michelly Canhina Sachimbombo', '2026-07-21 17:33:08', '2026-07-21 17:33:08', '1014034'),
	(70, NULL, 'Ana Paula Batista da Silva Cruz', '2026-07-21 17:33:08', '2026-07-21 17:33:08', '3390152'),
	(71, NULL, 'Edinelson Pereira dos Santos', '2026-07-21 17:33:08', '2026-07-21 17:33:08', '1820809'),
	(72, NULL, 'Monck Charles Nunes de Albuquerque', '2026-07-21 17:33:08', '2026-07-21 17:33:08', '3074421'),
	(73, NULL, 'Professor Teste', '2026-08-10 22:49:13', '2026-08-10 22:49:13', '99999999999'),
	(74, NULL, 'Amanda Maria de Souza Pontes Mariano Costa', '2026-08-27 18:38:52', '2026-08-27 18:38:52', '3552366'),
	(75, NULL, 'Nagilo Santos Araujo', '2026-08-27 18:38:53', '2026-08-27 18:38:53', '3552484'),
	(76, NULL, 'Tayron Juliano Souza', '2026-08-31 19:31:01', '2026-08-31 19:31:01', '3388662'),
	(77, NULL, 'Ana Clara Brito Rodrigues Cotrim', '2026-09-28 18:32:17', '2026-09-28 18:32:17', '3554119'),
	(78, NULL, 'Denise Cerqueira da Silva', '2026-09-28 18:32:18', '2026-09-28 18:32:18', '3553384');

CREATE TABLE IF NOT EXISTS `representantes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `inicio_mandato` date DEFAULT NULL,
  `fim_mandato` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_representante_usuario` (`usuario_id`),
  CONSTRAINT `fk_representante_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `representantes` (`id`, `usuario_id`, `inicio_mandato`, `fim_mandato`, `ativo`, `created_at`, `updated_at`) VALUES
	(1, 15, '2026-07-30', NULL, 1, '2026-07-30 22:50:59', '2026-07-30 22:50:59'),
	(2, 12, '2026-10-01', NULL, 0, '2026-09-28 17:09:50', '2026-10-01 19:02:50');

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('lpwIfEPVDWLCIT0VgAQb1U8IMtQhEHU5DakPtIDH', 21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ6WnNEbmFmSW85S0E3YWZQa1VMaUxrVDB2RmZtd2xHWnNkMFBnWTJ5IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9ldmVudG9zP2VuZD0yMDI2LTA5LTA2VDAwJTNBMDAlM0EwMC0wMyUzQTAwJnN0YXJ0PTIwMjYtMDctMjZUMDAlM0EwMCUzQTAwLTAzJTNBMDAiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjIxLCJzdWFwX2p3dCI6ImV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUoxYzJWeVgybGtJam94TVRnME5qSXNJbVZ0WVdsc0lqb2lJaXdpZFhObGNtNWhiV1VpT2lJeU1ESXpNVEU0TURBeE1pSXNJbVY0Y0NJNk1UYzROalEzTWpZNE5Dd2liM0pwWjE5cFlYUWlPakUzT0RZek9EWXlPRFI5LktKYjBKWFJCM3NVZDJMWHBfcUNTWkFaR05NWEdFR0FxQW5iTjJqUWJhT1EifQ==', 1786392396),
	('rMMfp3GyMDWvIpuyCP36XqiNLFGLPJrhrNVNvOOC', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIwdDdsaGowYVNvUmpYZDFWNGc4Rzc5TTAwS09VSW1SN2NBM05FTFNUIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9ldmVudG9zIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxMiwic3VhcF9qd3QiOiJleUowZVhBaU9pSktWMVFpTENKaGJHY2lPaUpJVXpJMU5pSjkuZXlKMWMyVnlYMmxrSWpveE1UZzBOaklzSW1WdFlXbHNJam9pSWl3aWRYTmxjbTVoYldVaU9pSXlNREl6TVRFNE1EQXhNaUlzSW1WNGNDSTZNVGM0Tmpjek1UWXhNU3dpYjNKcFoxOXBZWFFpT2pFM09EWTJORFV5TVRGOS5Cb3dWdW9NRzhvWDNscWVRbHAzcmp5WVFYYXZoTzgtcEFXdTFWNzI3SzdnIn0=', 1786645227),
	('yzrXADkM6ntMOiqmrYCLFVFlPRslf5a1vdYPL3IB', 20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJKWHg3WWhTWmg2TG05VDRIRWVpVnRVTXpPVHc0UGZqc1JCZWNEUzExIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9ldmVudG9zP2VuZD0yMDI2LTA5LTA2VDAwJTNBMDAlM0EwMC0wMyUzQTAwJnN0YXJ0PTIwMjYtMDctMjZUMDAlM0EwMCUzQTAwLTAzJTNBMDAiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjIwLCJzdWFwX2p3dCI6ImV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUoxYzJWeVgybGtJam94TXpBek9EVXNJbVZ0WVdsc0lqb2lJaXdpZFhObGNtNWhiV1VpT2lJeU1ESTBNVEU0TURBek15SXNJbVY0Y0NJNk1UYzROVGczTkRJM055d2liM0pwWjE5cFlYUWlPakUzT0RVM09EYzROemQ5Ll9talRjaXpHR1pwbi1URnRxOElEMkJ1d25WQlgzR0JJc1p5Vk5VQzY5N00ifQ==', 1785787766);

CREATE TABLE IF NOT EXISTS `turmas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `codigo_acesso` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_acesso` (`codigo_acesso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `turmas` (`id`, `nome`, `codigo_acesso`, `created_at`, `updated_at`) VALUES
	(1, '1181I', '1181I1nf0rm4t1c4!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(2, '2181I', '2181I1nf0rm4t1c4!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(3, '3181I', '3181I1nf0rm4t1c4!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(4, '4181I', '4181I1nf0rm4t1c4!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(5, '1281I', '1281I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(6, '2281I', '2281I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(7, '3281I', '3281I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(8, '4281I', '4281I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(9, '1182I', '1182I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(10, '2182I', '2182I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(11, '3182I', '3182I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(12, '4182I', '4182I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(13, '1282I', '1282I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(14, '2282I', '2282I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(15, '3282I', '3282I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28'),
	(16, '4282I', '4282I4mb13nt3!', '2026-06-02 20:24:28', '2026-06-02 20:24:28');

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `matricula` varchar(30) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_pessoal` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `senha_suap` longtext,
  `turma_codigo` varchar(50) DEFAULT NULL,
  `role` enum('admin','aluno','professor','representante') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usuarios` (`id`, `matricula`, `nome`, `email`, `email_pessoal`, `password`, `senha_suap`, `turma_codigo`, `role`, `created_at`, `updated_at`) VALUES
	(12, '20231180012', 'TAINAH OLIVEIRA', '20231180012@ifba.edu.br', 'tainahneres2007@gmail.com', '$2y$12$0KUhGwuNBvAB3kx4yoaFyeW8zQaTRS7LC52XPnilp96YXT0RX3pQG', 'eyJpdiI6IkZWVmlPamxFbW5TYjBWTGpyaEZ4UEE9PSIsInZhbHVlIjoiMTFCWlBDcVlkdEtSU1J5N1k4dFpjdz09IiwibWFjIjoiNTVjMzRkNWM0MTQ1ZjA5ZjljZjRmOTUzYTgwNTk0ZjgzODRhMzBmOWIxZmNlYTY5ZDA3ZDY2NzJiZGRlNjdlOSIsInRhZyI6IiJ9', '20261.4.18.1I', 'aluno', '2026-07-06 23:19:04', '2026-10-01 18:53:48'),
	(13, '20241280005', 'HEVERTON OLIVEIRA', '20241280005@ifba.edu.br', NULL, '$2y$12$lS5r2zqcGPvQjj5CKF1Uq.jMiGpHbwfVgS6DXgsbNrUDspJxrFjce', 'eyJpdiI6IjQzV0xsZkdiOXIxOUt3WmpBS0NDMkE9PSIsInZhbHVlIjoiQ3FTYW83ck0vVXhnb3JTbnBOTXBjdz09IiwibWFjIjoiYzkyZjBlMzc3YTU2ODFkY2Y3NGQzYzA4OTAzY2I3OTA2YmY1YWU2YWExYTc3MWE1MDRlZDlkYTcyZmY4NDRiMyIsInRhZyI6IiJ9', NULL, 'aluno', '2026-07-09 22:33:05', '2026-07-10 01:50:57'),
	(15, '20231180002', 'MURILO SIRINEU', '20231180002@ifba.edu.br', 'senhormu12q@gmail.com', '$2y$12$AMv6hUeCyWj07EhsV2WWwujJH.h/Jpi8COy6748NXWW7YzP252GdG', 'eyJpdiI6InhmTmU2NUxBWS9ZT0hYdDFPSWVKQUE9PSIsInZhbHVlIjoiY1FPS2IyMW9FNGVSSCtPdTlUbDJFUT09IiwibWFjIjoiMTQwMDQwOTUwNTU2YWI4NDdlYTdmYTE0MzRjOTE0M2FlZTJkYzA1MDY4MGFmM2UxNjM3NzYyNGNkNjcwZDNjZCIsInRhZyI6IiJ9', '20261.4.18.1I', 'aluno', '2026-07-16 19:22:32', '2026-10-01 19:57:12'),
	(16, '3074421', 'Monck Albuquerque', 'monckcharles@ifba.edu.br', NULL, '$2y$12$AFi9CfqYPjqqUB4XgMGjpucU/Ha43kLZ.jcJySNGdRAd2LYyhhmPe', 'eyJpdiI6Im92cENqMXRaSnI5cDVsUVNDS1VPQVE9PSIsInZhbHVlIjoibmVRdCtqc1FUczJ5ZG9GWTNTVEdNQT09IiwibWFjIjoiZDdmMGY0MDQzMDBmODRmZjdlMDE2NmM1YTlhZGZhNjlhMmYyMDczOGRiNzRjNTdhZDA2OWJkYzY4OTdkMmRjZiIsInRhZyI6IiJ9', NULL, 'professor', '2026-07-21 17:26:16', '2026-08-31 19:10:11'),
	(17, '20241180004', 'PEDRO PAZ', '20241180004@ifba.edu.br', NULL, '$2y$12$UCEeCQBuYgd1vJY836LB9Ovt6YJElQ1Mrcdy8wc/btKQ.FPrafdgu', 'eyJpdiI6IlpLbDdlVkxWRVZNai9QYXhUaGE1ZlE9PSIsInZhbHVlIjoiTGxHK0VyaUVFZFhsSjNZNW9NM1lzdz09IiwibWFjIjoiMzBjYzE1OTc5NTUxOTE1MjcwMjRjODExMDI5ODc4YWMxOTg2ZTdhMzU5NmE3YjFjYTMxNmVlODk5NTFiYWZkOSIsInRhZyI6IiJ9', '20261.3.18.1I', 'aluno', '2026-07-21 17:32:48', '2026-07-21 17:32:58'),
	(19, '', 'MURILO SIRINEU', 'senhormu12q@gmail.com', NULL, '$2y$12$01Do4yMT1fI1foqQnQg6Bu8MC5Zhtd3z9/0IrowQHLmaQaLb36Jg.', 'eyJpdiI6IkZ1dnlocGkvZk9CQVczRXp6ajFjUFE9PSIsInZhbHVlIjoiSXRVRTZRekt2VTliMUFwZ2w3WDlydz09IiwibWFjIjoiYWE1NzAxOWZhNWY2NjQ2MTlmNzc5YTYwYTM1YWQwYzQzMmJhYTJmOWY2M2M1ZWY3NWQ5OTY0YWM4NDg1MzdhYiIsInRhZyI6IiJ9', '', 'admin', '2026-07-16 19:22:32', '2026-07-30 21:42:43'),
	(20, '20241180033', 'RAQUEL CARMO', '20241180033@ifba.edu.br', NULL, '$2y$12$Rj61dXiU5I0tKVl0OER4vujApztITowwc0lQyr5n0XZoixQ4mSIn6', 'eyJpdiI6IjVsZWtadGpNR1BTZlBGR09YZjNJaFE9PSIsInZhbHVlIjoiNnNRT1Bwd0hmb3lSQUdLYWo0TVI2TnZsUlRMdXlrRTJpMnFZS2tSa0s2QT0iLCJtYWMiOiJmN2JjMDhiZjk4MGNhZjY1MGM4YThlMDBlMDlmNDhkOWI4MjFlYWM0NjZmYjdlOGVkM2FjYzE3NWZmYTBjMDZjIiwidGFnIjoiIn0=', '20261.3.18.1I', 'aluno', '2026-08-03 23:09:00', '2026-08-03 23:09:07'),
	(21, '99999999999', 'Professor Teste', 'professor.teste@ifba.edu.br', NULL, '$2y$12$fez51dLGXMtLncnFemrXj.RruKQMnPY7uNPdyKElRFH4MwpC.6bCG', NULL, NULL, 'professor', '2026-08-10 22:46:28', '2026-08-10 22:46:28'),
	(22, '20261SEAADS0001', 'CLAUDEILSON ASSUNCAO', '20261SEAADS0001@ifba.edu.br', NULL, '$2y$12$hgcZU.8zUAFCa0clhpCZEOdasfFv6a3ASGE6J1zYT4OmFUbRK3ng2', 'eyJpdiI6ImFkZGhFSStRcUllUnlQWk5WOG1jOGc9PSIsInZhbHVlIjoieUw5a2VQMlRrTWVsYmxpdWVZa1RhZz09IiwibWFjIjoiYzJlMTM4MDNjMjFkZGMxZWNjMGU0NzFhOWNlZjEyOWVlOTA0MDU3MTQ2ZGMwM2U4OGFiY2U3ZDkzMmI5NGE4MiIsInRhZyI6IiJ9', NULL, 'aluno', '2026-08-31 19:20:51', '2026-08-31 19:20:51'),
	(23, '20241180003', 'MARIA SANTOS', '20241180003@ifba.edu.br', 'mavi_dos_santos@outlook.com', '$2y$12$rMcsvehplDREOo7m7ZxYGOVP1pEA4Fv0vOOQboyMBBlC61b2fUaJu', 'eyJpdiI6IjkrYm9DelBMbnExenJRRXpaNHlaN1E9PSIsInZhbHVlIjoiU1J1MDNtcFN2WnZ5dmkwOVBqYnJNUT09IiwibWFjIjoiYjU1YTQwMDgzMmRlYTYyMzM4ZDkwYzM2OWJlNDI1ODU3MzRkZWEzY2NmN2NhYWI4OWE5N2M5YjllMjUzNDJiNSIsInRhZyI6IiJ9', '20261.3.18.1I', 'aluno', '2026-08-31 19:30:46', '2026-08-31 19:30:55');
SET FOREIGN_KEY_CHECKS = 1;


