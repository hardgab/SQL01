---
USE bd_16_byciclon

--- Tabelas do Bacno de Dados
SELECT name FROM sys.tables ORDER BY name;

--- campo da tabela pedidos
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tb_pedidos'

--- TOTAL DE CLIENTES POR ESTADO
SELECT e.uf, COUNT(*) AS total_cliente
FROM tb_cliente c
JOIN tb_endereco e ON c.idendereco = e.idendereco
GROUP BY e.uf
ORDER BY total_cliente DESC

--- NOME DOS CLIENTES E VALOR TOTAL QUE CADA UM JÁ GASTOU
SELECT c.nome AS Cliente, SUM(p.valortotal) AS TotalGasto
FROM tb_cliente c
JOIN tb_pedidos p ON c.idcliente = p.idcliente
GROUP BY c.nome
ORDER BY TotalGasto DESC

-- VALOR TOTAL DE PEDIDOS POR CLIENTE E ESTATISTICAS DE CALCULO
SELECT c.nome AS Cliente, SUM(p.valortotal) AS TotalGasto, AVG(p.valortotal)  AS MediaPorPedido, MIN(p.valortotal) AS PedidoMaisBarato, MAX(p.valortotal) AS PedidoMaisCaro 
FROM tb_cliente c
JOIN tb_pedidos p ON c.idcliente = p.idcliente
GROUP BY c.nome

--- PEDIDOS POR MÊS COM MÉDIA DO VALOR
SELECT MONTH(datapedido) AS Mes, COUNT (*) AS Totaldepedidos, AVG(valortotal)  AS MediaPorPedido
FROM tb_pedidos
GROUP BY MONTH(datapedido)
ORDER BY Mes

--- 