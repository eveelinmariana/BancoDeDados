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
    nome varchar(30),
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

insert into cliente values (11, 'São Paulo',"Sandra", 'Indústria');
insert into cliente values (12, 'Pres. Prudente',"Samuel", 'Comércio');
insert into cliente values (13, 'Pres. Prudente',"Silva", 'Agronegócio');
insert into cliente values (14, 'São Paulo',"Maria", 'Comércio');
insert into cliente values (15, 'São Paulo',"Jose", 'Agronegócio');

insert into pedido values (100, 1, 11, 20);
insert into pedido values (200, 1, 12, 35);
insert into pedido values (300, 3, 13, 25);
insert into pedido values (400, 4, 13, 65);
insert into pedido values (500, 1, 13, 23);
insert into pedido values (600, 3, 15, 40);
insert into pedido values (700, 5, 15, 20);
insert into pedido values (900, 2, 15, 20);
insert into pedido values (800, 2, 15, 20);

-- Produto cartesiano: combinação de todos os registros da tabela vendedor com a tabela pedido
-- 1) LISTE TODOS OS VENDEDORES COMBINADOS COM TODOS OS PEDIDOS:
select * from vendedor, pedido;


-- 1.1) LISTE TODOS OS CLIENTE COMBINADOS COM TODOS OS PEDIDOS:
select * from cliente, pedido;


-- 1.2) LISTE TODOS OS CLIENTE COMBINADOS COM TODOS OS PEDIDOS:
select * from cliente, pedido;

-- Junção: Junção itens que tem a mesma chave ( produto cartesiano mais a 
-- restrição da chave estrangeira de uma tabela da outra tabela)

-- 2) LISTE TODOS OS DADOS DOS VENDORES E DE SEUS PEDIDOS - usando Where
select * from vendedor v , pedido p
	where v.codigo = p.codigo_ven;
     
-- 2.1) LISTE TODOS OS DADOS DOS VENDORES E DE SUES PEDIDOS - usando INNER JOIN
select * from vendedor v
	inner join pedido p
    on v.codigo = p.codigo_ven;
  
-- Restrição: Vai trazer os elementos da junção e mais a restrição 
-- da cláusula where

-- 3) LISTE TODOS OS DADOS DO VENDEDOR 'João' E DE SEUS PEDIDOS - usando inner join e where
select * from vendedor v
	inner join pedido p
	on v.codigo = p.codigo_ven
    where v.nome = "João";
    

-- 3.1) LISTE TODOS OS DADOS DO VENDEDOR 'João' E DE SEUS PEDIDOS - 2 condições no Where, ou seja where e and
select * from vendedor v, pedido p
	where v.codigo = p.codigo_ven and v.nome = "João";
-- 3.2) LISTE TODOS OS DADOS DO CLIENTE 'Pres. Prudente' E DE SEUS PEDIDOS - usando inner join e where
select * from cliente c 
	inner join pedido p 
    on c.codigo = p.codigo_cli
    where c.cidade = "Pres. Prudente";
 
-- 3.3) LISTE TODOS OS DADOS DO CLIENTE 'Pres. Prudente' E DE SEUS PEDIDOS - duas condições no Where, ou seja where e and
select * from cliente c, pedido p
	where c.codigo = p.codigo_cli and c.cidade = "Pres. Prudente";

-- 3.4) LISTE TODOS OS PEDIDOS DO VENDEDOR MARIA
select * from vendedor v, pedido p
	where v.codigo = p.codigo_ven and v.nome = "Maria";

-- Projeção: Não preciso de todos os atributos, então na select eu determino a projeção que eu quero

-- 4) LISTE TODOS OS DADOS DO VENDEDOR 'João', O CODIGO DO CLIENTE E A QUANTIDADE VENDIDA
select v.*, p.codigo_cli, p.quantidade
	from vendedor v
    inner join pedido p 
    on v.codigo = p.codigo_ven
    where v.nome = "João";
      
