create table Cliente(
    id int not nul,
    nome varchar,
    email varchar,
    primary key (id)

);

alter table Cliente
add telefone decimal;

drop table Clinete;

insert into Pedido (numero, data_entrega, data_pedido)
values (1234, '2023-04-01', '2023-03-31');

update Item_pedido
set qtde = 10
where numero_item = 1;

delete from Pedido
where data_entrega < '2023-04-01';



create table Departamento (
    sigla char not null,
    nome varchar,
    matricula_gerente decimal,
    primary key (sigla),
    foreign key (matricula_gerente) references Funcionario(matricula)

);

alter table Departamento
add descricao varchar;

drop table Departamento;

insert into Funcionario (matricula,nome)
values (001, 'João Silva');

update Funcionario
set nome = "Suzana Nazaré"
where matricula = 002;

delete from Departamento
where sigla = 'RH';