-- inserção de dados e queries
use oficina;

show tables;
-- idCLient, Fname, Minit, Lname, FiscalNumber, Address, Contact
insert into Clients (Fname, Minit, Lname, FiscalNumber, Address, Contact) values 
			('John', 'J', 'Jons', 789456123, 'rua contorno sul 512, Marte - Entropia',917458811),
			('Dois', 'Irmãos', 'LTDA', 012451010000112, 'Av A 3001, Saturno - Paradoxo',912487441),
            ('Petter', 'S', 'Parker', 32645869745, 'rua win 63, Queens - Reminiscência',998452215);
                        
insert into veiculo (Modelo, Fabricante, Placa, Cor) values
			('Punto', 'FIAT', 'HSO4312', 'vermelho'),
			('Amarok','VW','QSD6654','cinza'),
			('A3', 'Audi', 'KHL6521','preto');
           
insert into mec (Pname, category) values
			('Filismino', 'Eletrotécnico'),
			('Geraldo','Funilareiro'),
			('Gabriela','Mec Motor'),
            ('Fco','Outro'),
            ('Jean','Vidraçeiro'),
            ('Bergs','Borracheiro');

select * from clients;
select * from veiculo;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
insert into OS (idOSClient, idOSPecas, orderStatus, dateEmis, dateEntr, paymentCash, valueOS, descOS) values
									(1, 45, default,'2022-09-16', '2022-09-01', default, 120.00 , 'Trocadas pastilhas do freio'),
                                    (2, 13, default,'2022-08-10', '2022-08-02', default, 320.00 , 'Refazer a rebinboca da parafuseta'),
                                    (3, 22, default,'2022-07-26', '2022-07-05', default, 700.00 , 'Pintura da porta do passageiro'),
                                    (4, 17, default,'2022-09-10', '2022-09-07', default, 80.00 , 'Ajuste do retrovisor do motorista');                         
                                                           
-- Saber o número de clientes
select count(*) from clients;

-- Verificar os pedidos feitos pelos clientes
select * from clients c, OS o where c.idClient = idOSClient;
-- especificar os atributos recuperados
select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOS as OS, orderStatus as Status from clients c, OS o where c.idClient = idOSClient;

select count(*) from clients c, OS o
			where c.idClient = o.idOSClient;

-- Recuperar quantos ordens de serviços foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_os from clients c 
					inner join os o ON c.idClient = o.idOSClient
			group by idCLient;

                                    
                                    