-- TABELAS TEMPORARIAS

-- # S� VALE PARA A CONEXAO VIGENTE
-- ## VALE PARA TODAS AS CONEXOES
-- @ VALE APENAS PARA O COMANDO T-SQL

-- TABELA TEMPORARIA NAO PODE TER FK

-- USANDO #
CREATE TABLE #TABELA01
(ID VARCHAR(10),
NOME VARCHAR(30));

INSERT INTO #TABELA01 VALUES ('1','JO�O');

SELECT * FROM #TABELA01;

-- USANDO ##
CREATE TABLE ##TABELA01
(ID VARCHAR(10),
NOME VARCHAR(30));

INSERT INTO ##TABELA01 VALUES ('1','JO�O');

SELECT * FROM ##TABELA01;