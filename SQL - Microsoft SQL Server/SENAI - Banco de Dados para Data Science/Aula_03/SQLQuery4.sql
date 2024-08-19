USE e_commerce;


CREATE PROCEDURE CriarTabela
AS
BEGIN 
	CREATE TABLE cliete (
		id_cliente SMALLINT IDENTITY PRIMARY KEY,
		nome VARCHAR(150)

	);
END;

EXEC CriarTabela;

-----------------------------------------------------------------------------------------------------------------
SELECT 
usuario.nome, usuario.genero,
contato.telefone, contato.email,
endereco.numero, endereco.bairro, endereco.cidade
FROM usuario
INNER JOIN endereco 
ON usuario.id_usuario = endereco.id_usuario
INNER JOIN contato 
ON usuario.id_usuario = contato.id_usuario;


CREATE INDEX idx_usuario ON usuario(id_usuario); -- Aprimora as buscas dentro do BD
