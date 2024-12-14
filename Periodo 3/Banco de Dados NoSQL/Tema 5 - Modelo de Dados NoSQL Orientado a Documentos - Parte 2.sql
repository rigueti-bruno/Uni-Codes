-- Conferindo as tabelas existentes no Banco de Dados:
SELECT * FROM pg_catalog.pg_tables WHERE schemaname='public';

-- Criando uma Tabela Socio:
CREATE TABLE socio (
idsocio SERIAL NOT NULL,
nome VARCHAR,
endereco VARCHAR,
telefone INT,
email VARCHAR,
PRIMARY KEY(idsocio));

-- Tabela editora
CREATE TABLE editora (
ideditor SERIAL NOT NULL,
nome VARCHAR,
PRIMARY KEY(ideditor));

-- Tabela autor
CREATE TABLE autor (
idautor SERIAL NOT NULL,
nome VARCHAR,
PRIMARY KEY(idautor));

-- Tabela titulos
CREATE TABLE titulos (
isbn SERIAL NOT NULL ,
editora_ideditor INTEGER NOT NULL,
titulo INTEGER,
PRIMARY KEY(isbn),
FOREIGN KEY(editora_ideditor) REFERENCES editora(ideditor));

-- Tabela exemplar
CREATE TABLE exemplar (
idlivro SERIAL NOT NULL,
Titulos_isbn INTEGER NOT NULL,
data_entrada DATE,
edicao INTEGER,
PRIMARY KEY(idlivro),
FOREIGN KEY(Titulos_isbn) REFERENCES Titulos(isbn));

-- Tabela livro
CREATE TABLE livro (
titulos_isbn INTEGER NOT NULL,
paginas INTEGER,
peso NUMERIC,
PRIMARY KEY(titulos_isbn),
FOREIGN KEY(titulos_isbn) REFERENCES titulos(isbn));

-- Tabela emprestimo
CREATE TABLE emprestimo (
idemprestimo SERIAL NOT NULL,
socio_idsocio INTEGER NOT NULL,
exemplar_idlivro INTEGER NOT NULL,
data_emp DATE,
data_devolucao DATE,
multa NUMERIC(7,2),
data_reserva DATE,
PRIMARY KEY(idemprestimo),
FOREIGN KEY(exemplar_idlivro) REFERENCES exemplar(idlivro),
FOREIGN KEY(socio_idsocio) REFERENCES socio(idsocio));

-- Tabela produz
CREATE TABLE produz (
titulos_isbn INTEGER NOT NULL,
autor_idautor INTEGER NOT NULL,
PRIMARY KEY(titulos_isbn, autor_idautor),
FOREIGN KEY(titulos_isbn) REFERENCES titulos(isbn),
FOREIGN KEY(autor_idautor) REFERENCES autor(idautor));

-- Tabela cliente
CREATE TABLE cliente(
idcliente SERIAL PRIMARY KEY, 
data JSONB);

-- Inluindo Dados de Clientes:
INSERT INTO cliente (data) VALUES
(' { "nome" : "Ana" , "rua" : "Rua A" , "nr" : 1 , "complemento" : "101" , "bairro" : "Centro" , "cidade" : "Rio" , "estado" : "RJ", "email" : "ana@mail.com" }'::JSONB),
(' { "nome" : "Rui", "rua" : "Rua B", "nr" : 2 , "complemento" : "102", "bairro" : "Centro" , "cidade" : "Rio" , "estado" : "RJ" , "email" : "ana@mail.com" }'::JSONB),
(' { "nome" : "Nei" , "rua" : "Rua C" , "nr" : 3 , "complemento" : "103" , "bairro" : "Centro" , "cidade" : "Rio" , "estado" : "RJ" , "email" : "ana@mail.com" }'::JSONB);

-- Conferindo os registros incluídos:
SELECT * FROM cliente;

-- Criando a Tabela de Locações:
CREATE TABLE locacao(
nrlocacao SERIAL PRIMARY KEY,
data JSONB,
cliente_idcliente INTEGER REFERENCES cliente(idcliente));

-- Incluindo registros de locações:
INSERT INTO locacao (data,cliente_idcliente) VALUES
('{"data_locacao":"2019-06-06","data_devolucao":"2019-06-08","preco":"20.00","categoria":"romance","titulo":"Titulo A"}'::JSONB,1),
('{"data_locacao":"2019-06-07","data_devolucao":"2019-06-09","preco":"10.00","categoria":"humor","titulo":"Titulo B"}'::JSONB,1),
('{"data_locacao":"2019-06-08","data_devolucao":"2019-06-10","preco":"15.00","categoria":"aventura","titulo":"Titulo C"}'::JSONB,2),
('{"data_locacao":"2019-06-09","data_devolucao":"2019-06-11","preco":"17.00","categoria":"ficção","titulo":"Titulo D"}'::JSONB,2),
('{"data_locacao":"2019-06-10","data_devolucao":"2019-06-12","preco":"20.00","categoria":"humor","titulo":"Titulo E"}'::JSONB,2);

-- Conferindo os títulos no JSONB:
select data->>'titulo' from locacao;

-- Extraindo os registros das locações na forma de Documentos:
--cria a tabela temporária

WITH cliente_locacao AS
--agrupa os livros por autor
(SELECT c.data AS cliente,json_agg(l.data) AS locacao
FROM cliente c LEFT JOIN locacao l
ON c.idcliente = l.cliente_idcliente
WHERE l.cliente_idcliente is not NULL
GROUP BY 1)
--aplicação da função jsonb_pretty() sobre a tabela temporária para apresentar os documentos indentados:
SELECT jsonb_pretty(cliente || jsonb_build_object('locacao', locacao))AS locacao
FROM cliente_locacao;