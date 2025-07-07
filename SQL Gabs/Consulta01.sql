--- selecionar colunas que eu quero
select p.id_pedido, p.descricao, p.valor, c.Id_cliente, c.nome, c.cidade from tb_pedidos p
--- Junção das colunas de tabelas distintas
JOIN 
	tb_clientes c on p.fk_cliente =  c.Id_cliente

--- ordenar
order by c.nome;