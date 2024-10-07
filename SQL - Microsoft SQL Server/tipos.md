# TIPOS DE DADOS EM SQL SERVER

| **Tipo de Dado**   | **Implementação**        | **Descrição**                                                                 |
|--------------------|--------------------------|-------------------------------------------------------------------------------|
| **INT**            | `INT`                    | Armazena inteiros de -2.147.483.648 a 2.147.483.647 (4 bytes).                |
| **BIGINT**         | `BIGINT`                 | Armazena inteiros de -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807.  |
| **SMALLINT**       | `SMALLINT`               | Armazena inteiros de -32.768 a 32.767 (2 bytes).                              |
| **TINYINT**        | `TINYINT`                | Armazena inteiros de 0 a 255 (1 byte).                                        |
| **DECIMAL**        | `DECIMAL(p, s)`          | Armazena números decimais com precisão definida, com `p` como precisão total e `s` como escala. |
| **FLOAT**          | `FLOAT`                  | Armazena números em ponto flutuante de precisão variável (4 ou 8 bytes).      |
| **REAL**           | `REAL`                   | Armazena números em ponto flutuante de menor precisão (4 bytes).              |
| **CHAR**           | `CHAR(n)`                | Armazena strings de tamanho fixo até `n` caracteres (até 8.000).              |
| **VARCHAR**        | `VARCHAR(n)`             | Armazena strings de tamanho variável até `n` caracteres (até 8.000).          |
| **VARCHAR(MAX)**   | `VARCHAR(MAX)`           | Armazena strings de até 2 GB de tamanho.                                      |
| **NCHAR**          | `NCHAR(n)`               | Armazena strings Unicode de tamanho fixo até `n` caracteres.                  |
| **NVARCHAR**       | `NVARCHAR(n)`            | Armazena strings Unicode de tamanho variável até `n` caracteres.              |
| **NVARCHAR(MAX)**  | `NVARCHAR(MAX)`          | Armazena strings Unicode de até 2 GB de tamanho.                              |
| **DATE**           | `DATE`                   | Armazena apenas a data no formato `AAAA-MM-DD`.                               |
| **TIME**           | `TIME`                   | Armazena apenas a hora no formato `HH:MM:SS`.                                 |
| **DATETIME**       | `DATETIME`               | Armazena data e hora com precisão de até 3,33 milissegundos.                  |
| **SMALLDATETIME**  | `SMALLDATETIME`          | Armazena data e hora com precisão de um minuto.                               |
| **DATETIME2**      | `DATETIME2`              | Armazena data e hora com precisão de 100 nanossegundos.                       |
| **DATETIMEOFFSET** | `DATETIMEOFFSET`         | Armazena data e hora com informações de fuso horário.                         |
| **BINARY**         | `BINARY(n)`              | Armazena dados binários de tamanho fixo até `n` bytes.                        |
| **VARBINARY**      | `VARBINARY(n)`           | Armazena dados binários de tamanho variável até `n` bytes.                    |
| **VARBINARY(MAX)** | `VARBINARY(MAX)`         | Armazena dados binários de até 2 GB.                                          |
| **BIT**            | `BIT`                    | Armazena valores booleanos (0, 1 ou NULL).                                    |
| **UNIQUEIDENTIFIER**| `UNIQUEIDENTIFIER`      | Armazena identificadores globais exclusivos (GUID).                           |
| **XML**            | `XML`                    | Armazena dados no formato XML.                                                |
| **JSON**           | `NVARCHAR` ou `VARCHAR`  | Armazena dados no formato JSON (sem tipo específico, usando strings).         |
| **CURSOR**         | `CURSOR`                 | Armazena um ponteiro para linhas de um conjunto de resultados.                |
| **TABLE**          | `TABLE`                  | Armazena uma tabela temporária em memória.                                    |
