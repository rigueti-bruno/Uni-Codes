-- Database: postgres

-- DROP DATABASE IF EXISTS postgres;

CREATE DATABASE postgres
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
-- Habilitando a Extensão HSTORE para armazenar dados não estruturados:
CREATE EXTENSION hstore;

-- Criando uma tabela que recebetá dados não estruturados no atributo detalhes:
create table livros (
	nr serial primary key,
	titulo varchar(255),
	detalhes hstore);

-- Inserindo um registro na tabela criada:
insert into livros(titulo,detalhes) values
('Mastering PostgreSQL 10',
'
"paginas" => 428,
"assunto" => "PostgreSQL",
"idioma" => "inglês",
"ISBN" => "1788472292",
"ISBN-13" => "978-1788472296",
"peso" => "798 g"
');

insert into livros(titulo,detalhes) values
('NOSQL Essencial: Um Guia Conciso para o Mundo Emergente da Persistência Poliglota',
'
"paginas" => 216,
"publicador" => "Novatec",
"idioma" => "português",
"ISBN" => "8575223380",
"peso" => "381 g"
');

-- Alterando um valor no registro de dados não estruturados:
update livros
set detalhes = replace(detalhes::text,'"paginas"=>"428"'::text,'"paginas"=>"429"'::text)::hstore
where detalhes ->'ISBN' = '1788472292'

-- Localizando o registro pelo valor de um par chave-valor no atributo detalhes:
select * from livros
where detalhes -> 'ISBN' = '1788472292';
