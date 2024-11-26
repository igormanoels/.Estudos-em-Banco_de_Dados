/*
Um campeonato de basquete tem times que são cadastrados por um id único, que começa em 4001 e 
incrementa de 1 em 1, o nome do time que também deve ser único e a cidade. 
Um time tem muitos jogadores, porém 1 jogador só pode jogar em 1 time e os jogadores são 
cadastrados por um código único que inicia em 900101, incrementa de 1 em 1, o nome do jogador 
deve ser único e ter mais de 3 caracteres, sexo pode apenas ser M ou F, mas a maioria dos 
jogadores é Homem, altura com 2 casas decimais e a data de nascimento (apenas jogadores 
nascidos até 31/12/1999). 
Jogadores do sexo masculino devem ter, no mínimo 1.70 de altura e do  sexo feminino, 1.60).
*/
 
/*
CONSTRAINTS - RESTRIÇÕES:
	PK - Cria um índice para busca e define unicidade
	FK - Cria uma referência entre PK e FK para fazer validações
		(NÃO importa dados de outra tabela)
	IDENTITY(X,Y) - Auto-incremento, inicia em X, Y define o passo 
	DEFAULT(X) - Caso a coluna não receba valor, será preenchida com X
	UNIQUE - Define unicidade
	CHECK - Valida alguma regra, caso falhe, o registro é excluído
		(Nível de coluna ou nível de tabela)
*/
 
 
CREATE DATABASE aulaconstraints2024
GO
USE aulaconstraints2024
GO
CREATE TABLE times (
id			INT				NOT NULL	IDENTITY(4001,1),
nome		VARCHAR(50)		NOT NULL	UNIQUE,
cidade		VARCHAR(80)		NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE jogador (
codigo		INT				NOT NULL	IDENTITY(900101, 1),
nome		VARCHAR(60)		NOT NULL	UNIQUE CHECK(LEN(nome) > 3),
sexo		CHAR(1)			NULL		DEFAULT('M') CHECK(UPPER(sexo) = 'M' OR UPPER(sexo) = 'F'),
altura		DECIMAL(7,2)	NOT NULL,
dt_nasc		DATE			NOT NULL	CHECK(dt_nasc <= '1999-12-31'), -- 31/12/1999
id_time		INT				NOT NULL
PRIMARY KEY (codigo),
FOREIGN KEY (id_time) REFERENCES times(id),
CONSTRAINT chk_sx_alt 
	CHECK((UPPER(sexo) = 'M' AND altura >= 1.70) OR (UPPER(sexo) = 'F' AND altura >= 1.60))
)
 
EXEC sp_help times
EXEC sp_help jogador
 
SELECT * FROM times
SELECT * FROM jogador
 
INSERT INTO times (nome, cidade) VALUES
('Thunders', 'Garça'),
('Bulls', 'Salto'),
('Hawks', 'Santo André') 
 
--INSERT INTO times (nome, cidade) VALUES
--('Bulls', 'Avaré')
--Erro de nome duplicado
INSERT INTO times (nome, cidade) VALUES
('Jazz', 'Avaré')
 
DELETE times
WHERE id = 4005
 
--DBCC CHECKIDENT
--https://learn.microsoft.com/pt-br/sql/t-sql/database-console-commands/dbcc-checkident-transact-sql?view=sql-server-ver16
DBCC CHECKIDENT('times', RESEED, 4003)
 
--Jazz passa a ter ID 4004
INSERT INTO times (nome, cidade) VALUES
('Jazz', 'Avaré')
 
INSERT INTO jogador (nome, altura, dt_nasc, id_time) VALUES
('M. Jordan', 1.98, '1971-10-01', 4002)
 
INSERT INTO jogador (nome, altura, sexo, dt_nasc, id_time) VALUES
('M. Hortencia', 1.78, 'f', '1975-08-17', 4004)
 
DELETE jogador --(Apaga tudo mas mantém id perdidos)
 
TRUNCATE TABLE jogador --(DROP TABLE && CREATE TABLE, reinicia o identity)
 
--LEN(coluna) ==> número de caracteres do dado
--UPPER(coluna) ==> retorna o dado em caixa alta
--LOWER(coluna) ==> retorna o dado em caixa baixa