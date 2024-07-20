-- Cria um usuário
SET user1:nome "Igor"


-- Retorna valor da chave
GET user1:nome 


-- Registra dados como JSON
SET user '{'nome': 'Manoel', 'idade': 29}'


-- Cria um registro em um determinado periodo de tempo
SET user2:nome "Sandro" EX 10 -- 10 em segundos


-- Retorna os valores existentes das chaves
EXISTS user2:nome 


-- inseri um dado com chava na lista
LPUSH user1:linguagens 'Java'
LPUSH user1:linguagens 'Python' -- Intere um novo dados na chave existente
LPUSH user1:linguagens 'C#'


-- localiza os dados pelo indice da lista
LINDEX user1:linguagens 2 -- retorna "C#"


-- Retorna todos os dados da lista
LRANGE user1:linguagens 0 2 


-- Retorna o tipo de dado
TYP Euser1:nome

-- Retorna o tempo o de expiração em segund, se for permanente, o retorno será -1
TTL user1:linguagens


-- Retorna o tempo de expiração em milisegundos, se for permanente, o retorno será -1
TTL user1:linguagens


-- Remove o tempo de expiração, e torna em permanente
PERSIST user1:linguagens 


-- Remove o registro do banco
DELL user1:linguagens 