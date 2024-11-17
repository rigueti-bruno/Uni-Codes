-- Criação da Tabela books:
CREATE TABLE books (
nr serial primary key,
titulo varchar(255),
detalhes json
);

-- Visualização da Tabela criada:
SELECT * FROM books;

-- Incluindo o Primeiro Registro:
INSERT INTO books (titulo,detalhes) VALUES (
'Mastering PostgreSQL 10',
-- O bloco abaixo representa o atributo no formato JSON:
'{
"paginas":428,
"peso":"798 g",
"ISBN":"1788472292",
"idioma":"inglês",
"assunto":"PostgreSQL",
"ISBN-13":"978-1788472296"
}'
);

-- Abaixo segue a inserção de um novo registro com estrutura diferente nos chave-valor:
INSERT INTO books (titulo,detalhes) VALUES (
'NOSQL Essencial: Um guia conciso para o mundo emergente de Persistência Poligrlota',
'{"pagins":216,
"publicador":"Novatec",
"idioma":"português",
"ISBN":"8575223380",
"peso":"381 g",
"ISBN-13":"978-1788472296"
}');

-- Atualização dos detalhes de um registro com REPLACE():
UPDATE books
SET detalhes = REPLACE(detalhes::text,'"paginas":428'::text,'"paginas":429'::text)::json
WHERE detalhes ->> 'ISBN' = '1788472292';