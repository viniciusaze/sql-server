-- ALTERANDO FUN��ES

-- CONCATENANDO ENDERE�O DO CLIENTE

SELECT * FROM [TABELA DE CLIENTES];

CREATE FUNCTION EnderecoCompleto
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + ' - ' + @BAIRRO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
	RETURN @ENDERECO_COMPLETO
END;

SELECT CPF, dbo.EnderecoCompleto([ENDERECO 1], BAIRRO, CIDADE, ESTADO, CEP) AS ENDERECO_COMPLERO
FROM [TABELA DE CLIENTES];

-- ALTERANDO A FUN��O

ALTER FUNCTION EnderecoCompleto
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + ' ' + @BAIRRO + ' ' + @CIDADE + ' ' + @ESTADO + ', CEP ' + @CEP
	RETURN @ENDERECO_COMPLETO
END;


SELECT CPF, dbo.EnderecoCompleto([ENDERECO 1], BAIRRO, CIDADE, ESTADO, CEP) AS ENDERECO_COMPLERO
FROM [TABELA DE CLIENTES];

-- EXCLUINDO FUN��O

CREATE FUNCTION EnderecoCompleto2
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + ' - ' + @BAIRRO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
	RETURN @ENDERECO_COMPLETO
END;

CREATE FUNCTION EnderecoCompleto3
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + ' - ' + @BAIRRO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
	RETURN @ENDERECO_COMPLETO
END;

DROP FUNCTION [dbo].[EnderecoCompleto3];

IF OBJECT_ID('Enderecocompleto3', 'FN') IS NOT NULL
DROP FUNCTION [dbo].[Enderecoscompleto3]