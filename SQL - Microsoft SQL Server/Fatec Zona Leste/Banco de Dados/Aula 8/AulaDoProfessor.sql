/*
Esquema - DDL:
CREATE - ALTER - DROP
*/
CREATE DATABASE primeiraaula20242
 
USE primeiraaula20242
USE master
 
DROP DATABASE primeiraaula20242
------------------------------------------------------------------------------------
CREATE DATABASE primeiraaula20242
GO
USE primeiraaula20242
------------------------------------------------------------------------------------
/*Criação de Tabelas
CREATE TABLE nome (
Atr1		TIPO		NULIDADE,
Atr2		TIPO		NULIDADE,
...
AtrN		TIPO		NULIDADE
PRIMARY KEY (Atr1) ou PRIMARY KEY (Atr1, Atr2,...)
FOREIGN KEY (Atr4) REFERENCES TabelaX(PK),
FOREIGN KEY (Atr5) REFERENCES TabelaY(PK)
)
*/
CREATE TABLE produto (
codProduto		INT				NOT NULL,
nomeProduto		VARCHAR(20)		NOT NULL,
valorUnitario	DECIMAL(7,2)	NULL
PRIMARY KEY(codProduto)
)
GO
CREATE TABLE pedido (
idPedido		INT				NOT NULL,
dataPedido		DATE			NOT NULL
PRIMARY KEY(idPedido)
)
GO
CREATE TABLE produto_pedido (
codProd			INT				NOT NULL,
idPed			INT				NOT NULL,
qtde			INT				NOT NULL,
valorTotal		DECIMAL(7,2)	NOT NULL
PRIMARY KEY(codProd, idPed)
FOREIGN KEY(codProd) REFERENCES produto(codProduto),
FOREIGN KEY(idPed) REFERENCES pedido(idPedido)
)
----------------------------------------------------------------------
/*Verificar dados das tabelas
EXEC sp_help nome
*/
EXEC sp_help produto
EXEC sp_help pedido
EXEC sp_help produto_pedido
----------------------------------------------------------------------
/*Modificações na estrutura da tabela
ALTER TABLE nome
*/
--Colocar coluna descricao VARCHAR(50) no Produto
ALTER TABLE produto
ADD descricao VARCHAR NOT NULL
 
/*Se eu tivesse esquecido de definir a PK
ALTER TABLE produto
ADD FOREIGN KEY(codProd) REFERENCES produto(codProduto)
*/
 
/*Se eu tivesse esquecido de definir a FK
ALTER TABLE produto_pedido
ADD FOREIGN KEY(codProduto)
*/
 
--Modificar Tipo de Domínio ou NULIDADE da Coluna descricao de VARCHAR(1) para VARCHAR(50)
ALTER TABLE produto
ALTER COLUMN descricao VARCHAR(50) NOT NULL
 
ALTER TABLE produto
ALTER COLUMN descricao VARCHAR(50) NULL
 
--Descartar uma coluna
ALTER TABLE produto
DROP COLUMN descricao
----------------------------------------------------------------------
/*Renomear Coluna ou Tabela
EXEC sp_rename 'dbo.tabela.coluna', 'novo_nome', 'COLUMN' --Para colunas
EXEC sp_rename 'dbo.tabela', 'novo_nome' --Para tabelas
*/
ALTER TABLE produto
ADD descricao VARCHAR(50) NULL
 
SELECT * FROM produto
 
EXEC sp_rename 'dbo.produto.descricao', 'desc', 'COLUMN'
EXEC sp_rename 'dbo.produto.desc', 'descr', 'COLUMN'
 
ALTER TABLE produto
DROP COLUMN descr
----------------------------------------------------------------------
/*Descartar uma tabela
DROP TABLE nome
*/
DROP TABLE produto
----------------------------------------------------------------------
/*
Instância - DML:
INSERT (Create) - SELECT (Read) - UPDATE (Update) - DELETE (Delete)
*/
/*Inserindo Registros (Linhas ou Tuplas) em uma tabela
INSERT INTO nome (Atr1, Atr2, ..., AtrN) VALUES
(Dado1Atr1, Dado1Atr2, ..., Dado1AtrN)
 
Em blocos (Bulk Insert)
INSERT INTO nome (Atr1, Atr2, ..., AtrN) VALUES
(Dado1Atr1, Dado1Atr2, ..., Dado1AtrN),
(Dado2Atr1, Dado2Atr2, ..., Dado2AtrN),
(Dado3Atr1, Dado3Atr2, ..., Dado3AtrN),
...
(DadoNAtr1, DadoNAtr2, ..., DadoNAtrN)
*/
INSERT INTO produto(codProduto, nomeProduto, valorUnitario) VALUES
(1, 'Carregador Celular', 45.99)
 
INSERT INTO produto VALUES
(2, 'Mouse', 35.00)
 
INSERT INTO produto(valorUnitario, codProduto, nomeProduto) VALUES
(75.99, 3, 'Teclado')
 
INSERT INTO produto VALUES
(4, 'Adaptador USB', 29.90),
(5, 'Trava Notebook', 18.50),
(6, 'Cooler Notebook', 139.00)
 
INSERT INTO produto VALUES
(7, 'Cabo USB C', NULL)
 
INSERT INTO produto(codProduto, nomeProduto) VALUES
(8, 'Mousepad')
 
INSERT INTO pedido VALUES 
(9111, '2024-09-25'), --(9111,'25/09/2024')
(9112, '2024-09-26'),
(9113, '2024-09-27')
 
INSERT INTO produto_pedido VALUES
(4, 9111, 20, 598.00),
(5, 9112, 10, 185.00),
(2, 9113, 2, 70.00)
 
----------------------------------------------------------------------
/*Consultando todas as linhas e todas as colunas de uma tabela
SELECT * FROM nome
*/
SELECT * FROM produto
SELECT * FROM pedido
SELECT * FROM produto_pedido
 
----------------------------------------------------------------------
/*Atualização de dados de uma tabela
UPDATE nome
SET Atr1 = novo_valor, Atr2 = novo_valor, ...
WHERE condição(ões)
*/
UPDATE pedido
SET dataPedido = '2024-09-28' --'28/09/2024
--WHERE dataPedido = '2024-09-27'
WHERE idPedido = 9113
 
UPDATE produto_pedido
SET qtde = 4, valorTotal = 140.00
WHERE codProd = 2 AND idPed = 9113
 
UPDATE produto
SET valorUnitario = valorUnitario + 1.00
WHERE codProduto = 1 OR codProduto = 3
 
UPDATE produto_pedido
SET valorTotal = valorTotal * 0.9
WHERE idPed < 9113 --(=, != ou <>, <, <=, >, >=)
 
----------------------------------------------------------------------
/*Exclusão de registros (linhas) de uma tabela
DELETE nome
WHERE condição(ões)
*/
DELETE produto
WHERE codProduto = 2
 
DELETE produto
WHERE nomeProduto = 'Mouse'
