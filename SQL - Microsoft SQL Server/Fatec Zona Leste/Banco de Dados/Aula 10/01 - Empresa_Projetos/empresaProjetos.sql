----------------------------------------------------------------
-- CRIANDO O BANCO DE DADOS
----------------------------------------------------------------
CREATE DATABASE empresa_projetos
GO
USE empresa_projetos
GO
CREATE TABLE projetos (
id INT NOT NULL IDENTITY(10001, 1),
nome VARCHAR(45) NOT NULL,
descricao VARCHAR(45) NOT NULL,
dataProjeto DATE NOT NULL
PRIMARY KEY(id)
CONSTRAINT chk_data CHECK(dataProjeto >= '2024/09/01')
)
GO
CREATE TABLE usuarios (
id INT NOT NULL IDENTITY (1,1),
nome VARCHAR(45) NOT NULL,
username VARCHAR(45) NOT NULL UNIQUE,
passwd VARCHAR(45) NOT NULL DEFAULT '123mudar',
email VARCHAR(45) NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE usuariosProjetos (
usuarioId INT NOT NULL,
projetosId INT NOT NULL
PRIMARY KEY(usuarioId, projetosId)
FOREIGN KEY(usuarioId) REFERENCES usuarios(id),
FOREIGN KEY(projetosId) REFERENCES projetos(id)
)


----------------------------------------------------------------
-- ALTERANDO A TABELA
----------------------------------------------------------------
ALTER TABLE usuarios
DROP CONSTRAINT UQ__usuarios__F3DBC572D51916BE -- Lembrar de pegar a referencia correta da constraint

ALTER TABLE usuarios
ALTER COLUMN username VARCHAR(10) NOT NULL

ALTER TABLE usuarios
ADD CONSTRAINT chk_username UNIQUE (username)

GO
ALTER TABLE usuarios
ALTER COLUMN passwd VARCHAR(8)


----------------------------------------------------------------
-- INSERINDO DADOS
----------------------------------------------------------------
INSERT INTO usuarios (nome, username, passwd, email) VALUES  
('Maria', 'Rh_maria', DEFAULT, 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', DEFAULT, 'ana@empresa.com'),
('Clara', 'Ti_clara', DEFAULT, 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com') 
GO
INSERT INTO projetos (nome, descricao, dataProjeto) VALUES
('Re-folha', 'Refatoração das Folhas', '2024/09/05'),
('Manutenção PCs', 'Manutenção PCs', '2024/09/06'),
('Auditoria', '', '2024/09/07') 
GO
INSERT INTO usuariosProjetos (usuarioId, projetosId) VALUES
(1, 10002),
(5, 10002),
(3, 10004),
(4, 10003),
(2, 10003)
-- precisei ajustar pq a inserção pulou o numero 10001
SELECT * FROM usuarios
SELECT * FROM projetos
SELECT * FROM usuariosProjetos


----------------------------------------------------------------
-- ALTERANDO DADOS
----------------------------------------------------------------
UPDATE projetos
SET dataProjeto = '2024/09/12'
WHERE id = 10003
GO 
UPDATE usuarios
SET username = 'Rh_cido'
WHERE id = 5 AND nome = 'Aparecido'
GO
UPDATE usuarios
SET passwd = '888@*'
WHERE username = 'Rh_maria' and email = 'maria@empresa.com'
GO
DELETE usuariosProjetos
WHERE usuarioId	= 2 AND projetosId = 10003