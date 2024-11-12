USE locadora

/* 1) Consultar, num_cadastro do cliente, nome do cliente, titulo do filme, 
data_fabricação do dvd, valor da locação, dos dvds que tem a maior data de 
fabricação dentre todos os cadastrados. */ 
SELECT 
    cliente.numCadastro AS num_cadastro,
    cliente.nome AS nome_cliente,
    filme.titulo AS titulo_filme,
    dvd.dataFabricacao AS data_fabricacao,
    locacao.valor AS valor_locacao
FROM 
    locacao
JOIN 
    dvd ON locacao.numDVD = dvd.num
JOIN 
    filme ON dvd.filmeId = filme.id
JOIN 
    cliente ON locacao.numCadastroCliente = cliente.numCadastro
WHERE 
    dvd.dataFabricacao = (SELECT MAX(dataFabricacao) FROM dvd)



/* 2) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
(Formato DD/MM/AAAA) e a quantidade de DVD ́s alugados por cliente (Chamar essa
coluna de qtd), por data de locação */
SELECT 
    cliente.numCadastro AS num_cadastro,
    cliente.nome AS nome_cliente,
    FORMAT(locacao.dataLocacao, 'dd/MM/yyyy') AS data_locacao,
    COUNT(locacao.numDVD) AS qtd
FROM 
    locacao
JOIN 
    cliente ON locacao.numCadastroCliente = cliente.numCadastro
GROUP BY 
    cliente.numCadastro, cliente.nome, locacao.dataLocacao



/* 3) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
(Formato DD/MM/AAAA) e a valor total de todos os dvd ́s alugados (Chamar essa
coluna de valor_total), por data de locação */
SELECT 
    cliente.numCadastro AS num_cadastro,
    cliente.nome AS nome_cliente,
    FORMAT(locacao.dataLocacao, 'dd/MM/yyyy') AS data_locacao,
    SUM(locacao.valor) AS valor_total
FROM 
    locacao
JOIN 
    cliente ON locacao.numCadastroCliente = cliente.numCadastro
GROUP BY 
    cliente.numCadastro, cliente.nome, locacao.dataLocacao



/* 4) Consultar Consultar, num_cadastro do cliente, nome do cliente, Endereço
concatenado de logradouro e numero como Endereco, data de locação (Formato
DD/MM/AAAA) dos clientes que alugaram mais de 2 filmes simultaneamente */
SELECT 
    cliente.numCadastro AS num_cadastro,
    cliente.nome AS nome_cliente,
    CONCAT(cliente.logradouro, ', ', cliente.num) AS endereco,
    FORMAT(locacao.dataLocacao, 'dd/MM/yyyy') AS data_locacao
FROM 
    locacao
JOIN 
    cliente ON locacao.numCadastroCliente = cliente.numCadastro
GROUP BY 
    cliente.numCadastro, cliente.nome, cliente.logradouro, cliente.num, locacao.dataLocacao
HAVING 
    COUNT(locacao.numDVD) > 2

