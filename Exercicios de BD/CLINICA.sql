
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










/*INSERT INTO torneios (codigoTorneio, nome, vitorias, melhor, tamanho)
VALUES ('01', 'Dolly', '7', '245', '8.5'),
('02', 'Etta', '4', '283', '9'),
('03', 'Irma', '9', '266', '7'),
('04', 'Barbara', '2', '197', '7.5'),
('05', 'Gladys', '13', '273', '8');

CREATE TABLE refeicoes ( 
codigoNome INT NOT NULL,
nome VARCHAR(30), 
data_nascimento DATE, 
entrada VARCHAR(30), 
acompanhamento VARCHAR(30), 
sobremesa VARCHAR(30),
PRIMARY KEY (codigoNome)
);

INSERT INTO refeicoes (codigoNome, nome, data_nascimento, entrada, acompanhamento, sobremesa) 
VALUES ('01', 'Dolly', '1946-01-19', 'steak', 'salad', 'cake'), 
('02', 'Etta', '1938-01-25', 'chicken', 'fries', 'ice cream'), 
('03', 'Irma', '1941-02-18', 'tofu', 'fries', 'cake'), 
('04', 'Barbara', '1948-12-25', 'tofu', 'salad', 'ice cream'), 
('05', 'Gladys', '1944-05-28', 'steak', 'fries', 'ice cream');

SELECT nome FROM refeicoes;

SELECT codigoNome, nome, data_nascimento FROM refeicoes;

SELECT * FROM torneios;

SELECT tamanho FROM torneios WHERE nome = 'Irma';

SELECT entrada FROM refeicoes WHERE entrada LIKE 't%';

SELECT nome AS n, data_nascimento AS d, sobremesa AS s FROM refeicoes;

SELECT COUNT(entrada) FROM refeicoes WHERE entrada = 'tofu';

SELECT AVG(melhor) FROM torneios;

SELECT SUM(vitorias) FROM torneios;

SELECT SUM(entrada) FROM refeicoes;

SELECT MIN(vitorias) FROM torneios;

SELECT MAX(vitorias) FROM torneios;

SELECT MIN(nome) FROM refeicoes;

SELECT MAX(nome) FROM refeicoes;

SELECT COUNT(nome), entrada FROM refeicoes GROUP BY entrada;

SELECT nome, data_nascimento FROM refeicoes ORDER BY data_nascimento;

SELECT nome, data_nascimento FROM refeicoes ORDER BY data_nascimento DESC;

SELECT COUNT(nome), acompanhamento FROM refeicoes WHERE COUNT(nome) >= 3;

SELECT COUNT(nome), acompanhamento FROM refeicoes GROUP BY acompanhamento HAVING COUNT(nome) >= 3;

SELECT torneios.codigoTorneio, torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
JOIN refeicoes ON torneios.nome=refeicoes.nome;

INSERT INTO torneios (codigoTorneio, nome, vitorias, melhor, tamanho) 
VALUES ('12', 'Bettye', '0', '193', '9');

INSERT INTO refeicoes (codigoNome, nome, data_nascimento, entrada, acompanhamento, sobremesa) 
VALUES ('10', 'Lesley', '1946-05-02', 'steak', 'salad', 'ice cream');

SELECT torneios.codigoTorneio, torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
JOIN refeicoes ON torneios.nome=refeicoes.nome;

SELECT torneios.codigoTorneio, torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
LEFT JOIN refeicoes ON torneios.nome=refeicoes.nome;

SELECT torneios.codigoTorneio, torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
RIGHT JOIN refeicoes ON torneios.nome=refeicoes.nome;

SELECT nome FROM torneios UNION SELECT nome FROM refeicoes;

SELECT nome FROM torneios UNION ALL SELECT nome FROM refeicoes;

SELECT nome FROM refeicoes UNION SELECT nome, vitorias FROM torneios;

SELECT nome, vitorias FROM torneios 
WHERE vitorias > (
SELECT vitorias FROM torneios WHERE nome = 'Barbara'
);

SELECT nome, tamanho FROM torneios AS t 
WHERE vitorias > (
SELECT AVG(vitorias) FROM torneios WHERE tamanho = t.tamanho
);

SELECT nome, entrada, acompanhamento, sobremesa 
FROM refeicoes 
WHERE nome = (SELECT nome FROM torneios 
WHERE vitorias = (SELECT MAX(vitorias) FROM torneios));
*/