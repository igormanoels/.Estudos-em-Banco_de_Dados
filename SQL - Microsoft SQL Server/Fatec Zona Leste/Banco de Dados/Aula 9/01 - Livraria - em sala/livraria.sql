CREATE DATABASE livraria
GO
USE livraria
GO
CREATE TABLE livro (
codigoLivro INT NOT NULL IDENTITY(100001, 100),
nome VARCHAR(200),
lingua VARCHAR(10) NOT NULL DEFAULT('PT-BR'),
ano INT NOT NULL CHECK(ano >= 1990),
PRIMARY KEY(codigoLivro)
)
GO
CREATE TABLE autor (
idAutor INT NOT NULL IDENTITY(2351, 1),
nome VARCHAR(100) NOT NULL UNIQUE,
dataNascimento DATETIME NOT NULL,
paisNascimento VARCHAR(50) NOT NULL CHECK(paisNascimento IN ('Brasil', 'Estados Unidos', 'Inglaterra', 'Alemanha')),
biografia VARCHAR(255) NOT NULL,
PRIMARY KEY(idAutor)
)
GO
CREATE TABLE edicao (
isbn CHAR(13) NOT NULL CHECK(LEN(isbn) = 13),
preco DECIMAL(4,2) NOT NULL CHECK(preco >= 0),
ano INT NOT NULL CHECK(ano >= 1993),
numeroPaginas INT NOT NULL CHECK(numeroPaginas >= 15),
quantEstoque INT NOT NULL,
PRIMARY KEY(isbn)
)
GO
CREATE TABLE editora (
idEditora INT NOT NULL IDENTITY(491, 16),
nome VARCHAR(70) NOT NULL UNIQUE,
telefone VARCHAR(10) NOT NULL CHECK(LEN(telefone) = 10),
logradouroEndereco VARCHAR(200) NOT NULL,
numeroEndereco INT NOT NULL CHECK(numeroEndereco >= 0),
cepEndereco CHAR(8) NOT NULL CHECK(LEN(cepEndereco) = 8),
complementoEndereco VARCHAR(255),
PRIMARY KEY(idEditora)
)
GO
CREATE TABLE livroAutor (
livroCodigo INT NOT NULL,
autorId INT NOT NULL,
PRIMARY KEY(livroCodigo, autorId),
FOREIGN KEY(livroCodigo) REFERENCES livro(codigoLivro),
FOREIGN KEY(autorId) REFERENCES autor(idAutor)
)
GO
CREATE TABLE editoraEdicaoLivro (
editoraId INT NOT NULL,
edicaoISBN CHAR(13) NOT NULL,
livroCodigo INT NOT NULL,
PRIMARY KEY(editoraId, edicaoISBN, livroCodigo),
FOREIGN KEY(editoraId) REFERENCES editora(idEditora),
FOREIGN KEY(edicaoISBN) REFERENCES edicao(isbn),
FOREIGN KEY(livroCodigo) REFERENCES livro(codigoLivro)
)
