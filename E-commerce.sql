create database Ecommerce;
use ecommerce;
-- drop database ecommerce;

-- ciação da tabela de clientes
create table cliente(
	IDCliente int auto_increment primary key not null,
    Fnome varchar(10) not null,
    Mnome varchar(40),
    Lnome varchar(10) not null,
    Contato char(15) not null,
    Data_nasc date,
    CPF char(11) not null, 
    Endereço varchar(200) not null,
	constraint Cliente_CPF_unico unique (CPF)
);
alter table cliente auto_increment =1;

-- ciação da tabela de produtos product
create table produto(
	IDProduto int auto_increment primary key not null,
    Pnome varchar(50) not null,
    Classificação_criança bool default false,
    Categoria 
		enum ('Eletrônico','Roupas','Brinquedos','Esportes','Alimentos','Móveis','Livros') not null,
    Data_validade date,
    Avaliação float default 0,
    Dimensão varchar(10),
	Descrição varchar(50)
);
alter table produto auto_increment =2;



-- criação da tabela de pedidos order
-- drop table pedidos;
create table pedidos(
	IDPedido int auto_increment primary key,
    IDPedidoCliente int,
    Pedido_status enum('Cancelado','Confirmado','Em processamento')
		default 'Em processamento',
    Descrição_do_pedido varchar(250),
    Frete float default 0,
    pagamento_Boleto bool default false,
    constraint fk_pedido_cliente foreign key (IDPedidoCliente) 
		references cliente(IDCliente)
			on update cascade
);
-- desc pedidos;
alter table pedidos auto_increment =3;

-- tabela de pagamento payments
drop table pagamento;
create table pagamento(
    IDPagCliente int, 
	IDPagamento int,
    IDRecpedido int,
	Forma_Pagamento enum('Cartão de Credito','Dois cartões','Debito','Pix', 'Dinheiro','Boleto'),
	Limite_disponivel float,
	primary key (IDPagCliente, IDPagamento, IDRecpedido),
    constraint fk_Pagamento_cliente foreign key (IDPagcliente) references cliente(IDCliente),
    constraint fk_pagamento_realizado foreign key (IDRecpedido) references pedidos(IDPedido)
);

-- criação da tabela de estoque productstorage
create table estoque(
	IDEstoque int auto_increment primary key,
    Validade date,
    Quantidade int default 0,
	Endereço varchar(200)
); 
alter table estoque auto_increment =4; 

-- criação da tabela do fornecedor supplier
create table fornecedor(
	IDFornecedor int auto_increment primary key,
    Endereço varchar(200) not null,
    CNPJ char(14) not null,
    Razão_social varchar(40) not null, 
    Contatos char(15) not null,
    constraint Fornecedor_unico_CNPJ unique (CNPJ)
);
alter table fornecedor auto_increment =8; 

-- criação da tabela do vendedor seller
create table vendedor(
	IDVendedor int auto_increment primary key,
    Endereço varchar(200) not null,
    Nomefantasia char(30) not null,
    Razão_social varchar(40) not null, 
    Contatos char(15) not null,
    CNPJ char(14),
    CPF char(11), 
    constraint Vendedor_unico_CPF unique (CPF),
    constraint vendedor_unico_CNPJ unique (CNPJ)
);
alter table vendedor auto_increment =9;

-- tabela relação produto_vendedor productseller
create table produtoVendedor(
	IDPvendedor int,
    IDPProduto int,
    Quantidade int default 1,
    primary key (IDPvendedor, IDPProduto),
    constraint fk_Produto_vendedor foreign key (IDPvendedor)
		references vendedor(IDVendedor),
	constraint fk_Produto_produto foreign key (IDPProduto)
		references produto(IDProduto)
);

-- tabela da relação entre produto_pedido productorder
create table produtoPedido(
	IDPpedido int,
    IDPProduto int,
    ProQuantidade int default 1,
    ProStatus ENUM('Disponivel', 'Sem estoque') default 'Disponivel',
    primary key (IDPpedido, IDPProduto),
    constraint fk_Produto_pedido foreign key (IDPpedido)
		references pedidos(IDPedido),
	constraint fk_Produto_produtos foreign key (IDPProduto)
		references produto(IDProduto)
);

-- tabela de relação entre estoque_produto storeage location
-- drop table produtoEstoque;
create table produtoEstoque(
	IDPEstoque int,
    IDPprodutos int,
    localização varchar(255) not null,
    primary key (IDPEstoque, IDPprodutos),
    constraint fk_Produto_vendedores foreign key (IDPprodutos) 
		references  produto(IDProduto),
    constraint fk_Produto_estoque foreign key (IDPEstoque) 
		references pedidos(IDPedido)
);
select * from produto;
-- relação de estoque_fornecedor orde
create table pedidoFornecedor(
	IDEntEstoque int,
    IDEntFornecedor int,
    Entrega_prevista date not null,
    primary key (IDEntEstoque, IDEntFornecedor),
    constraint fk_realização_entrega foreign key (IDEntFornecedor) references fornecedor(IDFornecedor),
    constraint fk_recebimento_entrega foreign key (IDEntEstoque) references estoque(IDEstoque)
);

use information_schema;
show tables;
desc REFERENTIAL_CONSTRAINTS;
select * from REFERENTIAL_CONSTRAINTS where constraint_schema = 'ecommerce';

