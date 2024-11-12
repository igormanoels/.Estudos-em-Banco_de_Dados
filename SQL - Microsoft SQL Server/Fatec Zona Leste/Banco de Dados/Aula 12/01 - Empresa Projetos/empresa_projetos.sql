USE empresa_projetos02

-- A) User (6; Joao; Ti_joao; 123mudar; joao@empresa.com)
INSERT INTO usuario (nome, nomeUsuario, senha, email)
VALUES ('Joao', 'Ti_joao', DEFAULT, 'joao@empresa.com') -- usuário já cadastrado


-- B) Project (10004; Atualização de Sistemas; Modificação de Sistemas Operacionais nos PC's; 12/09/2014)
INSERT INTO projeto (nome, descricao, dataProjeto)
VALUES ('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC''s', '2014-09-12')


/* C) Consultar:
1 - Quantos projetos não tem usuários associados a ele. A coluna deve chamar
qty_projects_no_users */
SELECT COUNT(projeto.id) AS qty_projects_no_users
FROM projeto
LEFT JOIN usuarioProjeto ON projeto.id = usuarioProjeto.projetoId
WHERE usuarioProjeto.projetoId IS NULL


/*
2 - Id do projeto, nome do projeto, qty_users_project (quantidade de usuários por
projeto) em ordem alfabética crescente pelo nome do projeto
*/
SELECT projeto.id AS id_do_projeto,
       projeto.nome AS nome_do_projeto,
       COUNT(usuarioProjeto.usuarioId) AS qty_users_project
FROM projeto
LEFT JOIN usuarioProjeto ON projeto.id = usuarioProjeto.projetoId
GROUP BY projeto.id, projeto.nome
ORDER BY projeto.nome ASC


 