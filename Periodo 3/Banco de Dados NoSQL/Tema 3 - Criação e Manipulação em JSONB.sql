-- Criando uma Tabela com um Atributo JSONB:
CREATE TABLE filmes (
idfilme serial NOT NULL,
dados jsonb);

-- Inserindo registros na tabela criada:
INSERT INTO filmes (dados) VALUES
( '{ "titulo": "Filme_A", "generos": ["Curta", "Romance", "Terror"], "publicado": false }' ) ,
( '{ "titulo": "Filme_B", "generos": ["Marketing", "Auto-ajuda", "Psicologia"], "publicado": true }' ) ,
( '{ "titulo": "Filme_C", "generos": ["Justiça", "Política"], "autores": ["Ana","Nei"],"publicado" : true }' ) ,
( '{ "titulo": "Filme_D", "generos": ["Produtividade", "Tecnologia"]," publicado": true }' ) ,
( '{ "titulo": "Filme_E", "generos": ["Ficção", "Infanto-juvenil"], "publicado": true }' ) ;

-- Conferir os Registros:
SELECT * FROM filmes;

-- Listagem de titulos e generos em JSONB:
SELECT dados -> 'titulo' as titulo, dados -> 'generos' AS generos
FROM filmes 
ORDER BY 1;

-- Listagem de titulos e generos em Texto:
SELECT dados ->> 'titulo' as titulo, dados ->> 'generos' AS generos
FROM filmes
ORDER BY 1;

-- Obtendo registros em que uma chave booleana atende a um critério:
SELECT * FROM filmes 
WHERE dados->'publicado' = 'false';

-- Lista os itens de uma chave array em um registro especificado:
SELECT jsonb_array_elements_text(dados -> 'generos') AS genero
FROM filmes 
WHERE idfilme = 3; -- especificação do registro

-- Buscar registros na tabela buscando por um valor nas chaves array do atributo JSONB:
SELECT dados->'titulo' as titulo,dados->'generos' as generos 
FROM filmes
WHERE dados->'generos' @> '["Ficção"]'::jsonb; -- indica o valor a ser buscado nos arrays

-- Incluindo um novo registro:
INSERT INTO filmes (dados) VALUES
( '{ "titulo": "Filme_F", "generos": ["Curta", "Romance"], "publicado": false }' ) ;

-- Fazendo agora uma consulta com mais de um valor a ser buscado:
SELECT dados -> 'titulo' as titulo, dados -> 'generos'AS generos
FROM filmes
WHERE dados->'generos' @> '["Curta", "Romance"]'::jsonb; -- Indica mais de um valor

-- Conta quantos registros tem a chave 'autores' no atributo dados:
SELECT COUNT(*) as total 
FROM filmes 
WHERE dados ? 'autores';

-- Conta quantos registros tem a chave 'generos' no atributo dados:
SELECT COUNT(*) as total 
FROM filmes 
WHERE dados ? 'generos';

-- Apresenta uma visualização dos dados identados:
SELECT dados -> 'titulo' as titulo, dados -> 'generos'AS generos, jsonb_pretty(dados)
FROM filmes
order by 1 ;

-- Inclusão de Chave-Valor em um registro em JSONB:
UPDATE filmes
SET dados = dados || '{"ano":"2015"}'::jsonb -- chave-valor a ser incluído no registro
WHERE idfilme = 3 ;

-- Consultando os dados incluídos:
SELECT * FROM filmes
WHERE idfilme = 3;

-- Criando Indices GIN para otimizar pesquisas de pares de chave-valor:
CREATE INDEX idx_publicados ON filmes USING GIN ((dados ->'publicado'));

EXPLAIN SELECT * -- O comando EXPLAIN verifica qual indice está sendo utilizado
FROM filmes
WHERE (dados -> 'publicado')::jsonb @> 'true';

-- Executa uma consulta usando o indice:
SELECT *
FROM filmes
WHERE (dados -> 'publicado')::jsonb @> 'true'; -- retorna os registros publicado:true