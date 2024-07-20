-- CRIANDO TABELAS
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail do usuário',
    endereco VARCHAR(50) NOT NULL COMMENT 'Endereço do usuário',
    dataNascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário'
);

CREATE TABLE destinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do destino'
);

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único da reserva',
    id_usuario INT NOT NULL COMMENT 'Referência ao id do usuário que faz a reserva',
    id_destino INT NOT NULL COMMENT 'Referência ao id do destino da reserva',
    data DATE COMMENT 'Data da reserva',
    status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada)',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_destino) REFERENCES destinos(id)
);

-- INSERINDO DADOS
INSERT INTO usuarios (id, nome, email, data_Nascimento, endereco) 
    VALUES (1,"Igor","teste@gmail.com","1994-11-02","Rua vai não vai, 45");

INSERT INTO destinos (id, nome, descricao) 
    VALUES (1, "Praia", "Farol do norte");

INSERT INTO reservas (id, id_usuario, id_destino, status, data) 
	VALUES (1, 1, 1, "Pendente", "2023-11-11");


-- SELECIONANDO DADOS
SELECT * FROM usuarios; -- seleciona todos os dados

SELECT * FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario
INNER JOIN destinos ds ON rs.id_destino = ds.id; -- seleciona dados comparando as tabelas

SELECT * FROM usuarios us
LEFT JOIN reservas rs ON us.id = rs.id_usuario; -- retorna como null os campos da esquerda quando a tabela apontada não tem referencia na outra

SELECT * FROM reservas rs
RIGHT JOIN destinos ds ON rs id.destino = ds id; -- retorna como null os campos da direita quando a tabela apontada não tem referencia na outra

-- ATENTAR-SE AO USO DA CRASE AO INDICAR A TABELA, TAMBÉM FUNCIONA SEM ELA
SELECT * FROM `usuarios`
WHERE id = 1 AND nome LIKE "%Igor%";

SELECT nome, (SELECT COUNT(*) FROM reservas 
WHERE id_usuario * usuarios.id) AS total_reservas FROM usuarios; -- retorna a quantidade de reservas por usuário

SELECT COUNT(*) AS total_usuarios FROM usuarios; -- Conta os usuários

-- ATUALIZAR DADOS
UPDATE usuarios
SET nome = "Igor Manoel de Santana"
WHERE id = 1; -- altera os dados de um usuário

ALTER TABLE usuarios RENAME clientes; -- altera o nome da tabela

ALTER TABLE usuarios MODIFY COLUMN endereco VARCHAR(150); -- altera o tamanho dos dados armazenados em uma coluna

ALTER TABLE usuarios MODIFY COLUMN id INT AUTO_INCREMENT, ADD PRIMARY KEY (id); -- altera o tipo de dado, e faz uma segunda ação, alterando para PK

-- adiciona colunas em uma tabela
ALTER TABLE usuarios ADD rua VARCHAR (100), ADD numero VARCHAR (10), ADD cidade VARCHAR (20), ADD estado VARCHAR (20), ADD pais VARCHAR (20); 


-- APAGAR DADOS
DELETE FROM usuarios
WHERE nome = "Igor Manoel de Santana"; -- apaga uma linha/ informação

DROP TABLE usuarios; -- apaga uma tabela

ALTER TABLE usuarios DROP COLUMN endereco; -- apaga a coluna de uma tabela 


