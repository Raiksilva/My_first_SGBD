use ecommerce;
select count(*) from cliente;			
 select * from cliente c, pedidos o where c.IDCliente = IDPedidoCliente order by IDcliente;
 
select IDCliente, Fnome,Lnome, IDPedido, Pedido_status from cliente c, pedidos o where c.IDCliente = IDPedidoCliente;
select concat(Fnome,' ',Lnome) as cliente, IDPedido as pedidos, Pedido_status as statuss from cliente c, pedidos o 
	where c.IDCliente = IDPedidoCliente;
    
insert into pedidos(IDPedidoCliente,Pedido_status, Descrição_do_pedido, Frete, Pagamento_Boleto)
	values(1,default,'Comprado via aplicativo',15,false);
    
 select count(*) from cliente c, pedidos o 
			where c.IDCliente = IDPedidoCliente order by IDcliente;
            
show tables;
select * from produtopedido;
-- recuperação de pedido com produto associado  ??
select * from cliente c 
					inner join  pedidos o on c.IDCliente = o.IDPedidoCliente
					inner join produtopedido p on p.IDPProduto = o.IDPedido
				order by IDCliente;

-- recuperação de quantos pedidos foram realizados pelos clientes ??
select  *  from cliente c  inner join  pedidos o on c.IDCliente = o.IDPedidoCliente
			inner join produtopedido p on p.IDPProduto = o.IDPedido
				order by IDCliente;
                
                
select * from estoque where Quantidade > 8;
select * from estoque where Quantidade < 8;

select * from cliente;
select * from pedidos;


select * from pedidos where Pedido_status = 'Em processamento';
select * from pedidos where Pedido_status = 'confirmado';

select distinct concat(Fnome,' ', Lnome), IDCliente from cliente, pedidos where IDPedido > 4;

show tables;
select * from produtovendedor;

select * from vendedor;

select * from produtopedido;


select v.IDVendedor,Nomefantasia, Contatos ,IDPProduto  from vendedor v 
					inner join  produtovendedor p on v.IDVendedor = p.IDPvendedor
					-- inner join produtopedido p on p.IDPProduto = o.IDPedido
				order by IDVendedor;
                
select IDPedidoCliente, IDPedido * avg(Frete) as Media_total_frete from pedidos;
select min(Frete) as Menor_frete, max(Frete) as Maior_frete, sum(Frete) as Soma_dos_fretes from pedidos;

-- 'cliente' 'vendedor' 'pedidos'
select * from cliente;
select * from produtopedido;
select * from produtovendedor;

select distinct * from cliente 
		inner join pedidos on  IDCliente = IDPedidoCliente
        inner join produtopedido on IDPProduto = IDPedido
        where IDCliente > 1;
        
 select distinct * from cliente 
		inner join pedidos on  IDCliente = IDPedidoCliente
        inner join produtopedido on IDPProduto = IDPedido
        inner join produtovendedor on Quantidade = ProQuantidade;
         
select distinct * from cliente 
		inner join pedidos on  IDCliente = IDPedidoCliente
        inner join produtopedido on IDPProduto = IDPedido;
        
show tables;

-- 'pedidofornecedor' 'vendedor' estoque
select * from pedidofornecedor;
select * from fornecedor;
select * from produtoestoque;
select * from produtovendedor;

select distinct * from fornecedor 
		inner join pedidofornecedor on  IDFornecedor = IDEntFornecedor;
  
  -- Algum vendedor também é fornecedor?
 select distinct * from fornecedor        
        inner join produtoestoque on IDFornecedor = IDPfornecedor
        inner join pedidofornecedor on  IDFornecedor = IDEntFornecedor
        inner join produtovendedor on  IDPprodutos = IDPProduto;
 
 -- Relação de produtos fornecedores e estoques;
select distinct * from fornecedor        
        inner join produtoestoque on IDFornecedor = IDPfornecedor
        inner join pedidofornecedor on  IDFornecedor = IDEntFornecedor;


select * from produtoestoque;
select * from produto;
select * from fornecedor;

-- Relação de nomes dos fornecedores e nomes dos produtos;
select distinct razão_social as fornecedor, Pnome as produtos_oferecidos from fornecedor        
        inner join produtoestoque on IDFornecedor = IDPfornecedor
        inner join pedidofornecedor on  IDFornecedor = IDEntFornecedor
        inner join produto on IDProduto = IDPprodutos;