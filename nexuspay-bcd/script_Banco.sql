drop database nexus_pay;
create database nexus_pay;
use nexus_pay;

create table cliente (
  id_cliente int primary key auto_increment,
  nome varchar(100) not null,
  cpf char(11) not null unique,
  data_criacao datetime default current_timestamp
);

create table email_cliente (
  id_email int primary key auto_increment,
  id_cliente int not null,
  email varchar(255) not null unique,
  foreign key (id_cliente) references cliente(id_cliente) on delete cascade
);

create table endereco (
  id_endereco int primary key auto_increment,
  id_cliente int not null,
  rua varchar(100),
  numero varchar(10),
  bairro varchar(100),
  cidade varchar(100),
  estado char(2),
  foreign key (id_cliente) references cliente(id_cliente) on delete cascade
);

create table telefone (
  id_telefone int primary key auto_increment,
  id_cliente int not null,
  ddd char(2),
  numero varchar(9),
  foreign key (id_cliente) references cliente(id_cliente) on delete cascade
);

create table conta (
  id_conta int primary key auto_increment,
  id_cliente int not null,
  tipo enum('corrente', 'poupanca', 'investimento') not null,
  saldo decimal(10,2) default 0.00,
  data_abertura datetime default current_timestamp,
  foreign key (id_cliente) references cliente(id_cliente) on delete cascade
);

create table transacao (
  id_transacao int primary key auto_increment,
  id_conta int not null,
  tipo enum('debito', 'credito', 'transferencia') not null,
  valor decimal(10,2) not null,
  data_hora datetime default current_timestamp,
  foreign key (id_conta) references conta(id_conta) on delete cascade
);

insert into cliente (nome, cpf) values
('cliente 1', '11111111111'),
('cliente 2', '22222222222'),
('cliente 3', '33333333333'),
('cliente 4', '44444444444'),
('cliente 5', '55555555555'),
('cliente 6', '66666666666'),
('cliente 7', '77777777777'),
('cliente 8', '88888888888'),
('cliente 9', '99999999999'),
('cliente 10', '10101010101');

insert into email_cliente (id_cliente, email) values
(1, 'cliente1@gmail.com'),
(2, 'cliente2@gmail.com'),
(3, 'cliente3@gmail.com'),
(4, 'cliente4@gmail.com'),
(5, 'cliente5@gmail.com'),
(6, 'cliente6@gmail.com'),
(7, 'cliente7@gmail.com'),
(8, 'cliente8@gmail.com'),
(9, 'cliente9@gmail.com'),
(10, 'cliente10@gmail.com');

insert into endereco (id_cliente, rua, numero, bairro, cidade, estado) values
(1, 'rua a', '10', 'centro', 'itapevi', 'sp'),
(2, 'rua b', '20', 'centro', 'itapevi', 'sp'),
(3, 'rua c', '30', 'centro', 'itapevi', 'sp'),
(4, 'rua d', '40', 'centro', 'itapevi', 'sp'),
(5, 'rua e', '50', 'centro', 'itapevi', 'sp'),
(6, 'rua f', '60', 'centro', 'itapevi', 'sp'),
(7, 'rua g', '70', 'centro', 'itapevi', 'sp'),
(8, 'rua h', '80', 'centro', 'itapevi', 'sp'),
(9, 'rua i', '90', 'centro', 'itapevi', 'sp'),
(10, 'rua j', '100', 'centro', 'itapevi', 'sp');

insert into telefone (id_cliente, ddd, numero) values
(1, '11', '90000001'),
(2, '11', '90000002'),
(3, '11', '90000003'),
(4, '11', '90000004'),
(5, '11', '90000005'),
(6, '11', '90000006'),
(7, '11', '90000007'),
(8, '11', '90000008'),
(9, '11', '90000009'),
(10, '11', '90000010');

insert into conta (id_cliente, tipo, saldo) values
(1, 'corrente', 1500.00),
(2, 'corrente', 2500.00),
(3, 'poupanca', 800.00),
(4, 'investimento', 12000.00),
(5, 'corrente', 3500.00),
(6, 'poupanca', 1200.00),
(7, 'corrente', 4500.00),
(8, 'investimento', 8500.00),
(9, 'corrente', 2800.00),
(10, 'poupanca', 6300.00);

insert into transacao (id_conta, tipo, valor) values
(1, 'debito', 200.00),
(1, 'credito', 500.00),
(2, 'debito', 150.00),
(3, 'debito', 300.00),
(4, 'credito', 1000.00),
(5, 'debito', 80.00),
(6, 'debito', 120.00),
(7, 'credito', 450.00),
(8, 'transferencia', 700.00),
(9, 'debito', 250.00),
(10, 'credito', 600.00);