USE e_commerce;

-- cria um procedimento para realizar a busca que será realizada constantemente
CREATE PROCEDURE DadosFornecedor
	@NomeFornecedor VARCHAR(100)
AS 
BEGIN
	SELECT DISTINCT fornecedor.cnpj, fornecedor.nomeFornecedor, produto.marca, produto.custo
	FROM fornecedor INNER JOIN produto
	ON fornecedor.id_fornecedor = produto.id_fornecedor
	WHERE fornecedor.nomeFornecedor = @NomeFornecedor -- diz que o nome do fornecedor recebe o valor de entrada da 
	END; -- Sempre que se cria um procedimento é necessário encerrar o procedimento


-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InformacaoFornecedor
	@id SMALLINT
AS
BEGIN
	SELECT DISTINCT fornecedor.cnpj, fornecedor.nomeFornecedor, produto.marca, produto.custo
	FROM fornecedor INNER JOIN produto
	ON fornecedor.id_fornecedor = produto.id_fornecedor
	WHERE fornecedor.id_fornecedor = @id -- Realizando a pesquisa pelo ID do fornecedor
	END;


-----------------------------------------------------------------------------------------------------------------
-- DESAFIO DE CRIAR UM PROCEDIMENTO COM 3 TABELAS LIGADAS
CREATE PROCEDURE BuscaUsuario
	@id SMALLINT
AS
BEGIN
	SELECT DISTINCT usuario.nome, endereco.logradouro, endereco.numero, contato.telefone, contato.email
	FROM usuario INNER JOIN endereco
	ON usuario.id_usuario = endereco.id_usuario
	INNER JOIN contato
	ON usuario.id_usuario = contato.id_usuario
	WHERE usuario.id_usuario = @id
	END;


-----------------------------------------------------------------------------------------------------------------


