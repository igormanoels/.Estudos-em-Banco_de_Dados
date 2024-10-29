----------------------------------------------------------------
-- CRIANDO O BANCO DE DADOS
----------------------------------------------------------------
CREATE DATABASE locadora
GO
USE locadora
GO
CREATE TABLE filme (
id INT NOT NULL,
titulo VARCHAR(40) NOT NULL,
ano INT
PRIMARY KEY(id)
CONSTRAINT chk_ano CHECK(ano <= 2021)
)
GO
CREATE TABLE dvd (
num INT NOT NULL,
dataFabricacao DATE,
filmeId INT NOT NULL
PRIMARY KEY(num)
FOREIGN KEY(filmeId) REFERENCES filme(id),
CONSTRAINT chk_dataFabricacao CHECK(dataFabricacao <= '29/10/2024')
)
GO
CREATE TABLE estrela (
id INT NOT NULL,
nome VARCHAR(50) NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE cliente (
numCadastro INT NOT NULL,
nome VARCHAR(70) NOT NULL,
logradouro VARCHAR(150) NOT NULL,
num INT NOT NULL,
cep CHAR(8)
PRIMARY KEY(numCadastro),
CONSTRAINT chk_numEndereco CHECK(num >= 0),
CONSTRAINT chk_cep CHECK(LEN(cep) = 8)
)
GO
CREATE TABLE locacao (
numDVD INT NOT NULL,
numCadastroCliente INT NOT NULL,
dataLocacao DATE NOT NULL DEFAULT GETDATE(),
dataDevolucao DATE NOT NULL,
valor DECIMAL(7,2) NOT NULL
PRIMARY KEY(numDVD, numCadastroCliente, dataLocacao)
FOREIGN KEY(numDVD) REFERENCES dvd(num),
FOREIGN KEY(numCadastroCliente) REFERENCES cliente(numCadastro),
CONSTRAINT chk_devolucao CHECK(dataDevolucao >= dataLocacao),
CONSTRAINT chk_valor CHECK(valor >= 0)
)
GO
CREATE TABLE filmeEstrela (
filmeId INT NOT NULL,
estrelaId INT NOT NULL
PRIMARY KEY(filmeId, estrelaId)
FOREIGN KEY(filmeId) REFERENCES filme(id),
FOREIGN KEY(estrelaId) REFERENCES estrela(id)
)


----------------------------------------------------------------
-- ALTERANDO A TABELA
----------------------------------------------------------------
ALTER TABLE estrela
ADD nomeReal VARCHAR(50) NOT NULL
GO
ALTER TABLE filme
ALTER COLUMN titulo VARCHAR(80) NOT NULL


----------------------------------------------------------------
-- INSERINDO DADOS
----------------------------------------------------------------
INSERT INTO filme (id, titulo, ano) VALUES
(1001, 'Whisplash', 2015),
(1002, 'Birdman', 2015),
(1003, 'Interestelar', 2014),
(1004, 'A culpa é das estrelas', 2014),
(1005, 'Alexandre e o dia terrível, horrível, espantoso e horroroso', 2014),
(1006, 'Sing', 2016)
GO
INSERT INTO estrela (id, nome, nomeReal) VALUES
(9901, 'Michael Keaton', 'Michael John Douglas'),
(9902, 'Emma Stone', 'Emily Jean Stone'),
(9903, 'Miles Teller', ''),
(9904, 'Steve Carell', 'Steven John Carell'),
(9905, 'Jennifer Garner', 'Jennifer Anne Garner')
GO
INSERT INTO filmeEstrela (filmeId, estrelaId) VALUES
(1002, 9901),
(1002, 9902),
(1001, 9903),
(1005, 9904),
(1005, 9905)
GO
INSERT INTO dvd (num, dataFabricacao, filmeId) VALUES
(10001, '2020-12-02', 1001),
(10002, '2019-10-18', 1002),
(10003, '2020-04-03', 1003),
(10004, '2020-12-02', 1001),
(10005, '2019-10-18', 1004),
(10006, '2020-04-03', 1002),
(10007, '2020-12-02', 1005),
(10008, '2019-10-18', 1002),
(10009, '2020-04-03', 1003)
GO
INSERT INTO cliente (numCadastro, nome, logradouro, num, cep) VALUES
(5501, 'Matilde Luz', 'Rua Siria', 150, '03086040'),
(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110'),
(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, NULL),
(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, NULL),
(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')
GO
INSERT INTO locacao (numDvd, numCadastroCliente, dataLocacao, dataDevolucao, valor) VALUES
(10001, 5502, '2021-02-18', '2021-02-21', 3.50),
(10009, 5502, '2021-02-18', '2021-02-21', 3.50),
(10002, 5503, '2021-02-18', '2021-02-19', 3.50),
(10002, 5505, '2021-02-20', '2021-02-23', 3.00),
(10004, 5505, '2021-02-20', '2021-02-23', 3.00),
(10005, 5505, '2021-02-20', '2021-02-23', 3.00),
(10001, 5501, '2021-02-24', '2021-02-26', 3.50),
(10008, 5501, '2021-02-24', '2021-02-26', 3.50)

SELECT * FROM filme
SELECT * FROM estrela
SELECT * FROM filmeEstrela
SELECT * FROM dvd
SELECT * FROM cliente
SELECT * FROM locacao


----------------------------------------------------------------
-- ALTERANDO DADOS
----------------------------------------------------------------
UPDATE cliente
SET cep = '08411150'
WHERE numCadastro = 5503
GO
UPDATE cliente
SET cep = '02918190'
WHERE numCadastro = 5504
GO
UPDATE locacao
SET valor = 3.25
WHERE numCadastroCliente = 5502 AND dataLocacao = '2021-02-18'
GO
UPDATE locacao
set valor = 3.10
WHERE numCadastroCliente = 5501 AND dataLocacao = '2021-02-24'
GO
UPDATE dvd
set dataFabricacao = '2019-07-14'
WHERE num = 10005
GO
UPDATE estrela
set nomeReal = 'Miles Alexander Teller'
WHERE nome = 'Miles Teller'
GO
DELETE filme
WHERE titulo = 'Sing' AND id = 1006


----------------------------------------------------------------
-- CONSULTAR DADOS
----------------------------------------------------------------
-- 01
SELECT 
    f.id, 
    f.ano, 
    CASE 
        WHEN LEN(f.titulo) > 10 THEN LEFT(f.titulo, 10) + '...' 
        ELSE f.titulo 
    END AS nomeFilme
FROM 
    filme f
JOIN 
    dvd d ON f.id = d.filmeId
WHERE 
    d.dataFabricacao > '2020-01-01'


-- 02
SELECT 
    d.num AS num_dvd, 
    d.dataFabricacao, 
    DATEDIFF(MONTH, d.dataFabricacao, GETDATE()) AS qtd_meses_desde_fabricacao
FROM 
    dvd d
JOIN 
    filme f ON d.filmeId = f.id
WHERE 
    f.titulo = 'Interestelar'


-- 03
SELECT 
    l.numDVD AS num_dvd, 
    l.dataLocacao, 
    l.dataDevolucao, 
    DATEDIFF(DAY, l.dataLocacao, l.dataDevolucao) AS dias_alugado,
    l.valor
FROM 
    locacao l
JOIN 
    cliente c ON l.numCadastroCliente = c.numCadastro
WHERE 
    c.nome LIKE '%Rosa%'

-- 04
SELECT 
    c.nome, 
    c.logradouro + ', ' + CAST(c.num AS VARCHAR(10)) AS endereco_completo,
    STUFF(c.cep, 6, 0, '-') AS cep
FROM 
    locacao l
JOIN 
    cliente c ON l.numCadastroCliente = c.numCadastro
WHERE 
    l.numDVD = 10002

