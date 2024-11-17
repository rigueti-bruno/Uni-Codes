-- Executando Consultas Simples

-- 1 - tipo hstore:

-- Listar uma cheve específica:
SELECT detalhes -> 'idioma' AS "Idioma"
FROM livros;

-- Selecionar um registro informando uma parte de uma chave como condição:
SELECT *
FROM livros
WHERE detalhes -> 'ISBN' = '1788472292';

-- Busca a partir de uma parte do valor da chave:
SELECT *
FROM livros
WHERE detalhes -> 'ISBN' ILIKE '%88%';

-- Listar somente as chaves:
SELECT distinct akeys(detalhes)
FROM livros
ORDER BY 1;

-- Listar as chaves no formato de conjunto e eliminando as chaves repetidas:
SELECT distinct skeys(detalhes) AS Chaves
FROM livros;

-- Listar apenas os valores nas chaves:
SELECT distinct avals(detalhes) AS detalhes
FROM livros;

-- Lista os valores no formato de conjunto de um registro específico:
SELECT distinct svals(detalhes) AS detalhes
FROM livros
WHERE detalhes -> 'ISBN' = '1788472292';

-- Especifica uma chave a ser buscada no atributo hstore e retorna os registros com ela:
SELECT *
FROM livros
WHERE detalhes ? 'ISBN-13';

-- Localizar um registro baseado em um par chave-valor no atributo:
SELECT titulo -- a consulta retornará o atributo titulo do registro
FROM livros
WHERE detalhes @> '"peso"=>"798 g"'::hstore;

-- Conversão do atributo hstore para JSON:
SELECT hstore_to_json(detalhes) json
FROM livros;

-- Conversão do atributo hstore para sets(conjuntos):
SELECT titulo,(EACH(detalhes)).*
FROM livros;

SELECT * FROM livros;

-- Exemplo - Questão 3:
CREATE TABLE pedidos (
nrped serial primary key,
detalhes json not null
);

INSERT INTO pedidos(detalhes) VALUES
('{"cliente":"Nei","produto":"Smartphone Xiaomi","qtd":8}'),
('{"cliente":"Rui","produto":"Tablet Samsung","qtd":9}'),
('{"cliente":"Lia","produto":"Smartphone iPhone","qtd":5,"peso":194}');

SELECT * FROM pedidos;