-- CRIANDO DATABASE
CREATE DATABASE empresa_projetos02
GO
USE empresa_projetos02
GO
CREATE TABLE projeto (
id INT NOT NULL IDENTITY(10001, 1),
nome VARCHAR(45) NOT NULL,
descricao VARCHAR(45) NOT NULL,
dataProjeto DATE
PRIMARY KEY(id)
CONSTRAINT chk_data CHECK(dataProjeto > '01/09/2014')
)
GO
CREATE TABLE usuario (
id INT NOT NULL IDENTITY(1,1),
nome VARCHAR(45) NOT NULL,
nomeUsuario VARCHAR(45) NOT NULL UNIQUE,
senha VARCHAR(45) NOT NULL DEFAULT '123mudar',
email VARCHAR(45) NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE usuarioProjeto (
usuarioId INT NOT NULL,
projetoId INT NOT NULL
PRIMARY KEY (usuarioId, projetoId)
FOREIGN KEY (usuarioId) REFERENCES usuario(id),
FOREIGN KEY (projetoId) REFERENCES projeto(id)
)


-- ALTERANDO OS DADOS
ALTER TABLE usuario
DROP CONSTRAINT UQ__usuario__8C9D1DE5044858E1

ALTER TABLE usuario
ALTER COLUMN nomeUsuario VARCHAR(10) NOT NULL 

ALTER TABLE usuario
ADD CONSTRAINT chk_usrUnico UNIQUE(nomeUsuario)


ALTER TABLE usuario
ALTER COLUMN senha VARCHAR(8) NOT NULL


-- INSERINDO OS DADOS
INSERT INTO usuario (nome, nomeUsuario, senha, email) VALUES  
('Maria', 'Rh_maria', DEFAULT, 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', DEFAULT, 'ana@empresa.com'),
('Clara', 'Ti_clara', DEFAULT, 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com') 
GO
INSERT INTO projeto (nome, descricao, dataProjeto) VALUES
('Re-folha', 'Refatoração das Folhas', '05/09/2014'),
('Manutenção PCs', 'Manutenção PCs', '06/09/2024'),
('Auditoria', '', '2024/09/07') 
GO


-- ALTERANDO OS DADOS
UPDATE projeto
SET dataProjeto = '2024/09/12'
WHERE id = 10003
GO 
UPDATE usuario
SET nomeUsuario = 'Rh_cido'
WHERE id = 5 AND nome = 'Aparecido'
GO
UPDATE usuario
SET senha = '888@*'
WHERE nomeUsuario = 'Rh_maria' and email = 'maria@empresa.com'
GO
DELETE usuarioProjeto
WHERE usuarioId	= 2 AND projetoId = 10002


-- EXERCICIOS
-- A) Adicionar | User (6; Joao; Ti_joao; 123mudar; joao@empresa.com)
INSERT INTO usuario (nome, nomeUsuario, senha, email) VALUES
('Joao', 'Ti_joao', DEFAULT, 'joao@empresa.com')
-- B) Adicionar | Project  (10004; Atualização de Sistemas; Modificação de Sistemas Operacionais nos PC's; 12/09/2014)
INSERT INTO projeto (nome, descricao, dataProjeto) VALUES
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PCs', '12/09/2014')
-- C) Consultar | 1) Id, Name e Email de Users, Id, Name, Description e Data de Projects, dos usuários que participaram do projeto Name Re-folha



