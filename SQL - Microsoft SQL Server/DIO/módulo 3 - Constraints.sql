-- MÓDULO 3
-- NOT NULL: Não permite valor nulo
-- UNIQUE: Valor único em toda a tabela
-- CHECK: Garante uma determinada condição
-- DEFAULT: Valor padrão para inserção
-- PRIMARY KEY: É uma combinação de NOT NULL e UNIQUE
-- FOREIGN KEY: Garante que um registro exista em outra tabela
-----------------------------------------------------------------------------------------------------------------------------------------------
USE dioProdutos
SELECT * FROM Produtos


-- Alterar tabela
ALTER TABLE Produtos
ALTER COLUMN Preco DECIMAL(9,2) NOT NULL


-- Adciona uma Constraint deixando o valor unico
ALTER TABLE Produtos
ADD UNIQUE(Nome)

ALTER TABLE Produtos
ADD CONSTRAINT CHK_ColunaNome UNIQUE(Nome)


-- Adciona uma constraint para verificar a entrada conforme sua regra
ALTER TABLE Produtos
ADD CHECK(Genero = 'U' OR Genero = 'M' OR Genero = 'F')

ALTER TABLE Produtos
ADD CONSTRAINT CHK_ColunaGenero CHECK(Genero = 'U' OR Genero = 'M' OR Genero = 'F')


-- Adciona uma constraint para deixar um valor padrão
ALTER TABLE Produto
ADD DEFAULT GETDATE() FOR dataCadastro

ALTER TABLE Produto
ADD CONSTRAINT CHK_ColunaCadastro DEFAULT GETDATE() FOR dataCadastro


-- Apagando uma constraint 
ALTER TABLE Produtos
DROP CONSTRAINT 


-- Como visualizar as informações sobre uma tabela
EXEC sp_help 'Produtos'  -- ou  alt+F1



-----------------------------------------------------------------------------------------------------------------------------------------------
-- Criando uma procedure para insert
CREATE PROCEDURE inserirNovoProduto
	@Nome VARCHAR(255),
	@Cor VARCHAR(50),
	@Preco DECIMAL,
	@Tamanho VARCHAR(5),
	@Genero CHAR(1)
AS
INSERT INTO Produtos(Nome, Cor, Preco, Tamanho, Genero) 
VALUES (@Nome, @Cor, @Preco, @Tamanho, @Genero)


-- Executando a procedure
EXEC InserirNovoProduto
'Teste Procedure',
'ROXO',
10.31,
'G',
'U'
-- ou
EXECUTE InserirNovoProduto
'Teste Procedure 2',
'PRETO',
11.11,
'G',
'U'
-- ou
EXECUTE InserirNovoProduto
@Nome = 'Teste Procedure 2',
@Cor = 'PRETO',
@Preco = 11.11,
@Tamanho = 'G',
@Genero = 'U'


-----------------------------------------------------------------------------------------------------------------------------------------------
-- Criando uma procedure para select
CREATE PROCEDURE selecionarProdutoPorTamanho
@TamanhoProduto VARCHAR(5)
AS
SELECT * FROM Produtos WHERE Tamanho = @TamanhoProduto


-- Executando a procedure
EXEC selecionarProdutoPorTamanho 'P'


-----------------------------------------------------------------------------------------------------------------------------------------------
-- Criando uma procedure sem parametro
CREATE PROCEDURE selecionarTodosProdutos
AS
SELECT * FROM Produtos


-- Executando a procedure
EXEC selecionarTodosProdutos


-----------------------------------------------------------------------------------------------------------------------------------------------
-- Criando uma function
CREATE FUNCTION calcularDesconto(@Preco DECIMAL(13, 2), @Porcentagem INT)
RETURNS DECIMAL(13, 2)

BEGIN 
	RETURN @Preco - @Preco / 100 * @Porcentagem
END 



SELECT
	Nome, 
	Preco, 
	dbo.calcularDesconto(Preco, 10) AS 'Preco com desconto' --É necessário colocar o DBO. antes do nome da função
FROM 
	Produtos
WHERE 
	Tamanho = 'M'












