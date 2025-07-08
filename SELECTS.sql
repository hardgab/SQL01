USE bd_16_byciclon

--- PROCURANDO PESSOAS DE ESTADOS ESPECIFICOS
SELECT c.nome,c.email,e.uf,e.cidade --- LISTA DE COLUNAS QUE EU QUERO EXTRAIR,
FROM tb_cliente c --- IDENTIFICA TABELA 1 pela chave "C", incluir c. antes das colunas que são da tabela 1
JOIN tb_endereco e --- IDENTIFICA TABELA 2 pela chave "E",incluir e. antes das colunas que são da tabela 2
ON c.idendereco = e.idendereco --- atribui a conexão, especificando que idendereço da tab 1 é igual ao da tab 2
WHERE e.uf = 'SP'; --- Comando de busca por valor especifico, coluna especificada pela tabela matriz

-- PEDIDOS ACIMA DE 2500
SELECT p.idpedido,p.datapedido AS 'Data',c.nome --- LISTA DE COLUNAS QUE EU QUERO EXTRAIR
AS Cliente, p.valortotal -- ALTERA O NOME DA COLUNA NAME PARA CLIENTE
FROM tb_pedidos p -- IDENTIFICA TABELA 1 pela chave "P", incluir p. antes das colunas que são da tabela 1
JOIN tb_cliente c --- IDENTIFICA TABELA 2 pela chave "c",incluir c. antes das colunas que são da tabela 2
ON p.idcliente = c.idcliente --- atribui a conexão, especificando que idendereço da tab 1 é igual ao da tab 2
WHERE p.valortotal > '2500'; --- Comando de busca por valor especifico pela coluna da tabela matriz

-- APENAS QUEM É MTB
SELECT nome, linha, valorunitario -- SELECIONA AS COLUNAS ESPECIFICAS
FROM tb_produtos -- ESPECIFICA QUAL A TABELA QUE DEVE SER CONSULTADA
WHERE linha = 'MTB'; -- ESPECIFICA PARA BUSCAR APENAS PELAS BIKES MTB

-- CLIENTES QUE COMEÇAM COM A LETRA "A"
SELECT nome, email -- SELECIONA AS COLUNAS ESPECIFICAS
FROM tb_cliente -- ESPECIFICA QUAL A TABELA QUE DEVE SER CONSULTADA
WHERE nome LIKE 'V%'; -- BUSCAR POR LETRA ESPECIFICA UTILIZAR O % NA ESQUERDA PARA LETRA NO INICIO E % NA DIREITA E ESQUERDA PARA BUSCAR POR LETRA EM QUALQUER POSIÇÃO

--- PEDIDOS FEITOS ENTRE DUAS DATAS
SELECT  idpedido, datapedido,valortotal
FROM tb_pedidos
WHERE datapedido BETWEEN '2025-07-01' AND '2025-07-10';

--- VER ITENS DE UM PEDIDO ESPECIFICO
SELECT p.idpedido AS CodPedido, pr.nome AS Produto, i.quantidade, i.precounitario, i.desconto
FROM tb_itens_pedidos i
JOIN tb_pedidos p
ON i.idpedido = p.idpedido
JOIN tb_produtos pr
ON i.idproduto = pr.idproduto
WHERE p.idpedido = 1;

--- LISTA DE VENDEDORES E SUAS REGIÕES
SELECT v.idvendedor AS 'CodVendedor', v.nome AS 'Vendedor', v.email AS 'E-mail', r.nomeregional AS 'Nome Região'
FROM tb_vendedores v
JOIN tb_regional r
ON v.idregional = r.idregional;

--- CLIENTES E SEUS RESPECTIVOS VENDEDORES (POR PEDIDO)
SELECT c.nome AS Cliente, v.nome AS Vendedor, p.datapedido AS data
FROM tb_pedidos p
JOIN tb_cliente c ON p.idcliente = c.idcliente
JOIN tb_vendedores v ON p.idvendedor = v.idvendedor;

--- PRODUTOS COM VALOR ENTRE 2000 E 3000
SELECT nome, linha, valorunitario
FROM tb_produtos
WHERE valorunitario BETWEEN 2000 AND 3000;
