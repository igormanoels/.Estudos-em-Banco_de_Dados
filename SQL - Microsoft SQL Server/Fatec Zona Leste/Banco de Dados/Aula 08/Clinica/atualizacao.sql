USE clinica

--  FAZER 01
ALTER TABLE medico ADD dia_atendimento VARCHAR(10)
GO
UPDATE medico SET dia_atendimento = '2ª feira' WHERE codigo = 100001
GO
UPDATE medico SET dia_atendimento = '4ª feira' WHERE codigo = 100002
GO
UPDATE medico SET dia_atendimento = '2ª feira' WHERE codigo = 100003
GO
UPDATE medico SET dia_atendimento = '5ª feira' WHERE codigo = 100004

-- FAZER 02
GO
DELETE FROM especialidade WHERE id = 4;

-- FAZER 03
GO
EXEC sp_rename 'dbo.medico.dia_atendimento', 'dia_semana_atendimento', 'COLUMN'

-- FAZER 04
GO
UPDATE medico 
SET logradouro = 'Av. Bras Leme',
	numero =  876,
	complemento = 'Apto 504',
	cep = '02122000' 
WHERE codigo = 100003

-- FAZER 05
GO
ALTER TABLE consulta
ALTER COLUMN observacao VARCHAR(200)