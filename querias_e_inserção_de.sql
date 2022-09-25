use ecommerce;

show tables;
desc table cliente;
select * from cliente;

insert into cliente (Fnome,Mnome,Lnome,Contato,Data_nasc,CPF,Endereço)
	values('Maria','M','Silva','(81)9 9912-1514','2000-10-15','12345678911','Rua Limeira de prata 15, Carangola - Cidade das flores'),
		  ('José','G','Silva','(82)9 9912-1515','1995-04-12','12345678561','Rua Alves roberto 55, Centro - Cidade goiania'),
          ('Francisco','M','Monteiro','(84)9 9562-1519','1975-05-14','55545678911','AV Paris 185, Salgado - Cidade dos montes'),
          ('Rose','J','Alves','(81)9 9712-1614','1990-07-05','12387948911','Rua Sebastião lima 87, Centro - Cidade das flores'),
          ('Julia','A','Assis','(81)9 8512-1514','2000-09-25','11879845308','Rua Limeira de prata 18, Areal - Cidade das flores'),
          ('João','O','Cruz','(82)9 8812-1514','1980-12-17','15345678911','Rua Rio branco 155, Idianopoles - Cidade goiania');
          
select * from produto;
insert into produto (Pnome,Classificação_criança,Categoria,Data_validade,Avaliação,Dimensão,Descrição)
	values('Fone de ouvido bluetooth',false,'Eletrônico',null,'5',null,'Aprova de água, Vermelho'),
		  ('Fone de ouvido bluetooth',false,'Eletrônico',null,'4',null,'Aprova de água, azul'),
          ('Bola futsal',false,'Esportes',null,'5',null,null),
          ('Fogao',false,'Eletrônico',null,'4','85x51x57','Branco com preto'),
          ('Boneca barbie',true,'Brinquedos',null,'5',null,'Barbie enfermeira'),
          ('Feijão',false,'Alimentos','2025-05-04','5',null,null),
          ('Arroz',false,'Alimentos','2025-06-04','5',null,null),
          ('Livro os três porquinhos',true,'Livros',null,'5',null,'um ótimo livro para crianças'),
          ('Box Senhor dos anéis',false,'Livros',null,'5',null,'Box do senhor dos anéis, perfeito');
          
          
select * from pedidos;
insert into pedidos(IDPedidoCliente,Pedido_status, Descrição_do_pedido, Frete, Pagamento_Boleto)
	values(1,default,'Comprado via aplicativo',15,false),
		  (3,'Confirmado','Comprado via aplicativo',40,true),
          (5,default,null,0,false),
          (6,'Confirmado',null,10,true);
    
select * from produtoPedido;
insert into produtoPedido(IDPpedido,IDPProduto,ProQuantidade,ProStatus)
	values(3,5,10,default),
		  (4,9,5,default),
		  (5,4,4,default),
          (6,10,default,default);
    
    
select * from estoque;
-- delete from estoque where IDEstoque in (4,5,6,7,8,9,10,11,12,13);
insert into estoque(Validade,Quantidade,Endereço) 
			values(null, 10,'São Paulo - SP'),
				  ('2025-04-10',20,'Recife - PE'),
                  (null, 1,'Rio de Janeiro - RJ'),
				  (null, 5,'Caruaru - PE'),
				  (null, default,'Petrolina - PE');
                  
select * from vendedor;
-- delete from vendedor where IDVendedor in (9,10,11,12);
insert into vendedor(Endereço,Nomefantasia,Razão_social,Contatos,CNPJ,CPF)
			values('Caruaru - PE','Eletro','marcos_Eletro','(81)9 8926-2344','18434879515234',null),
				  ('Petrolina - PE','Esportshow','Vinicius_Mateus','(87)9 8926-2754',null,'10719548905'),
				  ('Recife - PE','Matriz','Matriz_life','(81)9 9266-2344','19984879815789',null),
                  ('São Paulo - SP','Falen','Rayane_carla','(81)9 9246-2344',null,'19345878912'),
                  ('Rio de Janeiro - RJ','Never','Pedrinho_never','(81)9 9686-2344',null,'88345678935');


select * from fornecedor;
insert into fornecedor(Endereço, CNPJ,Razão_social, Contatos) 
			values('Caruaru','15234879615234','Tamadaru','(81)9 9916-2344'),
				  ('Recife','10254879615794','Fanfic_lin','(81)9 9918-2544'),
				  ('Petrolina','10254879615796','Tratu_Veloz','(87)9 9818-2644'),
                  ('Rio de Janeiro','15234387615945','Entrega_rapida','(82)9 9917-2534'),
                  ('São paulo','15225879615021','Sua_escolha','(11)9 9415-4578'); 
				   

select * from pedidofornecedor;
insert into pedidofornecedor(IDEntEstoque, IDEntFornecedor, Entrega_prevista) 
			values(14,12,'2022-10-18'), -- são paulo
                  (15 ,9,'2023-02-08'), -- recife
                  (16,11,'2023-02-01'), -- rio de janeiro
                  (17,8,'2022-12-03'), -- caruaru
                  (18,10,'2023-01-01'); -- petrolina
 
 select * from produtovendedor;
 insert into produtovendedor(IDPvendedor, IDPProduto, Quantidade)
			 values(29,3,5), -- caruaru
				   (30,9,0),  -- petrolina
                   (31,4,20),  -- recife 
                   (32,8,10),  -- são paulo
                   (33,5,1); -- rio de janeiro

select * from pagamento;
select * from cliente;
insert into pagamento(IDPagCliente,IDPagamento,IDRecpedido,Forma_Pagamento,Limite_disponivel)
			values(1,96,3,'Cartão de Credito',2000.00),
				  (3,97,4,'Pix',null),
                  (5,98,5,'Debito',null),
                  (6,99,6,'Cartão de Credito',1500.50);

select * from produtoEstoque;
select * from pedidos;
select * from cliente;
insert into produtoEstoque(IDPEstoque, IDPprodutos, localização) 
		values(14,5,'PE'),
			  (15,9,'PE'),
              (16,3,'PE'),
			  (17,10,'RJ'),
			  (18,4,'SP');
              
              