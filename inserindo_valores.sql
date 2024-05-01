-- INSERINDO VALORES

/* Novo suco:
1040107
Light 350 ml - Melancia
Lata
350 ml
Melancia
R$ 4,56*/


INSERT INTO [TABELA DE PRODUTOS] VALUES (

'1040107',
'Light 350 ml - Melancia',
'Lata',
'350 ml',
'Melancia',
4.56


);


INSERT INTO [TABELA DE PRODUTOS] VALUES
('1037797', 'Clean 2 Litros Laranja', 'PET', '2 Litros', 'Laranja', 16.01),
('1000889', 'Sabor da Montanha 700 ml Uva', 'Garrafa', '700 ml', 'Uva', 6.31),
('1004327', 'Videira do Campo - 1,5 Litros Melancia', 'PET', '1,5 Litros', 'Melancia', 19.51),
('1088126', 'Linha Citrus 1 Litro Limão', 'PET', '1 Litro', 'Limão', 7.00);

/*'00384393431', 'João da Silva', 'Rua Projetada A', 'Número 233', 'Copacabana',
 'Rio de janeiro, 'RJ', '20000000',21/03/1965, 57, 'M', 200000, 3000.30,1 */


INSERT INTO [TABELA DE CLIENTES] VALUES
('00384393431','João da Silva', 'Rua Projetada A', 'Número 233', 'Copacabana', 'RJ', '20000000', '1965-03-21', 57, 'M',
200000, 3000.30, 1),
('00384393555', 'Maria Clara', 'Rua Projetada A', 'Número 233', 'Copacabana', 'RJ', '20000000', '1975-03-21',47, 'F',
200000, 3000.30, 0);

-- EXERCÍCIO INSERINDO VENDEDORES

INSERT INTO [TABELA DE VENDEDORES] VALUES 
('00236', 'Cláudia Morais', 0.08),
('00237', 'Marcela Ferreira', 0.09),
('00238', 'Márcio Almeida', 0.08);

SELECT * FROM [TABELA DE VENDEDORES];
