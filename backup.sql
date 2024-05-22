-- BACKUP

SELECT COUNT(*) FROM tb_nota -- 3003 notas

BACKUP DATABASE dbVendas TO DISK = 'C:\data\backup\DBVENDAS.BAK';

EXEC IncluiNotasDia '2022-03-01'

SELECT COUNT(*) FROM tb_nota -- 3092 notas

BACKUP DATABASE dbVendas TO DISK = 'C:\data\backup\DBVENDAS2.BAK';

EXEC IncluiNotasDia '2022-03-02' -- 3170 notas

BACKUP DATABASE dbVendas TO DISK = 'C:\data\backup\DBVENDAS3.BAK';