-- ALTERANDO DADOS

SELECT * FROM PRODUTOS;

-- ALTERANDO PRE�O DE UM PRODUTO
UPDATE PRODUTOS
SET PRECO_LISTA = 5
WHERE CODIGO = '1040107';

-- ALTERANDO PRE�O DE VARIOS PRODUTOS (Aumento de 10%)
UPDATE PRODUTOS
SET PRECO_LISTA = PRECO_LISTA * 1.10
WHERE SABOR = 'Manga';

SELECT * FROM PRODUTOS
WHERE SABOR = 'Manga';

-- ALTERANDO O TAMANHO - DESCRITOR E TAMANHO
SELECT DESCRITOR, REPLACE(DESCRITOR, '350 ml', '550 ml') FROM PRODUTOS
WHERE TAMANHO = '350 ml';

UPDATE PRODUTOS
SET DESCRITOR = REPLACE(DESCRITOR, '350 ml', '550 ml'), TAMANHO = '550 ml'
WHERE TAMANHO = '350 ml';

SELECT DESCRITOR, TAMANHO FROM PRODUTOS
WHERE TAMANHO = '550 ml';

-- EXERC�CIO

SELECT * FROM CLIENTES
WHERE CPF = '19290992743'

UPDATE CLIENTES
SET ENDERECO = 'R. Jorge Emilio 23',
BAIRRO = 'Santo Amaro',
CIDADE = 'S�o Paulo',
ESTADO = 'SP',
CEP = '88332233'
WHERE CPF = '19290992743';

-- EXERC�CIO

UPDATE CLIENTES
SET VOLUME_COMPRA = VOLUME_COMPRA * 1.20
WHERE ESTADO = 'RJ';
