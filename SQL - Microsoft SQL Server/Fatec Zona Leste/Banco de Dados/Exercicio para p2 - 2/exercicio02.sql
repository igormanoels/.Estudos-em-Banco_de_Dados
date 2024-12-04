CREATE DATABASE fatecExercicioMecanica
GO
USE fatecExercicioMecanica
--DROP DATABASE fatecExercicioMecanica
GO
CREATE TABLE cliente(
	carro CHAR(7) NOT NULL,
	nome VARCHAR(60) NOT NULL,
	logradouro VARCHAR(60) NOT NULL,
	numero INT NOT NULL,
	bairro VARCHAR(60) NOT NULL,
	telefone INT NOT NULL,
	PRIMARY KEY(carro)
)
GO
CREATE TABLE carro (
	placa CHAR(7) NOT NULL,
	marca VARCHAR(60) NOT NULL,
	modelo VARCHAR(60) NOT NULL,
	cor VARCHAR(30) NOT NULL,
	ano INT NOT NULL,
	PRIMARY KEY(placa),
	FOREIGN KEY(placa) REFERENCES cliente(carro)
)
GO
CREATE TABLE peca(
	codigo INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	valor DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (codigo)
)
GO
CREATE TABLE servico (
	id INT IDENTITY(1,1),
	carro CHAR(7) NOT NULL,
	peca INT NOT NULL,
	quantidade INT NOT NULL,
	valor DECIMAL(5,2) NOT NULL,
	dataServico DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (carro) REFERENCES cliente(carro),
	FOREIGN KEY (peca) REFERENCES peca(codigo)
)
GO
INSERT INTO cliente	(carro, nome, logradouro, numero, bairro, telefone) VALUES
	('DXO9876',	'João Alves', 'R. Pereira Barreto',	1258, 'Jd. Oliveiras', 21549658),
	('LKM7380', 'Ana Maria', 'R. 7 de Setembro', 259, 'Centro', 96588541),
	('EGT4631', 'Clara Oliveira', 'Av. Nações Unidas', 10254, 'Pinheiros', 24589658),
	('BCD7521', 'José Simões', 'R. XV de Novembro', 36,	'Água Branca', 78952459),
	('AFT9087', 'Paula Rocha', 'R. Anhaia', 548, 'Barra Funda', 69582548)
GO
INSERT INTO carro (placa, marca, modelo, cor, ano) VALUES
	('AFT9087',	'VW', 'Gol', 'Preto', 2007),
	('DXO9876',	'Ford', 'Ka', 'Azul', 2000),
	('EGT4631',	'Renault', 'Clio', 'Verde',	2004),
	('LKM7380',	'Fiat', 'Palio', 'Prata', 1997),
	('BCD7521',	'Ford',	'Fiesta', 'Preto', 1999)
GO
INSERT INTO peca (codigo, nome, valor) VALUES
	(1,	'Vela', 70),
	(2,	'Correia Dentada', 125),
	(3,	'Trambulador', 90),
	(4,	'Filtro de Ar',	30)
GO
INSERT INTO servico (carro, peca, quantidade, valor, dataServico) VALUES
	('DXO9876',	1,	4,	280, '2020-08-01'),
	('DXO9876',	4,	1,	30,	'2020-08-01'),
	('EGT4631',	3,	1,	90,	'2020-08-02'),
	('DXO9876',	2,	1,	125, '2020-08-07')


SELECT * FROM cliente
SELECT * FROM carro
SELECT * FROM servico
SELECT * FROM peca
	


--Consultar em Subqueries				
--Telefone do dono do carro Ka, Azul
SELECT 
	cliente.nome
FROM 
	cliente INNER JOIN carro
ON 
	cliente.carro = carro.placa
WHERE 
	carro.modelo = 'KA' AND carro.cor = 'Azul'


--Endereço concatenado do cliente que fez o serviço do dia 2020-08-02				
SELECT
	cliente.logradouro + ', ' + CAST(cliente.numero AS VARCHAR) + ' - ' + cliente.bairro
FROM 
	cliente INNER JOIN servico
ON 
	cliente.carro = servico.carro
WHERE 
	servico.dataServico = '2020-08-02'
	
				
--Consultar:				
--Placas dos carros de anos anteriores a 2001
SELECT 
	placa
FROM 
	carro
WHERE
	ano < 2001


--Marca, modelo e cor, concatenado dos carros posteriores a 2005
SELECT 
	marca + ' - ' + modelo + ' - ' + cor AS 'Informações dos carros'
FROM 
	carro
WHERE
	ano < 2005
			

--Código e nome das peças que custam menos de R$80,00
SELECT 
	codigo, nome
FROM 
	peca
WHERE 
	valor < 80 




