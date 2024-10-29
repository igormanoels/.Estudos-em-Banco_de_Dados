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



