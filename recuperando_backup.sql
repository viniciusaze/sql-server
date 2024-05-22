-- RECUPERANDO BACKUP

EXEC IncluiNotasDia '2022-03-03'

SELECT COUNT(*) FROM tb_nota -- 3248 notas -> APOS BACKUP -> 3170 notas

RESTORE HEADERONLY FROM DISK = 'C:\data\backup\DBVENDAS3.BAK'; -- PARA SABER O QUE TEM NO BACKUP

USE MASTER -- IR PARA OUTRA BASE

DROP DATABASE dbVendas -- EXCLUIR A BASE

-- EXECUTAR O BACKUP
RESTORE DATABASE dbVendas FROM DISK = 'C:\data\backup\DBVENDAS3.BAK' WITH RECOVERY;