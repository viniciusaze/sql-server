-- CRIANDO AS TABELAS DO BANCO

/*Colunas:
CPF;
Nome completo;
Endere�o completo;
Data de nascimento;
Idade;
Sexo;
Limite de cr�dito;
Volume m�nimo de compra de produto;
Se j� realizou alguma compra na empresa.*/

CREATE TABLE [TABELA DE CLIENTES](

CPF CHAR (11),
NOME VARCHAR (50),
RUA VARCHAR (50),
COMPLEMENTO VARCHAR (50),
BAIRRO VARCHAR (50),
ESTADO CHAR (2),
CEP CHAR (8),
[DATA DE NASCIMENTO] DATE,
IDADE SMALLINT,
SEXO CHAR (1),
[LIMITE DE CREDITO] MONEY,
[VOLUME MINIMO] FLOAT,
[PRIMEIRA COMPRA] BIT -- Valor booleano


);

/*Colunas:
c�digo do produto;
nome do produto;
embalagem;
tamanho;
sabor;
pre�o de lista.
*/

CREATE TABLE [TABELA DE PRODUTOS](

[CODIGO DO PRODUTO] VARCHAR (20) NOT NULL PRIMARY KEY,
[NOME DO PRODUTO] VARCHAR (50),
EMBALAGEM VARCHAR (20),
TAMANHO VARCHAR (20),
SABOR VARCHAR (20),
[PRECO DE LISTA] SMALLMONEY

);