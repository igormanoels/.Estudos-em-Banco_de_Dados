CREATE DATABASE primeiraAula -- Cria a o banco de dados
USE primeiraAula -- Para utilizar uma database em especial

DROP DATABASE primeiraAula -- Exclui uma database

------------------------------------------------
CREATE DATABASE primeiraAula
GO 
USE primeiraAula -- outra forma de fazer, agora com uma execução única
------------------------------------------------
-- ctrl + r: ativa as mensagens 

CREATE TABLE produto (
codProduto		INT		NOT NULL,
nomeProduto		VARCHAR(20)		NOT NULL,
valorUnitario	DECIMAL(7,2)	NULL
PRIMARY KEY(codProduto)
)
GO -- Permite que as rotinas sejam executadas em ordem, uma vez que o sql possui concorrência por threads
CREATE TABLE pedido (
idPedido		INT		NOT NULL, 
dataPedido		DATE	NOT NULL
PRIMARY KEY(idPedido)
)
GO
CREATE TABLE produto_pedido (
codProduto		INT		NOT NULL,
idPedido		INT		NOT NULL,
quantidade		INT		NOT NULL,
valorTotal		DECIMAL	NOT NULL
PRIMARY KEY(codProduto, idPedido)
FOREIGN KEY(codProduto) REFERENCES produto(codProduto),
FOREIGN KEY(idPedido) REFERENCES pedido(idPedido)
)

------------------------------------------------
-- VERIFICAR DADOS DAS TABELAS: três todos os dados quanto a criação das tabelas
EXEC sp_help produto
EXEC sp_help pedido
EXEC sp_help produto_pedido
------------------------------------------------
-- MODIFICANDO ESTRUTURA: quando não houver dados na tabela
ALTER TABLE produto
ADD descricao	VARCHAR		NOT NULL
-- para definir uma pk caso tenha esquecido, ou queira adcionar outra
ALTER TABLE produto
ADD PRIMARY KEY(codProduto)
-- e também
ALTER TABLE produto_pedido
ADD FOREIGN KEY(codProduto)
-- alterando o domínio da coluna
ALTER TABLE produto
ALTER COLUMN descricao VARCHAR(50) NOT NULL
-- ou apenas a nulidade
ALTER TABLE produto
ALTER COLUMN descricao VARCHAR(50) NULL
------------------------------------------------
-- apaga a coluna
ALTER TABLE produto
DROP COLUMN descricao
-- apaga tabela
DROP TABLE produto
------------------------------------------------
-- EXIBE TUDO
SELECT * FROM produto
------------------------------------------------
-- Atualização de dados
UPDATE pedido
SET dataPedido = '2024-09-24'
-- WHERE dataPedido = '2024-09-27' -- você pode fazer para valores iguais
-- WHERE idPedido = 9113 -- mas o ideal é que sejam realizados em valores únicos
WHERE codProduto = 2 AND idPedido = 9113

UPDATE produto
SET valorUnitario = valorUnitario + 1.00
WHERE idProduto = 1 OR codProduto = 3
-- (<, <=, >, >=, != ou <>)
UPDATE produto_pedido
SET valorTotal = valorTotal * 0.9
WHERE idPedido < 9113
------------------------------------------------
-- exclusão
DELETE produto
WHERE codProduto = 2 -- Não será permitido porque a PK

DELETE produto
WHERE nomeProduto = 'Mouse'