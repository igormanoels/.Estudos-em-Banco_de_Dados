USE dioClientes

-- Selecionando dados
--F5  --> EXECUTA O SCRIPT
--CTRL + K + C --> COMENTA O CÓDIGO

SELECT * FROM Clientes

SELECT Nome, Sobrenome FROM Clientes
ORDER BY Nome ASC -- Ordena em Crescente

SELECT Nome, Sobrenome FROM Clientes
ORDER BY Nome DESC -- Ordena em Decrecente

SELECT Nome, Sobrenome, Email FROM Clientes
ORDER BY Nome, Sobrenome -- Ordena ambos em ASC, podendo Omitir porque ele já defaut

SELECT Nome, Sobrenome, Email FROM Clientes
ORDER BY Nome, Sobrenome DESC -- Ordena em ASC e em DESC

SELECT Nome, Sobrenome FROM Clientes
WHERE Nome = 'Adam' -- Cláusula de verificação
ORDER BY Sobrenome

SELECT * FROM Clientes
WHERE AceitaComunicados = 1 -- Cláusula de verificação
ORDER BY Nome DESC

SELECT Nome, Sobrenome FROM Clientes
WHERE Nome = 'Michael' AND Sobrenome = 'Patten' -- Busca duas cláusulas

SELECT Nome, Sobrenome FROM Clientes
WHERE Nome = 'Tom' OR Sobrenome = 'Smith' -- Busca por uma das duas cláusulas

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome = 'Andre'
ORDER BY Nome, Sobrenome DESC -- Ordena em ASC e em DESC

SELECT * FROM Clientes
WHERE Nome LIKE 'G%' -- Busca os clientes que começam com a letra indicada
ORDER BY Sobrenome ASC

SELECT * FROM Clientes
WHERE Sobrenome LIKE '%V%' -- Busca qualquer sobrenome que contenha a letra indicada


-- Inserindo dados
INSERT INTO Clientes(Nome, Sobrenome, Email, AceitaComunicados, DataCadastro) 
VALUES ('Liandro', 'Ferreira', 'liandro@gmail.com', 0, GETDATE())

INSERT INTO Clientes VALUES ('Pedro', 'Lauro', 'pedro@gmail.com', 0, GETDATE()) 
-- também é possivel incluir dados seguindo a ordem das colunas

SELECT * FROM Clientes
ORDER BY Nome DESC


-- Atualizando dados
UPDATE Clientes 
SET Email = 'novo@email.com'
WHERE Nome = 'Ryan'

UPDATE Clientes 
SET Email = 'novo@email.com', AceitaComunicados = 1
WHERE id = 36

BEGIN TRAN -- Garante a possibilidade de desfazer uma ação no banco de dados
UPDATE Clientes 
SET AceitaComunicados = 1

ROLLBACK -- Desfaz a ação no banco de dados


-- Deletando dados
DELETE Clientes 
WHERE Id = 1





