-- PRATICANDO

--O objetivo, agora, � montar um relat�rio mostrando o nome dos clientes, 
--com seus respectivos CPFs e o valor total, em volume financeiro, 
--das compras desses clientes em um determinado m�s.

--Poder�amos obter o resultado desse exerc�cio pr�tico por meio de um �nico SELECT com JOIN. 
--Mas, queremos realizar isso usando o T-SQL, jogando o resultado desses dados numa 
--tabela tempor�ria.

SELECT * FROM [TABELA DE CLIENTES];
SELECT COUNT(*) FROM [TABELA DE CLIENTES];

SELECT X.CPF, X.NOME
FROM (
SELECT Row_Number() Over (Order By CPF) as RowNuM * FROM [TABELA DE CLIENTES]) X
WHERE X.RowNum = 3

DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;

SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;

WHILE @I <= @NUMERO_CLIENTES
BEGIN
        SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * FROM [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;
        PRINT @CPF + ' - ' + @NOME;
        SET @I = @I + 1;
END;

-- EXERC�CIO

--DECLARE @CODIGO VARCHAR(10);
--DECLARE @NOME VARCHAR(50);
--DECLARE @NUMERO_PRODUTOS INT;
--DECLARE @I INT;

--SELECT @NUMERO_PRODUTOS = COUNT(*) FROM [TABELA DE PRODUTOS];
--SET @I = 1;
--WHILE @I <= @NUMERO_PRODUTOS
--BEGIN
--   SELECT @CODIGO = X.[CODIGO DO PRODUTO], @NOME = X.[NOME DO PRODUTO]
--   FROM ( SELECT Row_Number() Over (Order By [CODIGO DO PRODUTO]) as RowNum, * from [TABELA DE PRODUTOS]) X
--   WHERE X.RowNum = @I;
--   PRINT 'Vendas para ' + @CODIGO + ' - ' + @NOME ;
--   SET @I = @I + 1;
--END;



-- Consulta do valor total de vendas por CPF e data
DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;

SET @MES = 1;
SET @ANO = 2015;
SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;
WHILE @I <= @NUMERO_CLIENTES
BEGIN
        SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * FROM [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;

                SELECT 
                @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PRE�O])
                FROM [NOTAS FISCAIS] 
                INNER JOIN [ITENS NOTAS FISCAIS]
                ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
                WHERE [NOTAS FISCAIS].CPF = @CPF
                AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

        PRINT 'Vendas para ' + @CPF + ' - ' + @NOME + ' NO M�S ' + CONVERT(VARCHAR(2), @MES) + ' E ANO ' + CONVERT(VARCHAR(4),@ANO) + ' FOI DE ' + CONVERT(VARCHAR(20), @TOTAL_VENDAS);
        SET @I = @I + 1;
END;