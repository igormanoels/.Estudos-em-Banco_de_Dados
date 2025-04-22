
Chegou a hora de aplicar o modelo lógico aprendido em aula ao cenário de Gestão de Projetos e Tarefas. 
Você irá reestruturar os dados de uma única aba, separando-os em múltiplas abas para diferentes entidades, seguindo o modelo lógico estabelecido. 
Isso permitirá que você pratique a aplicação de conceitos em um contexto específico, reforçando seu entendimento e preparação para situações reais.

**Dados Iniciais:**
- A tabela inicial contém todas as informações em uma única aba chamada "Dados Iniciais".


|id_projeto | nome_projeto  | data_inicio | id_tarefa | descricao_tarefa    | data_entrega|
|---------|-------------|--------------|-------------|-----------------|------------------|
|1          | Projeto Alpha | 2023-01-01  | 1         | Tarefa 1 do Alpha   | 2023-01-15|
|1          | Projeto Alpha | 2023-01-01  | 2         | Tarefa 2 do Alpha   | 2023-01-20|
|2          | Projeto Beta  | 2023-02-01  | 3         | Tarefa 1 do Beta    | 2023-02-15|
|2          | Projeto Beta  | 2023-02-01  | 4         | Tarefa 2 do Beta    | 2023-02-20|



**Entidades e Atributos:**
Projetos: id_projeto (PK), nome_projeto, data_inicio
Tarefas: id_tarefa (PK), id_projeto (FK), descricao_tarefa, data_entrega

**Suas Tarefas:**
1. Criação de abas Projetos e Tarefas na planilha.
2. Preenchimento das abas com os dados extraídos da aba inicial "Dados Iniciais".
3. Verificação da correspondência entre id_projeto na aba Tarefas e id_projeto na aba Projetos.



