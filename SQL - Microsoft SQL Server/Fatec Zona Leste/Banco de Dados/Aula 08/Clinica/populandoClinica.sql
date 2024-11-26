USE clinica
GO
INSERT INTO paciente (numBeneficiario, nome, logradouro, numero, cep, complemento, telefone) VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Volunt�rio da P�tria', 2251, '03254010', 'Bloco B. Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 12081', '912348765'),
(99904, 'Jos� Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674321'),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')
GO
INSERT INTO especialidade(id, especialidade) VALUES
(1, 'Otorriniolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')
GO
INSERT INTO medico (codigo, nome, logradouro, numero, cep, complemento, contato, especialidadeId) VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)
GO
INSERT INTO consulta(pacienteNumBeneficiario, medicoCodigo, dataHora, observacao) VALUES
(99901, 100002, '2021-09-04 13:20', 'Infec��o Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:40', 'Infec��o Garganta')

EXEC sp_help consulta

