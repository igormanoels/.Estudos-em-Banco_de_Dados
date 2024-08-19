use e_commerce;

DECLARE @fornecedor VARCHAR(100) = 'Estilo Roupas'; -- declara o valor que a variavel vai armazenar
EXEC DadosFornecedor @NomeFornecedor = @fornecedor; -- executa a Procedure criada


DECLARE @idFornecedor SMALLINT = '6';
EXEC InformacaoFornecedor @id = @idFornecedor;

-- Outra possibilidade
EXEC InformacaoFornecedor @id = '14';


-----------------------------------------------------------------------------------------------------------------
-- DESAFIO DE CRIAR UM PROCEDIMENTO COM 3 TABELAS LIGADAS
EXEC BuscaUsuario @id = '23';