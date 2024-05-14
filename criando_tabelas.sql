-- CRIA��O DAS TABELAS

-- TABELA DE PRODUTOS
CREATE TABLE PRODUTOS
(
CODIGO VARCHAR(10) NOT NULL,
DESCRITOR VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANHO VARCHAR(50) NULL,
EMABALAGEM VARCHAR(50) NULL,
PRECO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);

-- TABELA DE VENDEDORES
CREATE TABLE VENDEDORES
(
MATRICULA VARCHAR(5) NOT NULL,
NOME VARCHAR(100) NULL,
BAIRRO VARCHAR(50) NULL,
COMISSAO FLOAT NULL,
DATA_ADMISSAO DATE NULL,
FERIAS BIT NULL,
PRIMARY KEY (MATRICULA)
);

-- EXERC�CIO - CRIAR A TABELA CLIENTES
CREATE TABLE CLIENTES
(
CPF VARCHAR(11) NOT NULL,
NOME VARCHAR(100) NULL,
ENDERECO VARCHAR(150) NULL,
BAIRRO VARCHAR(50) NULL,
CIDADE VARCHAR(50) NULL,
ESTADO VARCHAR(50) NULL,
CEP VARCHAR(8) NULL,
DATA_NASCIMENTO DATE NULL,
IDADE INTEGER NULL,
GENERO VARCHAR(1) NULL,
LIMITE_CREDITO FLOAT,
VOLUME_COMPRA FLOAT,
PRIMEIRA_COMPRA BIT,
PRIMARY KEY (CPF)
);

-- TABELAS DE MOVIMENTO

-- TABELA DE VENDAS
CREATE TABLE TABELA_DE_VENDAS
(
NUMERO VARCHAR(5) NOT NULL,
DATA_VENDA DATE NULL,
CPF VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPOSTO FLOAT NULL,
PRIMARY KEY (NUMERO)
);

-- CRIANDO AS CHAVES ESTRANGEIRAS
ALTER TABLE TABELA_DE_VENDAS
ADD CONSTRAINT FK_CLIENTES -- CRIANDO A RESTRI��O
FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);

ALTER TABLE TABELA_DE_VENDAS
ADD CONSTRAINT FK_VENDEDORES
FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);

-- EXERCICIO - CRIAR A TABELA DE ITENS VENDIDOS
CREATE TABLE TABELA_DE_ITENS_VENDIDOS
(
NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
QUANTIDADE INTEGER,
PRECO FLOAT,
PRIMARY KEY (NUMERO, CODIGO)
);

ALTER TABLE TABELA_DE_ITENS_VENDIDOS
ADD CONSTRAINT FK_TABELA_DE_VENDAS
FOREIGN KEY (NUMERO) REFERENCES TABELA_DE_VENDAS (NUMERO);

ALTER TABLE TABELA_DE_ITENS_VENDIDOS
ADD CONSTRAINT FK_PRODUTOS
FOREIGN KEY (CODIGO) REFERENCES PRODUTOS (CODIGO);