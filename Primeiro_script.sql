--- CRIANDO MEU PRIMEIRO BANCO DE DADOS
/*
COMENTÁRIO
COM
VÁRIAS 
LINHAS
*/

CREATE DATABASE DB_16_CADASTRO;
USE DB_16_CADASTRO;

-- CRIANDO TABELA PESSOAS

CREATE TABLE TB_PESSOAS(
	Id_Pessoas INT IDENTITY (1,1) PRIMARY KEY,
	Nome varchar(50) not null, 
	Idade varchar(3) not null,
	Uf char(2) not null
);


---- Inserindo dados na tabela
insert into TB_PESSOAS (Nome, Idade, Uf) values ('Gabriel', 23, 'DF') insert into TB_PESSOAS (nome,Idade,Uf)  values ('Caio',18,'SP') insert into TB_PESSOAS(Nome,Idade, Uf) values ('Cindy',23,'AL') insert into TB_PESSOAS(Nome,Idade, Uf) values ('Rodrigo',18,'SP') insert into TB_PESSOAS(Nome,Idade, Uf) values ('Andressa',29,'BH')

--- Rodage da tabela com dados inseridos
select * from TB_PESSOAS

--- Alterar dados da tabela
Alter table TB_PESSOAS add Cidade varchar(30);

---- Excluir coluna inserida
Alter table TB_PESSOAS drop column Cidade