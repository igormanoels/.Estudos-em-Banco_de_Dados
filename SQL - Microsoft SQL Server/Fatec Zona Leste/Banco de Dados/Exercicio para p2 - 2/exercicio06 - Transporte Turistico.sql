CREATE DATABASE fatec06ExercicioTransporteOnibus
GO
USE fatec06ExercicioTransporteOnibus
GO
CREATE TABLE motorista (
	codigo INT NOT NULL,
	nome VARCHAR(20) NOT NULL,
	dataNascimento DATE,
	naturalidade VARCHAR(20)
	PRIMARY KEY(codigo)
)
GO
CREATE TABLE onibus (
	placa VARCHAR(10) NOT NULL,
	marca VARCHAR(20) NOT NULL,
	ano INT NOT NULL,
	descricao VARCHAR(20)
	PRIMARY KEY(placa)
)
GO
CREATE TABLE viagem (
	codigo INT NOT NULL,
	onibus VARCHAR(10) NOT NULL,
	motorista INT NOT NULL,
	horaSaida DATETIME,
	horaChegada DATETIME,
	destino VARCHAR(20) NOT NULL
	PRIMARY KEY(codigo, onibus, motorista),
	FOREIGN KEY(onibus) REFERENCES onibus(placa),
	FOREIGN KEY(motorista) REFERENCES motorista(codigo)	
)

-----------------------------------------------------------------------------------------------------------------------------------
-- INSERINDO DADOS
INSERT INTO motorista (codigo, nome, dataNascimento, naturalidade) VALUES
	(12341,	'Julio Cesar', '1978-04-18', 'São Paulo'),
	(12342, 'Mario Carmo', '2002-07-29', 'Americana'),
	(12343,	'Lucio Castro', '1969-12-01', 'Campinas'),
	(12344,	'André Figueiredo', '1999-05-14', 'São Paulo'),
	(12345,	'Luiz Carlos', '2001-01-09', 'São Paulo')

INSERT INTO onibus (placa, marca, ano, descricao) VALUES
	('adf0965', 'Mercedes', 1999, 'Leito'),
	('bhg7654', 'Mercedes', 2002, 'Sem Banheiro'),        
	('dtr2093', 'Mercedes', 2001, 'Ar Condicionado'),     
	('gui7625', 'Volvo', 2001, 'Ar Condicionado') 

INSERT INTO viagem (codigo, onibus, motorista, horaSaida, horaChegada, destino) VALUES
	(101, 'adf0965', 12343,	'10:00', '12:00', 'Campinas'),
	(102, 'gui7625', 12341,	'07:00', '12:00', 'Araraquara'),
	(103, 'bhg7654', 12345,	'14:00', '22:00', 'Rio de Janeiro'),
	(104, 'dtr2093', 12344,	'18:00', '21:00', 'Sorocaba')


-----------------------------------------------------------------------------------------------------------------------------------
-- CONSULTANDO DADOS
									
-- Consultar, da tabela viagem, todas as horas de chegada e saída, convertidas em formato HH:mm (108) e seus destinos											
SELECT
	viagem.destino,
	CONVERT(VARCHAR, viagem.horaSaida, 108) AS saida,
	FORMAT(viagem.horaChegada, 'HH:mm ss') as chegada
FROM 
	viagem


-- Consultar, com subquery, o nome do motorista que viaja para Sorocaba
SELECT
	nome
FROM
	(SELECT 
		nome
	FROM
		motorista INNER JOIN viagem ON viagem.motorista = motorista.codigo
	WHERE
		viagem.destino = 'Sorocaba'
) AS consultaMotorista

									
-- Consultar, com subquery, a descrição do ônibus que vai para o Rio de Janeiro											
SELECT 
	descricao
FROM 
	(
	SELECT 
		descricao
	FROM 
		onibus INNER JOIN viagem ON viagem.onibus = onibus.placa
	WHERE
		viagem.destino = 'Rio de Janeiro'
) AS consultaDescricao

-- Consultar, com Subquery, a descrição, a marca e o ano do ônibus dirigido por Luiz Carlos											
SELECT
	descricao,
	marca,
	ano
FROM (
	SELECT
		descricao,
		marca,
		ano
	FROM
		onibus 
			INNER JOIN viagem ON onibus.placa = viagem.onibus
			INNER JOIN motorista ON motorista.codigo = viagem.motorista
	WHERE
		motorista.nome = 'Luiz Carlos'
) AS consultaPorMotorista



-- Consultar o nome, a idade e a naturalidade dos motoristas com mais de 30 anos											
SELECT
	nome,
	idade,
	naturalidade
FROM (
	SELECT
		nome,
		DATEDIFF(YEAR, motorista.dataNascimento, GETDATE()) AS idade,
		naturalidade
	FROM
		motorista
) AS consultaPorIdade
WHERE
	idade > 30













