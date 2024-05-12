-- DESAFIOS FINAIS 2

-- Vamos para outro problema, o meu usu�rio me pediu um outro relat�rio, 
-- que ele quer ver as vendas anuais, ou seja, as vendas dentro do ano, 
-- dos meus sucos de frutas por sabor.

-- Mas n�o � s� isso que ele quer n�o, ele quer que eu apresente esse relat�rio ordenado, 
-- do que mais vendeu para o que menos vendeu. Ent�o vamos fazer esse relat�rio aqui 
-- que ele est� me pedindo.

SELECT
TP.SABOR,
SUM(INF.QUANTIDADE) AS VENDA_ANO,
YEAR(NF.DATA_VENDA) AS ANO
FROM TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF
ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = '2015'
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;

-- Eu entreguei isso para o meu cliente, s� que ele falou: 
-- "gostei, mas eu queria uma coisa mais rebuscada, eu quero colocar ter um percentual da participa��o 
-- desta venda em rela��o � venda total do ano".

-- Ent�o por exemplo, se eu vender 1 milh�o de litros e se laranja vender 100 mil, 
-- laranja representou 10% das vendas do ano.

-- Ent�o o relat�rio voltou para mim, porque tenho que colocar agora um percentual, 
-- como � que eu vou colocar e calcular esse percentual? Vamos fazer o seguinte: 
-- primeiro vamos nos preocupar em calcular esse total, eu vou agora fazer uma segunda query, 
-- onde eu vou calcular o total do ano

SELECT
YEAR(NF.DATA_VENDA) AS ANO,
SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = '2015'
GROUP BY YEAR(NF.DATA_VENDA)

-- FAZENDO O JOIN PARA OBTER O PERCENTUAL

SELECT
VS.SABOR,
VS.ANO,
VS.VENDA_ANO,
ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100,2) AS PERCENTUAL
FROM 
(
SELECT
TP.SABOR,
SUM(INF.QUANTIDADE) AS VENDA_ANO,
YEAR(NF.DATA_VENDA) AS ANO
FROM TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF
ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = '2015'
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
-- n�o pode usar order by dentro de subquery
) AS VS
INNER JOIN
(
SELECT
YEAR(NF.DATA_VENDA) AS ANO,
SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = '2015'
GROUP BY YEAR(NF.DATA_VENDA)
) VA
ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC;