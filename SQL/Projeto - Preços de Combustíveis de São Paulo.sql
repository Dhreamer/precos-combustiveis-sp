-- CRIAÇÃO DO SCHEMA PARA ARMAZENAR OS DADOS BRUTOS
CREATE SCHEMA dados_brutos;



-- CRIANDO A TABELA DE DADOS
CREATE TABLE dados_brutos.precos_combustiveis_2026_s1 (
	regiao_sigla TEXT,
	estado_sigla TEXT,
	municipio TEXT,
	revenda TEXT,
	cnpj_revenda TEXT,
	nome_rua TEXT,
	numero_rua TEXT,
	complemento TEXT,
	bairro TEXT,
	cep TEXT,
	produto TEXT,
	data_coleta TEXT,
	valor_venda TEXT,
	valor_compra TEXT,
	unidade_medida TEXT,
	bandeira TEXT
);


-- CONTANDO OS REGISTROS
SELECT COUNT (*) AS quantidade_registro
FROM dados_brutos.precos_combustiveis_2026_s1;



-------------------------------------------
---------PERFIL INICIAL DOS DADOS ---------
-------------------------------------------

-- 10 PRIMEIROS REGISTROS DA TABELA
SELECT *
FROM dados_brutos.precos_combustiveis_2026_s1
LIMIT 10;


-- QUANTIDADE DE REGISTROS
SELECT COUNT(*)
FROM dados_brutos.precos_combustiveis_2026_s1;


-- QUANTIDADE DE ESTADOS
SELECT DISTINCT (estado_sigla) 
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY estado_sigla;


-- NOMES PRODUTOS EXISTENTES, SEM REPETIR NOMES
SELECT DISTINCT (produto)
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY produto
ORDER BY produto DESC;


-- QUANTIDADE DE REGISTRO PARA CADA PRODUTO
SELECT
	produto,
	COUNT(produto) AS quantidade_de_produto
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY produto
ORDER BY quantidade_de_produto DESC;


--------------------------------------------
------ PERFIL DO RECORTE DE SÃO PAULO ------
--------------------------------------------

-- QUANTIDADE DE REGISTROS PERTENCENTES AO ESTADO DE SÃO PAULO
SELECT
	estado_sigla,
	COUNT (*) AS total_registros
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE estado_sigla = 'SP'
GROUP BY estado_sigla;


-- QUANTIDADE DE REGISTROS UNICOS DE MUNICÍPIOS
SELECT
	estado_sigla,
	COUNT (DISTINCT municipio) AS total_municipios
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY estado_sigla
HAVING estado_sigla = 'SP';


-- QUANTIDADE DE REVENDAS EXISTENTES ÚNICAS POR CNPJ NO ESTADO DE SÃO PAULO
SELECT
	estado_sigla,
	COUNT (DISTINCT cnpj_revenda) AS total_cnpj_revendas
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY estado_sigla
HAVING estado_sigla = 'SP';


-- PRODUTOS VENDIDOS NO ESTADO DE SÃO PAULO
SELECT
	DISTINCT produto
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE estado_sigla = 'SP'
ORDER BY produto;


-- QUANTIDADE DE REGISTROS PARA CADA PRODUTO NO ESTADO DE SÃO PAULO
SELECT
	estado_sigla,
	produto,
	COUNT (produto) AS total_registros
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY estado_sigla, produto
HAVING estado_sigla = 'SP' 
ORDER BY total_registros DESC;



-- VERIFICAÇÃO DE VALORES NULOS EM SÃO PAULO
SELECT
    COUNT(*) - COUNT(regiao_sigla) AS nulos_regiao,
    COUNT(*) - COUNT(estado_sigla) AS nulos_estado,
	COUNT(*) - COUNT(revenda) AS nulos_revenda,
	COUNT(*) - COUNT(municipio) AS nulos_municipio,
	COUNT(*) - COUNT(cnpj_revenda) AS nulos_cnpj_revenda,
	COUNT(*) - COUNT(nome_rua) AS nulos_nome_rua,
	COUNT(*) - COUNT(numero_rua) AS nulos_numero_rua,
	COUNT(*) - COUNT(complemento) AS nulos_complemento,
	COUNT(*) - COUNT(bairro) AS nulos_bairro,
	COUNT(*) - COUNT(cep) AS nulos_cep,
	COUNT(*) - COUNT(produto) AS nulos_produto,
	COUNT(*) - COUNT(data_coleta) AS nulos_data_coleta,
	COUNT(*) - COUNT(valor_venda) AS nulos_valor_venda,
	COUNT(*) - COUNT(valor_compra) AS nulos_valor_compra,
	COUNT(*) - COUNT(unidade_medida) AS nulos_unidade_medida,
	COUNT(*) - COUNT(bandeira) AS nulos_bandeira
FROM dados_brutos.precos_combustiveis_2026_s1;


-- VERIFICAÇÃO DE CAMPOS VAZIOS
SELECT
	COUNT(*) FILTER (WHERE regiao_sigla = '') AS vazios_regiao,
	COUNT(*) FILTER (WHERE estado_sigla = '') AS vazios_estado,
	COUNT(*) FILTER (WHERE municipio = '') AS vazios_municipio,
	COUNT(*) FILTER (WHERE revenda = '') AS vazios_revenda,
	COUNT(*) FILTER (WHERE cnpj_revenda = '') AS vazios_cnpj_revenda,
	COUNT(*) FILTER (WHERE nome_rua = '') AS vazios_nome_rua,
	COUNT(*) FILTER (WHERE numero_rua = '') AS vazios_numero_rua,
	COUNT(*) FILTER (WHERE complemento = '') AS vazios_complemento,
	COUNT(*) FILTER (WHERE bairro = '') AS vazios_bairro,
	COUNT(*) FILTER (WHERE cep = '') AS vazios_cep,
	COUNT(*) FILTER (WHERE produto = '') AS vazios_produto,
	COUNT(*) FILTER (WHERE data_coleta = '') AS vazios_data_coleta,
	COUNT(*) FILTER (WHERE valor_venda = '') AS vazios_valor_venda,
	COUNT(*) FILTER (WHERE valor_compra = '') AS vazios_valor_compra,
	COUNT(*) FILTER (WHERE unidade_medida = '') AS vazios_unidade_medida,
	COUNT(*) FILTER (WHERE bandeira = '') AS vazios_bandeira
FROM dados_brutos.precos_combustiveis_2026_s1;



-- VERIFICAÇÃO DE ESPAÇOS NO INÍCIO OU FINAL DOS TEXTOS
SELECT
	COUNT(*) FILTER (WHERE regiao_sigla <> TRIM (regiao_sigla)) AS espacos_regiao,
	COUNT(*) FILTER (WHERE estado_sigla <> TRIM (estado_sigla)) AS espacos_estado,
	COUNT(*) FILTER (WHERE municipio <> TRIM (municipio)) AS espacos_municipio,
	COUNT(*) FILTER (WHERE revenda <> TRIM (revenda)) AS espacos_revenda,
	COUNT(*) FILTER (WHERE cnpj_revenda <> TRIM (cnpj_revenda)) AS espacos_cnpj_revenda,
	COUNT(*) FILTER (WHERE nome_rua <> TRIM (nome_rua)) AS espacos_nome_rua,
	COUNT(*) FILTER (WHERE numero_rua <> TRIM (numero_rua)) AS espacos_numero_rua,
	COUNT(*) FILTER (WHERE complemento <> TRIM (complemento)) AS espacos_complemento,
	COUNT(*) FILTER (WHERE bairro <> TRIM (bairro)) AS espacos_bairro,
	COUNT(*) FILTER (WHERE cep <> TRIM (cep)) AS espacos_cep,
	COUNT(*) FILTER (WHERE produto <> TRIM (produto)) AS espacos_produto,
	COUNT(*) FILTER (WHERE data_coleta <> TRIM (data_coleta)) AS espacos_data_coleta,
	COUNT(*) FILTER (WHERE valor_venda <> TRIM (valor_venda)) AS espacos_valor_venda,
	COUNT(*) FILTER (WHERE valor_compra <> TRIM (valor_compra)) AS espacos_valor_compra,
	COUNT(*) FILTER (WHERE unidade_medida <> TRIM (unidade_medida)) AS espacos_unidade_medida,
	COUNT(*) FILTER (WHERE bandeira <> TRIM (bandeira)) AS espacos_bandeira
FROM dados_brutos.precos_combustiveis_2026_s1;