-- 4.1) LISTE TODOS OS DADOS DO VENDEDOR EM QUE O NOME INICIA POR J, O CODIGO DO CLIENTE E QUANTIDADE VENDIDA  
select v.*, c.codigo as codigo_cliente, p.quantidade
	from vendedor v
	inner join pedido p on v.codigo = p.codigo_ven
	inner join cliente c on p.codigo_cli = c.codigo
	where v.nome like 'J%';

-- 4.2) LISTE TODOS OS DADOS DO CLIENTE EM QUE O NOME INICIA POR S, NUMERO DO PEDIDO E QUANTIDADE VENDIDA
select c.*, p.numero, p.quantidade
	from cliente c
    inner join pedido p 
    on c.codigo = p.numero
    where c.nome like 'S%';

-- 5) Listar os pedidos, mostrando (NUMERO DO PEDIDO, NOME DO VENDEDOR, QUANTIDADE DO PEDIDO, CIDADE DO CLIENTE E TIPO DO CLIENTE, USE APELIDOS PARA 
-- AS TABELAS E ALTERE O NOME DE EXIBIÇÃO DOS ATRIBUTOS
select p.numero as numero_pedido, v.nome as nome_vendedor, p.quantidade as quantidade_pedido, c.cidade as cidade_cliente, c.tipo as tipo_cliente
	from pedido p 
    inner join vendedor v on p.codigo_ven = v.codigo
    inner join cliente c on p.codigo_cli = c.codigo;
   
-- 6) Listar todos os pedidos, ordenados pelo nome do vendedor, mostrando numero do pedido, nome do vendedor e cidade do cliente.
select p.numero as numero_pedido, v.nome as nome_vendedor, c.cidade as cidade_cliente
	from pedido p 
    inner join vendedor v on p.codigo_ven = v.codigo
    inner join cliente c on p.codigo_cli = c.codigo
    order by v.nome;

-- 7) Mostre todos os pedidos, do cliente 'Presidente Prudente', ordenados pelo nome do vendedor
select p.numero as numero_pedido, v.nome as nome_vendor, c.cidade as cidade_cliente
	from pedido p 
	inner join vendedor v on p.codigo_ven = v.codigo
	inner join cliente c on p.codigo_cli = c.codigo
	where c.cidade = "Pres. Prudente"
	order by v.nome;

-- 8) Listar todos as consultas, ordenadas pela data, 
-- mostrando o nome do paciente e do médico, ordenado pelo nome do paciente
#não existe estes dados 

-- 9) Mostre todos os pedidos do tipo 'Agronegócio', mostrando a cidade e ordenado pelo nome do vendedor
select p.numero as numero_pedido, v.nome as nome_vendedor, c.cidade as cidade_cliente
	from pedido p
	inner join vendedor v on p.codigo_ven = v.codigo
	inner join cliente c on p.codigo_cli = c.codigo
	where c.tipo = "Agronegócio"
	order by v.nome;

-- 10) Listar o número de pedidos de cada vendedor
select v.codigo, v.nome as nome_vendedor, count(p.numero) as quantidade_pedidos
	from vendedor v
	left join pedido p on v.codigo = p.codigo_ven
	group by v.codigo, v.nome;

-- 11) Listar o número de pedidos de cada cliente, ordenando pelo nome do cliente
select c.codigo, c.nome as nome_cliente, count(p.numero) as quantidade_pedidos
	from cliente c
	left join pedido p on c.codigo = p.codigo_cli
	group by c.codigo, c.nome
	order by c.nome;
     
-- 12) Listar o número de pedidos do vendedor 'KELLY'
select count(p.numero) as quantidade_pedidos
from pedido p 
inner join vendedor v on p.codigo_ven = v.codigo 
where v.nome = 'Kelly';
SELECT COUNT(p.numero) AS quantidade_pedidos
FROM pedido p
JOIN vendedor v ON p.codigo_ven = v.codigo
WHERE v.nome = 'Kelly';
   