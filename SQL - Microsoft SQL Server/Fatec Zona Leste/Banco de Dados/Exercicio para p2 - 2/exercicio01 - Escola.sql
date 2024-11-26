CREATE DATABASE exercicio01Escola
GO
USE exercicio01Escola
GO
CREATE TABLE aluno(
	ra INT,
	nome VARCHAR(30),
	sobrenome VARCHAR(30),
	rua VARCHAR(30),
	numero INT,
	bairro VARCHAR(30),
	cep INT,
	telefone INT
	PRIMARY KEY(ra)
)
GO
CREATE TABLE disciplina (
	codigo INT,
	nome VARCHAR(30),
	carga_horaria INT,
	turno VARCHAR(10),
	semestre INT
	PRIMARY KEY(codigo)
)
GO
CREATE TABLE curso (
	codigo INT,
	nome VARCHAR(30),
	carga_horaria INT,
	turno VARCHAR(10),
	codigoDisciplina INT,
	raAluno INT	
	PRIMARY KEY(codigo)
	FOREIGN KEY(codigoDisciplina) REFERENCES disciplina(codigo),
	FOREIGN KEY(raAluno) REFERENCES aluno(ra)	
)


SELECT * FROM aluno
SELECT * FROM disciplina
SELECT * FROM curso


----------------------------------------------------------------------------------
-- INSERINDO DADOS
INSERT INTO aluno (ra,  nome, sobrenome, rua, numero, bairro, cep, telefone) VALUES
(12345,	'José',	'Silva', 'Almirante Noronha', 236, 'Jardim São Paulo', 1589000,	69875287),
(12346,	'Ana', 'Maria Bastos',	'Anhaia', 1568,	'Barra Funda', 3569000,	25698526),
(12347,	'Mario', 'Santos',	'XV de Novembro', 1841,	'Centro', 1020030, NULL),	
(12348,	'Marcia', 'Neves',	'Voluntários da Patria', 225, 'Santana', 2785090,	78964152);
GO
INSERT INTO disciplina (codigo,	nome, carga_horaria, turno, semestre) VALUES
(1,	'Informática', 4, 'Tarde', 1),
(2, 'Informática', 4, 'Noite', 1),
(3,	'Quimica', 4, 'Tarde', 1),
(4,	'Quimica', 4, 'Noite', 1),
(5,	'Banco de Dados I',	2, 'Tarde', 3),
(6,	'Banco de Dados I',	2, 'Noite', 3),
(7,	'Estrutura de Dados', 4, 'Tarde', 4),
(8,	'Estrutura de Dados', 4, 'Noite', 4)
GO
INSERT INTO curso (codigo, nome, carga_horaria, turno) VALUES
(1,	'Informática', 2800, 'Tarde'),
(2,	'Informática', 2800, 'Noite'),
(3,	'Logística', 2650,	'Tarde'),
(4,	'Logística', 2650,	'Noite'),
(5,	'Plásticos', 2500,	'Tarde'),
(6,	'Plásticos', 2500, 'Noite')


----------------------------------------------------------------------------------
-- CONSULTAS
--Nome e sobrenome, como nome completo dos Alunos Matriculados
SELECT 
	aluno.nome + ' ' + aluno.sobrenome AS 'nome completo'
FROM aluno


--Rua, nº , Bairro e CEP como Endereço do aluno que não tem telefone
SELECT
	aluno.rua, aluno.numero, aluno.bairro, aluno.cep
FROM 
	aluno
WHERE
	aluno.telefone IS NULL


--Telefone do aluno com RA 12348
SELECT 
	SUBSTRING(CAST(aluno.telefone AS VARCHAR(8)), 1, 4) + '-' + 
	SUBSTRING(CAST(aluno.telefone AS VARCHAR(8)), 5, 4) AS telefone
FROM 
	aluno
WHERE 
	aluno.ra = 12348


--Nome e Turno dos cursos com 2800 horas
SELECT 
	aluno.nome, curso.turno
FROM
	aluno INNER JOIN curso ON aluno.ra = curso.raAluno
WHERE
	curso.carga_horaria >= 2800



--O semestre do curso de Banco de Dados I noite
SELECT 
	disciplina.semestre
FROM
	disciplina INNER JOIN curso ON disciplina.codigo = curso.codigoDisciplina
WHERE 
	curso.nome = 'Banco de Dados I' AND curso.turno = 'Noite'


	
SELECT * FROM aluno
SELECT * FROM disciplina
SELECT * FROM curso