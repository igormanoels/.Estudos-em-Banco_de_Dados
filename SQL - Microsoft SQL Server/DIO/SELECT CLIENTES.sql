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

