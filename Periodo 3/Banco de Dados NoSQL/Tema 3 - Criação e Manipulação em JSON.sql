CREATE TABLE pedidos (
nrped serial PRIMARY KEY,
detalhes json NOT NULL
);

INSERT INTO pedidos (detalhes) VALUES

( '{"cliente": "Nei", "produto": "Produto_1", "qtd": 8, "peso": "1 kg"}' ) ,

( '{"cliente": "Rui", "produto": "Produto_2", "qtd": 9, "peso": "10 kg"}' ) ,

( '{"cliente": "Lia", "produto": "Produto_3", "qtd": 15, "peso": "200 gr"}' ) ,

( '{"cliente": "Lia", "produto": "Produto_4", "qtd": 25, "volume": 2, "cor": "azul"}' ) ,

( '{"cliente": "Ana", "produto": "Produto_5", "qtd": 35, "volume": 3, "cor": "verde"}' ) ,

( '{"cliente": "Lia", "produto": "Produto_6", "qtd": 45, "volume": 4, "cor": "branco"}' ) ,

( '{"cliente": "Rui", "produto":"Produto_7", "qtd":55, "comprimento": "30 cm"}' ) ,

( '{"cliente": "Lia", "produto":"Produto_8", "qtd":65, "comprimento": "4 m"}' );

SELECT * FROM pedidos;

-- Retornar 3 registros (limit 3) dos pares com chave cliente do atributo detalhes:
SELECT detalhes -> 'cliente' AS cliente
FROM pedidos limit 3;

-- Como os comandos distinct e order by não podem ser usados diretamente com json
-- Devemos fazer as consultas usando "->>" em lugar de "->" para habilitá-los:
SELECT distinct detalhes ->> 'cliente' AS cliente
FROM pedidos
ORDER BY 1;

-- Retorna registros de acordo com uma chave no atributo detalhe com uma valor informado:
SELECT * FROM pedidos
WHERE (detalhes ->> 'cliente'::text) = 'Lia';

-- Retorna os pares chave-valor de cada registro em linhas separadas:
SELECT json_each (detalhes) FROM pedidos
WHERE (detalhes ->> 'cliente'::text) = 'Lia';

-- Incluir uma lista(array) de pares chave-valor em um registro no JSON:
INSERT INTO pedidos(detalhes) VALUES
(
'{
"cliente":"Nei",
"itens":[
	{"produto":"Produto_1","qtd":2},
	{"produto":"Produto_2","qtd":3},
	{"produto":"Produto_3","qtd":4}
]
}'
);

-- Conferindo o registro acima inserido:
SELECT * FROM pedidos
WHERE nrped = 9

-- Retrnar só a chave itens do registro - lista de itens incluída no exemplo anterior:
SELECT detalhes -> 'itens' AS itens
FROM pedidos
WHERE nrped = 9;

-- Os scripts abaixo selecionam itens específicos dentro do array por seus indices:

-- 1o item do array:
SELECT detalhes -> 'itens' ->> 0 AS item
FROM pedidos
WHERE nrped = 9;

-- 2o item do array:
SELECT detalhes -> 'itens' ->> 1 AS item
FROM pedidos
WHERE nrped = 9;

-- 3o item do array:
SELECT detalhes -> 'itens' ->> 2 AS item
FROM pedidos
WHERE nrped = 9;

-- Verifica os tipos de dados nos valores dos pares no JSON  e dentro do array no JSON:
SELECT distinct json_typeof(detalhes) AS detalhes, json_typeof(detalhes -> 'itens') AS itens
FROM pedidos;