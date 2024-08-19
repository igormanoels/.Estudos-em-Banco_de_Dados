use e_commerce;
-- Usando INNER JOIN para duas tabelas

SELECT * FROM usuario INNER JOIN endereco
ON usuario.id_usuario = endereco.id_usuario; -- Reune os dados das tabelas e retorna pro usuário

SELECT usuario.nome, usuario.documento, usuario.tipoDocumento, endereco.logradouro, endereco.numero, endereco.bairro 
FROM usuario INNER JOIN endereco
ON usuario.id_usuario = endereco.id_usuario  -- Reune os dados com apenas as colunas desejadas
-- ORDER BY nome
WHERE usuario.nome LIKE 'C%';



-- DESAFIO: CRIAR UM SELECT QUE RETORNA APENAS O NOME E O GENERO
SELECT usuario.nome, usuario.genero FROM usuario WHERE genero = 'Feminino'
ORDER BY nome;

SELECT usuario.nome, usuario.genero FROM usuario WHERE genero = 'Masculino';

SELECT* from dbo.usuario;



-- DESAFIO: JUNTAR 3 TABELAS DO BANCO DE DADOS (ENDEREÇO, USUÁRIO E CONTATO)
SELECT 
usuario.nome, usuario.genero,
contato.telefone, contato.email,
endereco.numero, endereco.bairro, endereco.cidade
FROM usuario
INNER JOIN endereco 
ON usuario.id_usuario = endereco.id_usuario
INNER JOIN contato 
ON usuario.id_usuario = contato.id_usuario;


