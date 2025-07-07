-- INSERIR VALORES NAS TABELAS
INSERT INTO tb_endereco(pais, uf, cidade, bairro, rua, numero) VALUES 
('Brasil','SP', 'Osasco', 'Centro', 'Camélias',100),
('Brasil','DF', 'Brasília', 'Asa Sul', 'SCS',40);

INSERT INTO tb_regional(nomeregional, enderecoregional, telefoneregional) VALUES
('Sudeste', 'AV Paulista 123', '11956568749'),
('Centro-Oeste', 'Setor Comercial Sul', '6182279022');

INSERT INTO tb_cliente(idendereco,idregional,nome,email,cpf) VALUES
(1,1,'Vilma','Vilma@yahoo.com','12345678911'),
(2,2,'Marco','marco@gmail.com','12352789011');

INSERT INTO tb_vendedores(idendereco,idregional,nome,email,cpf) VALUES
(1,2,'Jose','jose@yahoo.com','12355578911'),
(1,2,'Maria','maria@gmail.com','88852789011');

INSERT INTO tb_produtos(nome,linha,valorunitario) VALUES
('BIKE 01','MTB',6000.90),
('BIKE 02','SPEED',2500.20),
('BIKE 03','SPEED',2400.70);

INSERT INTO tb_pedidos(idcliente,idvendedor,datapedido,qtitens,valortotal) VALUES
(1,1,'2025-07-02',2,5000),
(2,2,'2025-07-15',1,2400.70),
(2,1,'2025-07-10',2,12001.8);

INSERT INTO tb_itens_pedidos(idpedido,idproduto,quantidade,precounitario,desconto) VALUES
(1,1,1,3000.00,0.00),
(2,2,1,4000.00,0.00),
(2,1,2,6000.00,0.00);