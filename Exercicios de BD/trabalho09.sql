CREATE DATABASE ANIVERSARIOS;

USE aniversarios;

CREATE TABLE torneios (
codigoTorneio INT NOT NULL,
nome VARCHAR(30),
vitorias REAL,
melhor REAL,
tamanho REAL,
PRIMARY KEY (codigoTorneio)
);

INSERT INTO torneios (codigoTorneio, nome, vitorias, melhor, tamanho)
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



SELECT * FROM torneios; /* seleciona todos os dados da tabela torneio  */

SELECT nome, melhor FROM torneios; /* seleciona o nome e a melhor pontuação dos jogadores na tabela torneios */

SELECT SUM(vitorias), AVG(tamanho) FROM torneios; /* seleciona a quantidade de vitorias e o tamanho médio dos torneios na tabela torneios */

SELECT * FROM refeicoes WHERE nome = 'Dolly'; /* seleciona os dados de refeição de Dolly */

SELECT nome, entrada, sobremesa FROM refeicoes WHERE sobremesa = 'ice cream'; /* seleciona o nome, a entrada e a sobremesa das pessoas na tabela refeicoes que escolheram sorvete como sobremesa */

SELECT * FROM torneios WHERE nome = 'Gladys' AND vitorias > 0; /* seleciona quantidade de torneios ganho por Gladys */

SELECT * FROM refeicoes WHERE acompanhamento = 'fries'; /* seleciona refeicoes que tiverevam como acompanhapamento batata frita */

SELECT AVG(tamanho) AS media_tamanho FROM torneios;  /* seleciona a média do tamanho de torneios */

SELECT nome, vitorias, melhor FROM torneios WHERE codigoTorneio = '03'; /* Seleciona o nome, vitorias e melhor desempenho dos jogadores no torneio com código 03 */





