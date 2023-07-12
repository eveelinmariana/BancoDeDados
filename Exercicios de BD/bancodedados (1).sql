/* 01 */
create database Empresa;

create table Departamento
(
    Sigla varchar not null,
    Nome varchar,
    Valor_orcamento float,
    primary key (Sigla),
);

create table Empregado
(
    Matricula decimal not null,
    Nome varchar,
    Cargo varchar,
    Salario float,
    Sigla varchar,
    primary key (Matricula),
    foreign key (Sigla) references Departamento(Sigla),


);

/* A */

alter table Departamento
(
    add Chefe_Dpto varchar(50)
);

/* B */
alter table Empregado
(
    add Email varchar(50)
);

/* C */

alter table Empregado
(
    change Cargo Cargo_Emp varchar
);

/* D */

alter table Empregado
(
    change Salario Salario_Emp float
);

/* E */

alter table Empregado
(
    drop Email
);

/* F */

drop table Empregado;

/* G */

insert into Departamento(Sigla,Nome,Valor_orcamento) 
values  ('RH','Recursos Humanos',3000),
        ('TI','Tecnologia da Informação',10000),
        ('VD','Vendas',7000);

/* H */
delete from Departamento
where Sigla = RH ;

/* i */

create table Empregado (
    matricula decimal not null,
    nome varchar(50),
    cargo varchar(50),
    salario float,
    sigla varchar(10) references Departamento (sigla)
);

insert into Empregado (matricula,nome,cargo,salario,sigla)
values(100,'Maria','Analista',5000,'TI'),
(200,'Joaquina','Coordenadora',3000,'RH'),
(300,'João','Programador',4500,'TI');

/* J */

insert into Departamento (sigla,nome)
values ('RH', 'Recursos Humanos');

/* K */

insert into Empregado (matricula,nome,sigla)
values (100,'Maria','TI'),
(200,'Joaquina','RH'),
(300,'João','TI');

/* L */

insert into Empregado (matricula,nome,cargo,salario,sigla)
values(200, 'João Carlos', 'Analista ', 500, 'TI');

update Empregado set nome = 'José Carlos' where matricula = 200;

/* 02 */

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

/* 03 */
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

/* 04 */
create table Projeto (
    cod_projeto char not null,
    dat_inicio Date,
    dat_fim Date,
    nome varchar,
    primary key (cod_projeto),
    
);
create table Funcionario (
    matricula char not null,
    dat_admissao Date,
    nome values 
    primary key (matricula),
    
);
create table Alocacao(
    dat_alocacao Date not null,
    qtde_horas Hour,
    dat_fim Date,
    nome values 
    primary key (cod_projeto),
    primary key (matricula),
    primary key (dat_alocacao)
    foreign key (cod_projeto) references Projeto(cod_projeto);
    foreign key (matricula) references Funcionario(matricula);
);
insert into Projeto(cod_projeto,dat_inicio,dat_fim,nome)
values(122,'2023-04-17','2023-12-20',"Aplicativo");

alter table Projeto
add dat_fim decimal;

drop table Funcionario;

update Projeto
set nome = "Aplicativo Android"
where dat_inicio = 2023-05-23;

delete from Projeto
where Nome = 'Aplicativo Android';

/* 5 */

create table Diciplina(
    codigo char not null,
    qtde_credito varchar,
    cod_diciplina int,
    nome varchar, 
    primary key (codigo),
    foreign key (cod_diciplina) references Diciplina(cod_diciplina);
    
);
insert into Diciplina(codigo,cod_diciplina,qtde_credito,nome)
values(122,2023,'300',"Estruturas de dados");

alter table Diciplina
add cod_diciplina int;

update Diciplina
set nome = "Banco de dados"
where cod_diciplina = 2024;

drop table Diciplina,

delete from Diciplina
where nome = 'Banco de dados';


