 --- criar data base
 create database db_16_vendas;

 --- Usar banco
 use db_16_vendas

 -- Criar tabela
 create table tb_clientes(Id_cliente int identity (1,1) primary key, nome varchar (50) not null, cidade varchar (255));

 --- Criar segunda tabela
 create table tb_pedidos(id_pedido int identity (1,1) primary key, descricao varchar(255) not null, valor money not null, fk_cliente int, foreign key (fk_cliente) references tb_clientes(id_cliente) );

 --- inserindo dados na tabela
 insert into tb_clientes values ('Caio', 'S�o Paulo'), ('Arnaldo', 'Tabo�o'), ('Andressa', 'Bahia'), ('Rodrigo', 'Guarulhos'), ('Gabriel', 'Bras�lia')

 --- inserindo Pedidos 
 insert into tb_pedidos values ('Camisa Preta',120,1),('Jaqueta Cinza',250,1),('Cal�a Jeans',300,2),('Meias do Mickey',10,3) 

 --- Executar view
 Select * from tb_clientes
 Select * from tb_pedidos