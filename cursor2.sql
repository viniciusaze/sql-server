-- CURSOR

DECLARE @NOME VARCHAR(200);
DECLARE @ENDERECO VARCHAR(MAX);

DECLARE CURSOR1 CURSOR FOR
SELECT NOME, ([ENDERECO 1] + ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ', CEP: ' + CEP) AS ENDCOMPLETO
FROM [TABELA DE CLIENTES]

OPEN CURSOR1

FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @NOME + ', Endere�o: ' + @ENDERECO
	FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO
END
CLOSE CURSOR1
DEALLOCATE CURSOR1