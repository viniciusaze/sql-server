-- VIS�O

-- CRIANDO A VIS�O
CREATE VIEW MEDIA_EMBALAGENS AS 
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS 
GROUP BY EMBALAGEM;

SELECT * FROM MEDIA_EMBALAGENS;

SELECT EMBALAGEM, PRECO_MEDIO
FROM MEDIA_EMBALAGENS
WHERE PRECO_MEDIO <= 10;

-- EXERC�CIO

SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

-- Vamos criar a vis�o com a consulta que retorna as quantidade agregadas.
-- N�o se esque�a de criar um apelido para o agregador SUM(QUANTIDADE).

CREATE VIEW VW_QUANTIDADE_PRODUTOS AS 
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO;

SELECT * FROM VW_QUANTIDADE_PRODUTOS
WHERE QUANTIDADE_TOTAL > 394000 
ORDER BY QUANTIDADE_TOTAL DESC;