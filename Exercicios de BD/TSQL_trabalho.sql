drop database if exists venda;
create database venda;
use venda;

create table vendedor
   (codigo int not null,
    nome varchar(30),
    idade int,
    salario float,
    primary key (codigo)
   );

create table cliente
   (codigo int not null,
    cidade varchar(30),
    tipo varchar(30),
    primary key (codigo)
   );

create table pedido
   (numero int not null,
    codigo_ven int not null,
    codigo_cli int not null,
    quantidade int,
    primary key (numero),
    foreign key (codigo_ven) references vendedor (codigo),
    foreign key (codigo_cli) references cliente (codigo)
   );

insert into vendedor values (1, 'João', 25, 3000);
insert into vendedor values (2, 'Maria', 29, 3500);
insert into vendedor values (3, 'Kelly', 19, 4000);
insert into vendedor values (4, 'Juliano', 22, 2900);
insert into vendedor values (5, 'Julia', 20, 2000);


insert into cliente values (11, 'São Paulo', 'Indústria');
insert into cliente values (12, 'Pres. Prudente', 'Comércio');
insert into cliente values (13, 'Pres. Prudente', 'Agronegócio');
insert into cliente values (14, 'São Paulo', 'Comércio');
insert into cliente values (15, 'São Paulo', 'Agronegócio');


insert into pedido values (100, 1, 11, 20);
insert into pedido values (200, 1, 12, 35);
insert into pedido values (300, 3, 13, 25);
insert into pedido values (400, 4, 13, 65);
insert into pedido values (500, 1, 13, 23);
insert into pedido values (600, 3, 15, 40);
insert into pedido values (700, 5, 15, 20);


# INNER JOIN - junção interna
select * from pedido p 
	inner join vendedor v on p.codigo_ven = v.codigo;
    
# LEFT JOIN - junção a esquerda
select * from pedido p 
	left join cliente c on p.codigo_cli = c.codigo;

# LEFT OUTER JOIN WITH EXCLUSION - junção exclusiva a esquerda
select * from vendedor v
 left join pedido p on v.codigo = p.codigo_ven 
	where p.codigo_ven is null;
    
# Right JOIN - junção a direita 
select * from vendedor v
	right join pedido p  on v.codigo = p.codigo_ven;

# RIGHT OUTER JOIN WITH EXCLUSION - junção exclusiva a esquerda
select * from vendedor v
 right join pedido p on v.codigo = p.codigo_ven 
	where v.codigo is null;

# FULL JOIN Junção Completa ADAPTADO
select * from vendedor v 
 left join pedido p on v.codigo = p.codigo_ven
union 
select * from vendedor v 
	right join pedido p on v.codigo = p.codigo_ven;
     
# CROSS join - Junção cruzada 
select * from vendedor v 
	cross join cliente;

# SELECT FROM TWO TABLES - junção de duas tabelas
select * from vendedor v 
	join pedido p on v.codigo = p.codigo_ven;

# SEMI JOIN - semi junção 
select * from vendedor v
	where v.codigo in (select codigo_ven from pedido);

# ANTI SEMI JOIN - 	anti semi junção 
select * from vendedor v 
	where v.codigo not in (select codigo_ven from pedido);

# CROSS JOIN - junção cruzada 
select * from vendedor 
	cross join pedido;

#FULL OUTER JOIN EXCLUSION 
select * from vendedor v 
 left join pedido p on v.codigo = p.codigo_ven
union
select * from vendedor v
	right join pedido p on v.codigo = p.codigo_ven 
where v.codigo is null;

# TWO INNER JOINS
select * from vendedor v 
	join pedido p on v.codigo = p.codigo_ven 
    join cliente c on p.codigo_cli = c.codigo;
    
# TWO FULL OUTER  JOINS
select * from vendedor v 
 left join pedido p on v.codigo = p.codigo_ven
union
select * from vendedor v
	right join pedido p on v.codigo = p.codigo_ven ;
    
# INNER JOIN AND LEFT OUTER JOIN 
select * from vendedor v
	join pedido p on v.codigo = p.codigo_ven
	left join cliente c on p.codigo_cli = c.codigo;
    
# TWO LEFT OUTER JOINS
select * from vendedor v 
	left join pedido p on v.codigo = p.codigo_ven
	left join cliente c on p.codigo_cli = c.codigo;






    