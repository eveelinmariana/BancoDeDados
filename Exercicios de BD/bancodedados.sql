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