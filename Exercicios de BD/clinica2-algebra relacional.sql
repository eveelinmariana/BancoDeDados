CREATE DATABASE CLINICA1;
USE CLINICA1;

CREATE TABLE medico (
crm INT NOT NULL,
nome VARCHAR(30),
endereco VARCHAR(50),
Id_Especialidade int, /* na modelagem era pra ser outra tabela */
PRIMARY KEY (crm)
);

CREATE TABLE paciente (
cpf INT NOT NULL,
nome VARCHAR(30),
endereco VARCHAR(50),
telefone varchar(11),
PRIMARY KEY (cpf)
);

CREATE TABLE consulta (
id_Consulta INT NOT NULL,
cpf int,
crm int,
data date,
PRIMARY KEY (id_Consulta),
foreign key (cpf) references paciente (cpf),
foreign key (crm) references medico (crm)
);

insert into medico (crm, nome, endereco) values (9999, 'João da Silva', 'Rua das Flores');       
insert into medico (crm, nome, endereco) values (3333, 'João Costa', 'Rua dos Cravos');
insert into medico (crm, nome, endereco) values (5555, 'João de Souza', 'Rua das Margaridas');    

insert into paciente (cpf, nome, endereco, telefone) values (11111, 'Carlos Augusto', 'Rua das Margaridas', '180000-2425');
insert into paciente (cpf, nome, endereco, telefone) values (22222, 'Carla dos Santos', 'Rua dos Paulinas', '18-99992828');
insert into paciente (cpf, nome, endereco, telefone) values (33333, 'Mário Augusto', 'Rua dos Girassóis', '18-99992828');    

insert into consulta values (1, 11111, 9999, '2023-10-10' );     
insert into consulta values (2, 11111, 9999, '2023-10-10' );   
insert into consulta values (3, 11111, 9999, '2023-10-10' );   

insert into consulta values (4, 22222, 5555, '2023-10-10' );     
insert into consulta values (5, 22222, 5555, '2023-10-10' );   
insert into consulta values (6, 22222, 5555, '2023-10-10' );  

-- Produto cartesiano: combinação de todos os registros da tabela médico
-- com todos da tabela consulta
-- LISTE TODOS OS MÉDICOS COMBINADOS COM TODAS AS CONSULTAS:
Select * from medico, consulta; 

-- Junção: Junção itens que tem a mesma chave ( produto cartesiano mais a 
-- restrição da chave estrangeira de uma tabela da outra tabela)
-- LISTE TODOS OS DADOS DOS MÉDICOS E DE SUAS CONSULTAS
Select * from medico m, consulta c
     where m.crm = c.crm; 
     
Select * from medico m
     inner join consulta c
     on m.crm = c.crm;
     
-- Restrição: Vai trazer os elementos da junção e mais a restrição 
-- da cláusula where

-- LISTE TODOS OS DADOS DO MÉDICO JOÃO DA SILVA E DE SUAS CONSULTAS
Select * from medico m
     inner join consulta c
     on m.crm = c.crm
     where m.nome = 'João da Silva';

Select * from medico m, consulta c
     where m.crm = c.crm and m.nome = 'João da Silva'; 

-- Projeção: Não preciso de todos os atributos, então na select eu 
-- determino a projeção que eu quero

-- LISTE TODOS OS DADOS DO MÉDICO JOÃO DA SILVA E A DATA E CPF DOS
-- PACIENTES CONSULTADOS
Select m.*, c.data, c.cpf
      from medico m
      inner join consulta c
      on m.crm = c.crm
      where m.nome = 'joão da Silva';

 -- Partindo dos exemplos de Produto Cartesiano, Junção, Restrição 
 -- e Projeção. Elabore mais duas consultas de cada um.    
     
Select m.crm as 'CRM', m.nome as 'Nome do médico', c.data as 'Data da consulta', p.nome as 'Nome do paciente'
       from medico m
       inner join consulta c
       on m.crm = c.crm
       inner join paciente p
       on c.cpf = p.cpf;