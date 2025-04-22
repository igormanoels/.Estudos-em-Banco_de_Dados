# ANOTAÇÕES

- MER (Modelo entidade relacionamento) - Uma modelagem conceitual utilizada para representar, de forma abstrata, os objetos de um domínio de negócios, descrevendo suas características (atributos) e os relacionamentos entre eles.
    - Entidades: São objetos ou conceitos do mundo real que possuem dados que precisam ser armazenados. Exemplos de entidades podem ser 'Cliente', 'Pedido', ou 'Produto'.
        - Fortes: Existem por si só
        - Fracas: Dependem das existencias de outras entidades
    - Atributos: São as propriedades ou características de uma entidade. Por exemplo, a entidade 'Cliente' pode ter atributos como 'Nome do Cliente', 'Endereço' e 'Telefone'.
        - Atributos Simples: indivisíveis, representam uma propriedade única (ex: idade, preço).
        - Atributos Compostos: divisíveis em partes menores, cada uma com significado próprio (ex: endereço).
        - Atributos Multivalorados: permitem múltiplos valores para uma entidade (ex: números de telefone).
        - Atributos chave: utilizado para identificar unicamente cada registro em uma entidade.
    - Relacionamentos: Descrevem como as entidades estão conectadas entre si e interagem. Por exemplo, um relacionamento entre 'Cliente' e 'Pedido' pode ser descrito como um cliente que 'realiza' um pedido.

- DER (Diagrama de Entidade e Relacionamento) - É a sua representação gráfica e principal ferramenta. Em situações práticas, o diagrama é tido muitas vezes como sinônimo de modelo, uma vez que sem uma forma de visualizar as informações, o modelo pode ficar abstrato demais para auxiliar no desenvolvimento do sistema.
    - Formas de representar o DER: 
        - Retângulos representam as entidades.
        - Losangos representam os relacionamentos.
        - Oval representa os atributos.
        - Linhas conectam entidades com seus atributos e relacionamentos.
    - Tipos de Cardinalidade
        A cardinalidade é tipicamente expressa em termos das possíveis quantidades de conexões entre entidades e é categorizada principalmente em três tipos:
        - Um-para-Um (1:1):
            - Descrição: Cada instância de uma entidade está associada a no máximo uma instância da outra entidade.
            - Exemplo: Suponha um sistema onde cada Gerente é responsável por um único Departamento e cada Departamento é gerenciado por um único Gerente. Aqui, a relação entre Gerente e Departamento é um-para-um.
        - Um-para-Muitos (1:N):
            - Descrição: Uma instância de uma entidade pode estar associada a várias instâncias de outra entidade, mas uma instância da segunda entidade pode estar associada a no máximo uma instância da primeira entidade.
            - Exemplo: Em um sistema escolar, um Professor pode lecionar várias Turmas, mas cada Turma é lecionada por apenas um Professor. Assim, a relação entre Professor e Turma é um-para-muitos.

        - Muitos-para-Muitos (N:M):
            - Descrição: Instâncias de uma entidade podem estar associadas a várias instâncias da outra entidade e vice-versa.
            - Exemplo: Em uma universidade, um Estudante pode se inscrever em várias Disciplinas e cada Disciplina pode ter vários Estudantes inscritos. Esta é uma relação muitos-para-muitos.
    - Chave Primária (PK)
        A chave primária é um atributo ou um conjunto de atributos que identifica de maneira única cada registro em uma tabela. Ela desempenha um papel crucial na integridade e na eficiência do banco de dados, garantindo que cada registro possa ser referenciado de forma única e sem ambiguidade.
        - Características da Chave Primária:
            - Unicidade: A chave primária deve conter valores únicos. Não pode haver dois registros com o mesmo valor de chave primária.
            - Não Nulo: A chave primária não pode ter valores nulos. Cada registro deve ter um valor definido para a chave primária.
            - Imutabilidade: Uma vez definido, o valor da chave primária não deve ser alterado.
    - Chave Estrangeira (FK)
        A chave estrangeira é um atributo ou um conjunto de atributos em uma tabela que referencia a chave primária de outra tabela. Ela estabelece e reforça o relacionamento entre as tabelas, garantindo a integridade referencial dos dados.
        - Características da Chave Estrangeira:
            - Referência: A chave estrangeira deve corresponder a um valor existente na tabela referenciada (aquela que possui a chave primária).
            - Integridade Referencial: As chaves estrangeiras garantem que os relacionamentos entre tabelas sejam válidos, prevenindo a inserção de valores órfãos que não têm correspondência na tabela referenciada.

- Levantamento de Requisitos - É o processo de identificar e documentar as necessidades e expectativas dos utilizadores ou clientes para um determinado projeto, como um software.
    - Pode ser realizado através de: Entrevistas, Questionários, Observação Direta


- Domínio do Projeto 
    - FlexEmpresta, uma empresa que disponibiliza empréstimos para sua clientela e organiza seus dados em documentos impressos e planilhas.
    
    Essa organização de dados estava sendo muito útil e eficaz para a empresa. Porém, devido ao grande crescimento de clientes, cada vez mais dados são gerados e armazenados nessas planilhas e documentos.
    
    Problemas surgiram devido ao crescimento e à quantidade de dados que aumentou rapidamente, como:
    - dificuldade de localizar informações: ficou mais demorado para identificar onde o dado está armazenado na planilha;
    - dados repetidos; informações aplicadas em diversos lugares diferentes;
    - ausência de padronização: informações armazenadas de formas diferentes.
    
    Um dos maiores problemas que a FlexEmpresta está enfrentando é a necessidade de utilizar novas ferramentas para auxiliar na tomada de decisão e na organização desses dados.
    Por isso, a empresa estou em contanto conosco para que possamos auxiliar na organização de seus dados, utilizando a modelagem de dados.




