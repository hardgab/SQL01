
--- CRIAR Uma coluna estoque na tb_produtos
ALTER TABLE tb_produtos
ADD Estoque INT DEFAULT 0;

-- Consulta de como ficou a tabela
SELECT * FROM tb_produtos;

-- Atualiza os valores da tabela de produtos
UPDATE tb_produtos SET Estoque = 15 WHERE nome = 'BIKE 01';
UPDATE tb_produtos SET Estoque = 8 WHERE nome = 'BIKE 02';

--- INCLUSÃO DA COLUNA DE VALOR TOTAL DO ESTOQUE (MULTIPLICAÇÃO)
SELECT nome, valorunitario, estoque, (valorunitario * estoque) AS ValorTotalEstoque
FROM tb_produtos

--- inserir um novo produto
SELECT * FROM tb_produtos;

---- INSERINDO NOVOS VALORES NA TABELA
INSERT INTO tb_produtos (nome, linha, valorunitario) VALUES
('BIKE 04', 'MTB', 7000.00);

--- INCLUINDO ESTOQUE NOS VALORES NULOS
UPDATE tb_produtos SET Estoque = 5 WHERE nome = 'BIKE 04';
UPDATE tb_produtos SET Estoque = 4 WHERE nome = 'BIKE 03';

-- LINHA ADICIONAL PARA TESTAR  INSTRUÇÃO SEGUINTE
INSERT INTO tb_produtos (nome, linha, valorunitario) VALUES
('BIKE 05', 'SPEED', 3000.00);

--- inclusão imediata após insert
DECLARE @id INT = SCOPE_IDENTITY();
UPDATE tb_produtos SET Estoque = 6 WHERE idproduto = @id;


---- CALCULANDO PORCENTAGEM DE DESCONTO ENCIMA DO VALOR SENDO 5%
SELECT nome, valorunitario, estoque, (valorunitario*Estoque) AS ValorTotalEstoque, (valorunitario*Estoque)*0.05 AS Desconto, (valorunitario*Estoque)*0.95 AS ValorFinalComDesconto
FROM tb_produtos
WHERE nome = 'Bike 05';

--- SELECT COM FORMAT E JOIN REALIZANDO CALCULOS
SELECT i.idpedido, p.nome AS Produto, i.quantidade, FORMAT (i.precounitario,'C', 'PT-BR') AS PrecoUnitario, FORMAT (i.desconto, 'C', 'PT-BR') AS ValorDesconto, FORMAT ((i.quantidade * i.precounitario)-i.desconto, 'C', 'PT-BR') AS ValorFinal 
From tb_itens_pedidos i 
JOIN tb_produtos p ON i.idproduto = p.idproduto

SELECT * FROM tb_itens_pedidos;

UPDATE tb_itens_pedidos SET desconto = 200 WHERE iditem = 1;

-- Defini um descontode 10% geral
DECLARE @DescontoGlobal DECIMAL(5,2) = 0.10; -- ESPECIFICANDO O DESCONTO DE 10%. DECLARANDO 
SELECT nome, FORMAT(valorunitario,'C','PT-BR') AS ValorUnitario, estoque,
FORMAT (valorunitario*Estoque, 'c','pt-br') AS TotalBruto, 
FORMAT (valorunitario*Estoque*(1-@DescontoGlobal),'c','pt-br') AS TotalComDesconto
FROM tb_produtos

----- CASE (SE DO EXCEL) 
SELECT nome AS Produto, FORMAT(valorunitario, 'c','pt-br'),
CASE
WHEN /*QUANDO*/ valorunitario >= 7000 THEN /*ENTÃO*/ 'Premium' --- QUANDO O VALOR UNITARIO FOI MAIOR OU IGUAL A 7000 TRAZER COMO PREMIUM
WHEN /*QUANDO*/ valorunitario >= 2500 THEN /*ENTÃO*/ 'Intermediaria' --- QUANDO O VALOR UNITARIO FOI MAIOR OU IGUAL A 7000 TRAZER COMO INTERMEDIARIO
ELSE /*SE NÃO*/ 'Básica' --- SE NÃO FOR NENHUM DOS DOIS ACIMA, TRAZER COMO BÁSICO
END AS CategoriaProduto
FROM tb_produtos

--- TRAZ ITENS QUE ESTÃO COM O ESTOQUE BAIXO
SELECT * FROM tb_produtos WHERE idproduto = 5;
SELECT nome, estoque FROM tb_produtos WHERE estoque < 5;

DELETE FROM tb_produtos WHERE idproduto = 5; -- APAGAR UMA LINHA DA TABELA PELO ID DA TABELA

-- APAGAR SOMENTE SE EXISTIR O VALOR A SER APAGADO

IF /*SE*/ EXISTS /* EXISTIR*/ (SELECT 1 FROM tb_produtos WHERE idproduto = 6)
DELETE FROM tb_produtos WHERE idproduto = 6;

--- APAGAR TABELA EM MODO DESTRUITIVO
/*
DROP TABLE tb_produtos
*/

---- APAGAR EM MODO SEGURO
/*
IF OBJECT_ID('tb_produtos', 'U') IS NOT NULL
DROP TABLE tb_produtos;
*/

---- APAGAR O MEUPRIMEIROBANCO
DROP DATABASE Meuprimeirobanco

IF EXISTS (SELECT name FROM SYS.DATABASES WHERE name = 'bd_pedidos')
DROP DATABASE bd_pedidoS

USE master --- ACESSAR O SQL SERVER MATRIZ A BASE MASTER, DESSA FORMA NÃO ESTAMOS DENTRO DO BANCO

