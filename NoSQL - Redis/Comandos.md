# Comandos Redis e Suas Funções

## Introdução
Redis é um banco de dados de estrutura de dados em memória, usado como banco de dados, cache e message broker. Abaixo está uma tabela com alguns comandos comuns e suas respectivas funções.

## Tabela de Comandos
| Comando                      | Função                                                                                  |
|------------------------------|-----------------------------------------------------------------------------------------|
| `SET key value`              | Define o valor de uma chave.                                                            |
| `GET key`                    | Obtém o valor de uma chave.                                                             |
| `DEL key`                    | Remove uma chave.                                                                       |
| `EXISTS key`                 | Verifica se uma chave existe.                                                           |
| `INCR key`                   | Incrementa o valor de uma chave numérica.                                               |
| `DECR key`                   | Decrementa o valor de uma chave numérica.                                               |
| `LPUSH key value`            | Insere um valor no início de uma lista.                                                 |
| `RPUSH key value`            | Insere um valor no final de uma lista.                                                  |
| `LPOP key`                   | Remove e retorna o primeiro elemento de uma lista.                                      |
| `RPOP key`                   | Remove e retorna o último elemento de uma lista.                                        |
| `LRANGE key start stop`      | Obtém uma faixa de elementos de uma lista.                                              |
| `SADD key value`             | Adiciona um membro a um conjunto.                                                       |
| `SREM key value`             | Remove um membro de um conjunto.                                                        |
| `SMEMBERS key`               | Obtém todos os membros de um conjunto.                                                  |
| `HSET key field value`       | Define o valor de um campo em um hash.                                                  |
| `HGET key field`             | Obtém o valor de um campo em um hash.                                                   |
| `HDEL key field`             | Remove um campo de um hash.                                                             |
| `HGETALL key`                | Obtém todos os campos e valores de um hash.                                             |
| `KEYS pattern`               | Obtém todas as chaves que correspondem a um padrão.                                     |
| `EXPIRE key seconds`         | Define um tempo de expiração para uma chave.                                            |
| `TTL key`                    | Obtém o tempo de vida restante de uma chave.                                            |
| `FLUSHDB`                    | Remove todas as chaves do banco de dados atual.                                         |
| `FLUSHALL`                   | Remove todas as chaves de todos os bancos de dados.                                     |

## Exemplos de Uso
### 1. Definir e obter o valor de uma chave
SET nome "Igor"
GET nome


### 2. Incrementar e decrementar o valor de uma chave numérica
SET contador 1
INCR contador
DECR contador


### 3. Trabalhar com listas
LPUSH minha_lista "primeiro"
RPUSH minha_lista "ultimo"
LPOP minha_lista
RPOP minha_lista
LRANGE minha_lista 0 -1


### 4. Trabalhar com conjuntos
SADD meu_conjunto "elemento1"
SADD meu_conjunto "elemento2"
SREM meu_conjunto "elemento1"
SMEMBERS meu_conjunto


### 5. Trabalhar com hashes
HSET meu_hash campo1 "valor1"
HGET meu_hash campo1
HDEL meu_hash campo1
HGETALL meu_hash


### 6. Gerenciar chaves
DEL nome
EXISTS nome
EXPIRE nome 60
TTL nome


### 7. Gerenciar banco de dados
FLUSHDB
FLUSHALL


### 8. Obter todas as chaves correspondentes a um padrão
KEYS *
KEYS user:*


Link: 