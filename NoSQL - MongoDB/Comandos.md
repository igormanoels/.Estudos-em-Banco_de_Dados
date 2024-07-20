# Comandos MongoDB e Suas Funções

## Introdução
MongoDB é um banco de dados NoSQL orientado a documentos. Abaixo está uma tabela com alguns comandos comuns e suas respectivas funções.

## Tabela de Comandos
| Comando                                | Função                                                                                   |
|----------------------------------------|------------------------------------------------------------------------------------------|
| `db.collection.find(query)`            | Encontra documentos na coleção que correspondem ao critério de consulta `query`.          |
| `db.collection.insertOne(document)`    | Insere um único documento na coleção.                                                     |
| `db.collection.insertMany(documents)`  | Insere vários documentos na coleção.                                                     |
| `db.collection.updateOne(filter, update)` | Atualiza um único documento que corresponde ao filtro `filter` com as operações especificadas em `update`. |
| `db.collection.updateMany(filter, update)` | Atualiza múltiplos documentos que correspondem ao filtro `filter` com as operações especificadas em `update`. |
| `db.collection.deleteOne(filter)`      | Remove um único documento que corresponde ao filtro `filter`.                            |
| `db.collection.deleteMany(filter)`     | Remove múltiplos documentos que correspondem ao filtro `filter`.                         |
| `db.collection.findOne(query)`         | Encontra um único documento na coleção que corresponde ao critério de consulta `query`.  |
| `db.collection.createIndex(keys, options)` | Cria um índice na coleção com base nos campos especificados em `keys` e nas `options`.   |
| `db.collection.aggregate(pipeline)`    | Executa operações de agregação, como filtros, agrupamentos e transformações, conforme definido no `pipeline`. |
| `db.collection.countDocuments(query)`  | Retorna a contagem de documentos que correspondem ao critério de consulta `query`.       |

## Exemplos de Uso
### 1. Encontrar todos os documentos na coleção `clients`
db.clients.find({})


### 2. Inserir um novo documento na coleção clients
db.clients.insertOne({
    nome: 'Igor',
    age: 28,
    hobbies: ['viajar', 'comer']
})

### 3. Inserir múltiplos documentos na coleção clients
db.clients.insertMany([
    { nome: 'Igor', age: 28, hobbies: ['viajar', 'comer'] },
    { nome: 'Ana', age: 25, hobbies: ['ler', 'escrever'] }
])

### 4. Atualizar a propriedade nome de um único documento
db.clients.updateOne(
    { nome: 'Igor' },
    { $set: { nome: 'Manoel' } }
)


### 5. Atualizar a propriedade hobbies de múltiplos documentos
db.clients.updateMany(
    { nome: 'Igor' },
    { $set: { hobbies: ['viajar', 'comer', 'correr'] } }
)

### 6. Remover um único documento da coleção clients
db.clients.deleteOne({ nome: 'Igor' })


### 7. Remover múltiplos documentos da coleção clients
db.clients.deleteMany({ age: { $lt: 30 } })


### 8. Encontrar um único documento na coleção clients
db.clients.findOne({ nome: 'Igor' })


### 9. Criar um índice na coleção clients com base no campo nome
db.clients.createIndex({ nome: 1 })


### 10. Executar uma operação de agregação na coleção clients
db.clients.aggregate([
    { $match: { age: { $gt: 25 } } },
    { $group: { _id: "$nome", total: { $sum: 1 } } }
])


### 11. Contar documentos na coleção clients com base em um critério de consulta
db.clients.countDocuments({ age: { $gt: 25 } })


