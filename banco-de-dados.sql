
create database ecommerce; 
use ecommerce;

create table clients(
  idClient int auto_increment primary key,
  Fname varchar (10),
  Minit char (3),
  Lname varchar (20),
  CPF char (11) not null,
  adress varchar (30),
  constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

create table product (
  idProduct int auto_increment primary key,
  Pname varchar(10) not null,
  classification_kids bool default false,
  category enum ("Eletrônico", "Vestimenta", "Brinquedos", "Alimentos", "Móveis", "Eletrodomésticos") not null,
  avaliação float default 0,
  size varchar(10)
);

create table payments (
  idClient int,
  idPayment int,
  typePayment enum ("Boleto", "Cartão de débito", "Cartão de crédito", "Dois cartões", "Pix", "Dinheiro", "Qr code"),
  primary key (idClient, idPayment)
);

create table orders (
  idOrder int auto_increment primary key,
  idOrderClient int,
  orderStatus enum ("Cancelado", "Confirmado", "Em processamento") default "Em processamento",
  orderDescription varchar (300),
  sendValue float default 10,
  paymentCash boolean default false,
  constraint fk_orders_client foreign key (idOrderClient) references clients (idClient)
);

create table productStorage(
  idProduct int auto_inrcrement primary key,
  storageLocation varchar(300),
  quantity int default 0
);

create table supplier(
  idSupplier int auto_increment primary key,
  SocialName varchar (255) not null,
  CNPJ char (15) not null,
  contact char (11) not null,
  constraint unique_supplier unique (CNPJ)
);

create table seller(
  idSeller int auto_increment primary key,
  SocialName varchar (255) not null,
  AbstName varchar (255),
  CNPJ char (15) not null,
  location varchar (255),
  contact char (11) not null,
  constraint unique_cnpj_seller unique (CNPJ),
  constraint unique_cpf_seller unique (CPF)
);

create table productSeller (
  idPseller int,
  idPproduct int,
  prodQuantity int default 1,
  primary key (idPseller, idPproduct),
  constraint fk_product_seller foreign key (idPaseller) references seller (idSeller),
  constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

create table productOrder(
  idPOproduct int,
  idPOorder int,
  poQuantity int default 1,
  poStatus enum ("Disponível", "Sem estoque") default "Dsiponível",
  primary key (idProduct, idPOorder),
  constraint fk_productorder_seller foreign key (idPOproduct) references product (idProduct),
  constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
);

create table storageLocation(
  idLproduct int,
  idLstorage int,
  location varchar (255) not null,
  primary key (idLproduct, idLstorage),
  constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
  constraint fk_storage_location_sotage foreign key (idLstorage) references productStorage (idProdStorage)
);

create table productSupplier(
  idPsSupplier int,
  idPsProduct int,
  quantity int not null,
  primary key (idPsSupllier, idPsProduct),
  constraint fk_storage_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier),
  constraint fk_storage_supplier_product foreign key (idPsProduct) references product (idProduct)
);

show tables;

  
