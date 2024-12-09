CREATE DATABASE fatecExercicioLoja
GO
USE fatecExercicioLoja
GO
CREATE TABLE cliente ( 
	cpf VARCHAR(20) NOT NULL,
	nome VARCHAR(60) NOT NULL,
	telefone VARCHAR(20) NOT NULL
	PRIMARY KEY(cpf)
)
GO
CREATE TABLE fornecedor (
	id INT NOT NULL,
	nome VARCHAR(20) NOT NULL,
	logradouro VARCHAR(100),
	numero INT NOT NULL,
	complemento VARCHAR(60),
	cidade VARCHAR(30)
	PRIMARY KEY(id)
)
GO
CREATE TABLE produto (
	codigo INT NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	fornecedorId INT NOT NULL,
	preco DECIMAL(5,2) NOT NULL
	PRIMARY KEY(codigo),
	FOREIGN KEY(fornecedorId) REFERENCES fornecedor(id)
)
GO
CREATE TABLE venda(
	codigo INT NOT NULL,
	produtoCodigo INT NOT NULL,
	clienteCPF VARCHAR(20) NOT NULL,
	quantidade INT NOT NULL,
	valorTotal DECIMAL(8,2) NOT NULL,
	dataVenda DATE NOT NULL
	PRIMARY KEY (codigo, produtoCodigo, clienteCPF),
	FOREIGN KEY (produtoCodigo) REFERENCES produto(codigo),
	FOREIGN KEY (clienteCPF) REFERENCES cliente(cpf)
)


------------------------------------------------------------------------------------------------------------------------------------
-- INSERINDO DADOS
INSERT INTO cliente (cpf, nome, telefone) VALUES
	('345789092-90', 'Julio Cesar',	'8273-6541'),
	('251865337-10', 'Maria Antonia', '8765-2314'),
	('876273154-16', 'Luiz Carlos',	'6128-9012'),
	('791826398-00', 'Paulo Cesar',	'9076-5273')
GO
INSERT INTO fornecedor(id, nome, logradouro, numero, complemento, cidade) VALUES
	(1,	'LG', 'Rod. Bandeirantes', 70000, 'Km 70', 'Itapeva'),
	(2,	'Asus', 'Av. Nações Unidas', 10206, 'Sala 225', 'São Paulo'),
	(3, 'AMD', 'Av. Nações Unidas', 10206, 'Sala 1095', 'São Paulo'),
	(4, 'Leadership', 'Av. Nações Unidas', 10206,	'Sala 87', 'São Paulo'),
	(5,	'Inno', 'Av. Nações Unidas', 10206, 'Sala 34', 'São Paulo')
GO
INSERT INTO produto (codigo, descricao, fornecedorId, preco) VALUES
	(1, 'Monitor 19 pol.', 1, 449.99),
	(2,	'Netbook 1GB Ram 4 Gb HD', 2, 699.99),
	(3,	'Gravador de DVD - Sata',	1,	99.99),
	(4, 'Leitor de CD',	1, 49.99),
	(5,	'Processador - Phenom X3 - 2.1GHz', 3, 349.99),
	(6,	'Mouse', 4, 19.99),
	(7,	'Teclado', 4, 25.99),
	(8,	'Placa de Video - Nvidia 9800 GTX - 256MB/256 bits', 5,	599.99)
GO
INSERT INTO venda (codigo, produtoCodigo, clienteCPF, quantidade, valorTotal, dataVenda) VALUES
	(1, 1, '251865337-10', 1, 449.99, '03-09-2009'),
	(1, 4, '251865337-10', 1, 49.99, '03-09-2009'),
	(1, 5, '251865337-10', 1, 349.99, '03-09-2009'),
	(2, 6, '791826398-00', 4, 79.96, '06-09-2009'),
	(3, 8, '876273154-16', 1, 599.99, '06-09-2009'),
	(3, 3, '876273154-16', 1, 99.99, '06-09-2009'),
	(3, 7, '876273154-16', 1, 25.99, '06-09-2009'),
	(4, 2, '345789092-90', 2, 1399.98, '08-09-2009')


------------------------------------------------------------------------------------------------------------------------------------
-- SELECIONANDO DADOS
--Consultar no formato dd/mm/aaaa: Data da Venda 4
SELECT 
	FORMAT(dataVenda, 'dd/MM/yyyy') as 'data da venda'
FROM
	venda
WHERE
	codigo = 4


--Inserir na tabela Fornecedor, a coluna Telefone
--e os seguintes dados:
--1	7216-5371
--2	8715-3738
--4	3654-6289
ALTER TABLE fornecedor 
ADD telefone VARCHAR(20) NULL
	
SELECT * FROM fornecedor

UPDATE fornecedor SET telefone = '7216-5371' WHERE fornecedor.id = 1
UPDATE fornecedor SET telefone = '8715-3738' WHERE fornecedor.id = 2
UPDATE fornecedor SET telefone = '3654-6289' WHERE fornecedor.id = 4


--Consultar por ordem alfabética de nome, o nome, o enderço concatenado e o telefone dos fornecedores
SELECT 
	nome, 
	logradouro + ', ' + (CAST(numero AS VARCHAR)) + ' - ' + complemento AS 'endereco completo',
	telefone 
FROM
	fornecedor
ORDER BY
	nome ASC
	

--Produto, quantidade e valor total do comprado por Julio Cesar
SELECT
	produto.descricao, venda.quantidade, venda.valorTotal
FROM
	cliente 
		INNER JOIN venda ON cliente.cpf = venda.clienteCPF
		INNER JOIN produto ON produto.codigo = venda.produtoCodigo
WHERE
	cliente.nome LIKE '%JULIO%'


--Data, no formato dd/mm/aaaa e valor total do produto comprado por  Paulo Cesar
SELECT
	FORMAT(venda.dataVenda, 'dd/MM/yyyy') AS 'data',
	venda.valorTotal
FROM 
	venda INNER JOIN cliente ON venda.clienteCPF = cliente.cpf
WHERE
	cliente.nome LIKE '%Paulo Cesar%'


--Consultar, em ordem decrescente, o nome e o preço de todos os produtos 
SELECT
	produto.descricao, 
	'R$ ' +	CAST(FORMAT(produto.preco, '###.###,##') AS VARCHAR) AS 'preço'
FROM 
	produto
ORDER BY descricao DESC
























