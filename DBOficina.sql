-- criação do banco de dados para o cenário da Oficina
-- drop database oficina;
create database oficina;
use oficina;

-- criar tabela cliente

create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        FiscalNumber char(15) not null,
        Adress varchar(30),
        contact varchar(11) default 0 not null,
        constraint unique_fiscalnumber_client unique (FiscalNumber)
);

alter table clients auto_increment=1;

desc clients;

-- criar tabela veículo

create table veiculo(
		idVeiculo int auto_increment primary key,
        Modelo varchar(15) not null,
        Fabricante varchar(15),
        Placa varchar(7) not null,
        Cor char(15) not null,
        constraint unique_placa_client unique (Placa)
);

-- criar tabela mecânico

create table mec(
	idMec int auto_increment primary key,
	Pname varchar(10),
	category enum('Eletrotécnico', 'Funilareiro', 'Mec Motor', 'Vidraçeiro','Borracheiro', 'Outro') not null
);

-- criar tabela Ordem de Serviço

create table OS(
	idClient int not null,
    idOS int not null,
    idPecas int,
    descOS varchar(255) not null,
    dateEmis varchar(8) not null,
    dateEntr varchar(8),
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    valueOS float default 0,
    paymentCash boolean default false,
    primary key(idCLient, idOS),
    constraint fk_idOs foreign key (idOS) references clients(idClient)
);

-- criar tabela mão de obra

create table mao_de_obra(
	idMO int auto_increment primary key,
    idOS int not null,
    quantity int default 0,
	timeMO float not null,
    valueMO float default 0,
    Complexidade varchar(45)
);

show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'oficina';