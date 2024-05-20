-- Criando a base

CREATE DATABASE [dbVendas]
 ON  PRIMARY ( 
 NAME = N'dbVendas', 
 FILENAME = N'C:\data\arquivo_dados\dbVendas.MDF', 
 SIZE = 100MB, 
 MAXSIZE = 200MB, 
 FILEGROWTH = 50MB )
 LOG ON ( 
 NAME = N'dbVendasLOG', 
 FILENAME = N'C:\data\log_transacoes\dbVendasLOG.LDF', 
 SIZE = 100MB, 
 MAXSIZE = 200MB, 
 FILEGROWTH = 50MB );