-- VERIFICAÇÃO DE ESPAÇOS CONSECUTIVOS NO INTERIOR DOS VALORES
SELECT
	COUNT(*) FILTER (WHERE regiao_sigla LIKE '%  %') AS espacos_duplos_regiao,
	COUNT(*) FILTER (WHERE estado_sigla LIKE '%  %') AS espacos_duplos_estado,
	COUNT(*) FILTER (WHERE municipio LIKE '%  %') AS espacos_duplos_municipio,
	COUNT(*) FILTER (WHERE revenda LIKE '%  %') AS espacos_duplos_revenda,
	COUNT(*) FILTER (WHERE cnpj_revenda LIKE '%  %') AS espacos_duplos_cnpj_revenda,
	COUNT(*) FILTER (WHERE nome_rua LIKE '%  %') AS espacos_duplos_nome_rua,
	COUNT(*) FILTER (WHERE numero_rua LIKE '%  %') AS espacos_duplos_numero_rua,
	COUNT(*) FILTER (WHERE complemento LIKE '%  %') AS espacos_duplos_complemento,
	COUNT(*) FILTER (WHERE bairro LIKE '%  %') AS espacos_duplos_bairro,
	COUNT(*) FILTER (WHERE cep LIKE '%  %') AS espacos_duplos_cep,
	COUNT(*) FILTER (WHERE produto LIKE '%  %') AS espacos_duplos_produto,
	COUNT(*) FILTER (WHERE data_coleta LIKE '%  %') AS espacos_duplos_data_coleta,
	COUNT(*) FILTER (WHERE valor_venda LIKE '%  %') AS espacos_duplos_valor_venda,
	COUNT(*) FILTER (WHERE valor_compra LIKE '%  %') AS espacos_duplos_valor_compra,
	COUNT(*) FILTER (WHERE unidade_medida LIKE '%  %') AS espacos_duplos_unidade_medida,
	COUNT(*) FILTER (WHERE bandeira LIKE '%  %') AS espacos_duplos_bandeira
FROM dados_brutos.precos_combustiveis_2026_s1;



-- REVENDAS COM ESPAÇOS DUPLICADOS NO MEIO DO NOME
SELECT DISTINCT revenda
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE revenda LIKE '%  %';

-- NOME_RUA COM ESPAÇOS DUPLICADOS NO MEIO DO NOME
SELECT DISTINCT nome_rua
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE nome_rua LIKE '%  %';

-- COMPLEMENTO COM ESPAÇOS DUPLICADOS NO MEIO DO NOME
SELECT DISTINCT complemento
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE complemento LIKE '%  %';

-- BAIRRO COM ESPAÇOS DUPLICADOS NO MEIO DO NOME
SELECT DISTINCT bairro
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE bairro LIKE '%  %';



-- IDENTIFICAÇÃO DE POSSÍVEIS DUPLICIDADES PELA CHAVE DA COLETA
SELECT
	cnpj_revenda,
	produto,
	data_coleta,
	COUNT (*) AS quantidade_registros
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY cnpj_revenda, produto, data_coleta
HAVING COUNT(*) > 1
ORDER BY quantidade_registros DESC;

-- INSPEÇÃO E CONFIRMAÇÃO DOS REGISTROS DUPLICADOS
SELECT *
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE cnpj_revenda LIKE '%07.663.077/0001-90%' AND data_coleta IN ('16/02/2026', '18/02/2026')
ORDER BY data_coleta, produto;



-- VALIDAÇÃO DO FORMATO E PERÍODO DAS DATAS
SELECT
	COUNT(DISTINCT data_coleta) AS dias_unicos,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/__/____') AS registros_formato_correto,
	COUNT(*) FILTER(WHERE data_coleta LIKE '%2026%') AS registros_2026,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/01/2026') AS registros_janeiro,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/02/2026') AS registros_fevereiro,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/03/2026') AS registros_marco,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/04/2026') AS registros_abril,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/05/2026') AS registros_maio,
	COUNT(*) FILTER(WHERE data_coleta LIKE '__/06/2026') AS registros_junho
FROM dados_brutos.precos_combustiveis_2026_s1;


-- VALIDAÇÃO DOS PREÇOS E DAS UNIDADES DE MEDIDA
SELECT
	COUNT(*) FILTER (WHERE valor_venda LIKE '%,__') AS preco_no_padrao
FROM dados_brutos.precos_combustiveis_2026_s1
ORDER BY preco_no_padrao DESC;

-- VALIDAÇÃO UNIDADES DE MEDIDAS ÚNICAS
SELECT
	DISTINCT unidade_medida AS medidas_unicas
FROM dados_brutos.precos_combustiveis_2026_s1;

-- QUANTIDADE DE REGISTROS DE CADA UNIDADE DE MEDIDA
SELECT
	unidade_medida,
	COUNT(unidade_medida) AS quantidade_unidades
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY unidade_medida;


-- UNIDADES ASSOCIADAS AOS PRODUTOS
SELECT
	unidade_medida,
	produto
FROM dados_brutos.precos_combustiveis_2026_s1
GROUP BY produto, unidade_medida;

-- CONTAGEM DISTINTA DE REVENDA
SELECT
	COUNT(DISTINCT TRIM(cnpj_revenda))
FROM dados_brutos.precos_combustiveis_2026_s1
WHERE estado_sigla = 'SP';


-- CONTAGEM DISTINTA DE BANDEIRA
SELECT
	COUNT(DISTINCT TRIM(bandeira))
FROM dados_brutos.precos_combustiveis_2026_s1;


SELECT *
FROM dados_brutos.precos_combustiveis_2026_s1;

