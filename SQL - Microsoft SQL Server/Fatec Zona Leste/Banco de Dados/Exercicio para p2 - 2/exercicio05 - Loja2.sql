CREATE DATABASE fatec05ExercicioLoja02
GO 
USE fatec05ExercicioLoja02
GO
CREATE TABLE cliente (
	codigo INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	logradouro VARCHAR(30) NOT NULL,
	numero INT NOT NULL,
	telefone INT NOT NULL,
	dataNascimento DATE
	PRIMARY KEY(codigo)
)
GO
CREATE TABLE fornecedor (
	codigo INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	atividade VARCHAR(30) NOT NULL,
	telefone INT NOT NULL,
	PRIMARY KEY(codigo)
)
GO
CREATE TABLE produto (
	codigo INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	valorUnitario DECIMAL(13,2),
	quantidadeEstoque INT NOT NULL,
	descricao VARCHAR(30) NOT NULL,
	codigoFornecedor INT NOT NULL
	PRIMARY KEY(codigo),
	FOREIGN KEY(codigoFornecedor) REFERENCES fornecedor(codigo)
)
GO
CREATE TABLE pedido (
	codigo INT NOT NULL,
	codigoCliente INT NOT NULL,
	codigoProduto INT NOT NULL,
	quantidade INT NOT NULL,
	previsaoEntrega DATE
	PRIMARY KEY(codigo, codigoCliente, codigoProduto)
	FOREIGN KEY(codigoCliente) REFERENCES cliente(codigo),
	FOREIGN KEY(codigoProduto) REFERENCES produto(codigo)
)

SELECT * FROM cliente
SELECT * FROM produto
SELECT * FROM fornecedor
SELECT * FROM pedido

-----------------------------------------------------------------------------------------------------------------------------------
-- INSERINDO DADOS
INSERT INTO cliente (codigo, nome, logradouro, numero, telefone, dataNascimento) VALUES
	(33601, 'Maria Clara', 'R. 1° de Abril', 870, 96325874, '2000-08-15'),
	(33602, 'Alberto Souza', 'R. XV de Novembro', 987, 95873625, '1985-02-02'),
	(33603, 'Sonia Silva', 'R. Voluntários da Pátria', 1151, 75418596, '1957-08-23'),
	(33604, 'José Sobrinho', 'Av. Paulista', 250, 85236547, '1986-12-09'),
	(33605, 'Carlos Camargo', 'Av. Tiquatira', 9652, 75896325, '1971-03-25')


INSERT INTO fornecedor (codigo, nome, atividade, telefone) VALUES
	(1001, 'Estrela', 'Brinquedo', 41525898),
	(1002, 'Lacta', 'Chocolate', 42698596),
	(1003, 'Asus', 'Informática', 52014596),
	(1004, 'Tramontina', 'Utensílios Domésticos', 50563985),
	(1005, 'Grow', 'Brinquedos', 47896325),
	(1006, 'Mattel', 'Bonecos', 59865898)


INSERT INTO produto (codigo, nome, valorUnitario, quantidadeEstoque, descricao, codigoFornecedor) VALUES
	(1, 'Banco Imobiliário', 65.00,	15,	'Versão Super Luxo', 1001),
	(2, 'Puzzle 5000 peças', 50.00,	5,	'Mapas Mundo', 1005),
	(3, 'Faqueiro',	350.00,	0, '120 peças', 1004),
	(4, 'Jogo para churrasco', 75.00, 3, '7 peças', 1004),
	(5, 'Tablet',	750.00,	29, 'Tablet', 1003),
	(6, 'Detetive',	49.00,	0, 'Nova Versão do Jogo', 1001),
	(7, 'Chocolate com Paçoquinha', 6.00, 0, 'Barra', 1002),
	(8, 'Galak', 5.00, 65, 'Barra', 1002)


INSERT INTO pedido (codigo, codigoCliente, codigoProduto, quantidade, previsaoEntrega) VALUES
	(99001, 33601, 1, 1, '2012-06-07'),
	(99001, 33601, 2, 1, '2012-06-07'),
	(99001, 33601, 8, 3, '2012-06-07'),
	(99002, 33602, 2, 1, '2012-06-09'),
	(99002, 33602, 4, 3, '2012-06-09'),
	(99003, 33605, 5, 1, '2012-06-15')

