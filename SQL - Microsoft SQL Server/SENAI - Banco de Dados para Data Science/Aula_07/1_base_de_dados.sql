DROP DATABASE e_commerce;
CREATE DATABASE e_commerce;
use e_commerce;

CREATE TABLE usuario(
id_usuario SMALLINT IDENTITY PRIMARY KEY,
nome varchar(150) NOT NULL,
nomeSocial VARCHAR (150) NULL,
genero VARCHAR (10) NOT NULL,
dataNascimento DATETIME NOT NULL,
nacionalidade VARCHAR(50),
documento VARCHAR(18),
tipoDocumento VARCHAR(20) NOT NULL
);

CREATE TABLE fornecedor(
id_fornecedor SMALLINT IDENTITY PRIMARY KEY,
nomeFornecedor VARCHAR(150) NOT NULL,
cnpj VARCHAR (18) NOT NULL
);

CREATE TABLE categoria(
id_categoria SMALLINT IDENTITY PRIMARY KEY,
nomeCategoria VARCHAR (50) NOT NULL
);
ALTER TABLE categoria 
ADD descricao VARCHAR(255) NOT NULL;

CREATE TABLE contato(
id_contato SMALLINT IDENTITY PRIMARY KEY,
nomeContato VARCHAR(150),
telefone VARCHAR(20),
email VARCHAR(70),
id_usuario SMALLINT,
id_fornecedor SMALLINT,
CONSTRAINT fk_contato_usuario FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario),
CONSTRAINT fk_contato_fornecedor FOREIGN KEY (id_fornecedor)
REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE endereco(
id_endereco SMALLINT IDENTITY PRIMARY KEY,
id_usuario SMALLINT,
id_fornecedor SMALLINT,
logradouro varchar(150) NOT NULL,
numero VARCHAR (5) NOT NULL,
bairro VARCHAR (60) NOT NULL,
cidade VARCHAR (100) NOT NULL,
estado VARCHAR (60) NOT NULL,
uf VARCHAR(2) NOT NULL,
cep VARCHAR (10) NOT NULL,
--DEFININDO AS CHAVES ESTRANGEIRAS
CONSTRAINT fk_endereco_usuario 
FOREIGN KEY (id_usuario) REFERENCES dbo.usuario (id_usuario),
CONSTRAINT fk_endereco_fornecedor 
FOREIGN KEY (id_fornecedor) REFERENCES dbo.fornecedor (id_fornecedor)
);

CREATE TABLE produto(
id_produto SMALLINT IDENTITY PRIMARY KEY,
id_fornecedor SMALLINT,
nomeProduto VARCHAR(60) NOT NULL,
descricao VARCHAR(255) NOT NULL,
custo float(5) NOT NULL,
precoVenda float(5) NOT NULL,
marca VARCHAR(60) NOT NULL,
foto varchar(512),
dimensao VARCHAR(20),
CONSTRAINT fk_produto_fornecedor
FOREIGN KEY(id_fornecedor) REFERENCES dbo.fornecedor(id_fornecedor)
);

CREATE TABLE estoque(
id_estoque SMALLINT IDENTITY PRIMARY KEY,
id_produto SMALLINT,
quantidade SMALLINT,
valorTotal DECIMAL(5,3)
CONSTRAINT fk_estoque_produto
FOREIGN KEY (id_produto) REFERENCES dbo.produto(id_produto)
);
DROP TABLE pedido;
CREATE TABLE pedido(
id_pedido SMALLINT IDENTITY PRIMARY KEY,
id_usuario SMALLINT NOT NULL,
dataVenda DATE,
tipoPagamento VARCHAR(15) NOT NULL,
statusPedido VARCHAR(15) NOT NULL,
CONSTRAINT fk_pedido_usuario
FOREIGN KEY (id_usuario) REFERENCES dbo.usuario(id_usuario)
);


CREATE TABLE itemPedido(
id_item SMALLINT IDENTITY PRIMARY KEY,
id_pedido SMALLINT NOT NULL,
id_produto SMALLINT NOT NULL,
quantidadeVendida SMALLINT NOT NULL,
valor FLOAT(5)NOT NULL,
valorTotal FLOAT(5),
CONSTRAINT fk_itemPedido_pedido
FOREIGN KEY (id_pedido) REFERENCES dbo.pedido(id_pedido),
CONSTRAINT fk_itemPedido_produto
FOREIGN KEY (id_produto) REFERENCES dbo.produto(id_produto)
);

ALTER TABLE dbo.produto ADD id_categoria SMALLINT;
ALTER TABLE usuario
ALTER COLUMN dataNascimento DATE

ALTER TABLE dbo.produto ADD CONSTRAINT fk_produto_categoria 
FOREIGN KEY (id_categoria) REFERENCES dbo.categoria(id_categoria);