-----------------------------------------------------------------------------------------------------------------------------------
-- CONSULTANDO DADOS							
--Consultar a quantidade, valor total e valor total com desconto (25%) dos itens comprados par Maria Clara.										
SELECT
	pedido.quantidade,
	'R$ ' + FORMAT((produto.valorUnitario * pedido.quantidade), '###,###.##') AS 'valor total',
	'R$ ' + FORMAT(((produto.valorUnitario * pedido.quantidade ) * 0.75), '###,###.##') AS 'valor com desconto'
FROM
	pedido
		INNER JOIN cliente ON cliente.codigo = pedido.codigoCliente
		INNER JOIN produto ON produto.codigo = pedido.codigoProduto
WHERE
	cliente.nome = 'Maria Clara'


--Verificar quais brinquedos não tem itens em estoque.
SELECT
	produto.codigo, produto.nome, produto.quantidadeEstoque
FROM 
	produto INNER JOIN fornecedor ON produto.codigoFornecedor = fornecedor.codigo
WHERE
	produto.quantidadeEstoque = 0 AND fornecedor.atividade LIKE 'B%'

									
--Alterar para reduzir em 10% o valor das barras de chocolate.										
UPDATE 
	produto 
SET 
	valorUnitario = valorUnitario * 0.9 
WHERE
	descricao = 'barra'


--Alterar a quantidade em estoque do faqueiro para 10 peças.
UPDATE
	produto
SET
	quantidadeEstoque += 10
WHERE
	nome = 'faqueiro'

									
--Consultar quantos clientes tem mais de 40 anos.
SELECT
	cliente.nome,
	DATEDIFF(YEAR, cliente.dataNascimento, GETDATE()) AS idade
FROM 
	cliente
WHERE
	(DATEDIFF(YEAR, cliente.dataNascimento, GETDATE())) >= 40

-- outra forma
SELECT
    nome, idade
FROM (
    SELECT
        cliente.nome,
        DATEDIFF(YEAR, cliente.dataNascimento, GETDATE()) AS idade
    FROM 
        cliente
) AS Subquery
WHERE 
    idade >= 40

									
--Consultar Nome e telefone dos fornecedores de Brinquedos e Chocolate.
SELECT DISTINCT -- impede valores repetidos
	fornecedor.nome, fornecedor.telefone
FROM
	fornecedor LEFT JOIN produto ON produto.codigoFornecedor = fornecedor.codigo
WHERE
	fornecedor.atividade = 'Chocolate' OR fornecedor.atividade LIKE 'B%'


-- outra forma de impedir é agrupando
SELECT
	fornecedor.nome, fornecedor.telefone
FROM
	fornecedor LEFT JOIN produto ON produto.codigoFornecedor = fornecedor.codigo
WHERE
	fornecedor.atividade = 'Chocolate' OR fornecedor.atividade LIKE 'B%'
GROUP BY
	fornecedor.nome, fornecedor.telefone


--Consultar nome e desconto de 25% no preço dos produtos que custam menos de R$50,00
SELECT
	produto.nome,
	'R$ ' + FORMAT((produto.valorUnitario * 0.75), '###,###.##') AS 'valor com desconto' 
FROM
	produto
WHERE
	valorUnitario < 50

										
--Consultar nome e aumento de 10% no preço dos produtos que custam mais de R$100,00
SELECT
	produto.nome,
	'R$ ' + FORMAT((produto.valorUnitario * 1.1), '###,###.##') AS 'valor com aumento' 
FROM
	produto
WHERE
	valorUnitario > 100

-- outra forma
SELECT
    produto.nome,
    'R$ ' + STR((produto.valorUnitario * 1.1), 10, 2) AS 'valor com aumento'
FROM
    produto
WHERE
    valorUnitario > 100

										
--Consultar desconto de 15% no valor total de cada produto da venda 99001.
SELECT
	produto.nome, 
	'R$ ' + FORMAT((produto.valorUnitario * 0.85), '###,###.##') AS 'valor com desconto' 
FROM
	produto INNER JOIN pedido ON pedido.codigoProduto = produto.codigo
WHERE
	pedido.codigo = 99001
								
									
--Consultar Código do pedido, nome do cliente e idade atual do cliente										
SELECT
	pedido.codigo,
	cliente.nome,
	DATEDIFF(YEAR, cliente.dataNascimento, GETDATE()) AS 'idade'
FROM
	pedido INNER JOIN cliente ON cliente.codigo = pedido.codigoCliente





