# Preços de Combustíveis em São Paulo | SQL e Power BI

Projeto pessoal desenvolvido para analisar os preços dos combustíveis em São Paulo durante o **primeiro semestre de 2026**, utilizando dados públicos da **Agência Nacional do Petróleo, Gás Natural e Biocombustíveis — ANP**.

Neste projeto, trabalhei com o processo completo de análise: obtenção dos dados, importação no PostgreSQL, exploração com SQL, tratamento no Power Query, modelagem, criação de medidas em DAX e construção do relatório no Power BI.

## Contexto e objetivo

O objetivo foi transformar os registros da pesquisa de preços em um relatório que permitisse acompanhar a evolução dos valores e comparar o mesmo combustível entre bandeiras, municípios e revendas.

Mantive a base nacional no PostgreSQL e utilizei filtros para analisar São Paulo, preservando os dados originais para consulta.

## Perguntas respondidas

- Como os preços evoluíram ao longo dos meses?
- Quais bandeiras apresentaram menores preços médios para o produto selecionado?
- Quais municípios apresentaram maiores e menores preços médios?
- Quais preços foram registrados em cada revenda e data?
- Quantos registros, municípios e estabelecimentos estão presentes no recorte analisado?

## Dados utilizados

Os arquivos foram obtidos na [Série Histórica de Preços de Combustíveis da ANP](https://www.gov.br/anp/pt-br/centrais-de-conteudo/dados-abertos/serie-historica-de-precos-de-combustiveis).

A base nacional original possui **422.418 registros**. Após o tratamento de duplicatas, passou a ter **422.412 registros**.

No recorte de São Paulo, foram identificados:

| Informação | Quantidade |
|---|---:|
| Registros de preços | 117.616 |
| Municípios | 100 |
| Revendas distintas por CNPJ | 2.599 |
| Produtos | 6 |

Os produtos analisados são diesel, diesel S10, etanol, gasolina, gasolina aditivada e GNV.

## Como o projeto foi desenvolvido

### 1. Exploração e verificação com SQL

Importei o CSV no PostgreSQL e conferi a quantidade de registros. Depois, analisei a distribuição por estado, município, produto e período.

Também verifiquei campos nulos, textos vazios, espaços excedentes, possíveis duplicatas, formatos de datas, preços e unidades de medida.

### 2. Tratamento no Power Query

No Power Query, removi espaços excedentes, padronizei os textos, tratei duplicatas e ajustei os tipos de dados.

Mantive CNPJ e CEP como texto e converti as datas e os preços para os tipos adequados. Ao final, conferi novamente a quantidade de registros.

### 3. Modelagem de dados

Organizei o modelo com uma tabela fato de preços e dimensões de data, produto, bandeira e revenda.

Também criei uma tabela separada para reunir as medidas, organizadas em pastas conforme sua finalidade.

![Modelo de dados do projeto](./Imagens/Modelo%20de%20dados.jpg)

### 4. DAX

Criei medidas para calcular preços médios, mínimos e máximos, contagens, diferenças e variações mensais.

Os indicadores respondem aos filtros aplicados, permitindo analisar diferentes produtos, períodos e localidades.

### 5. Dashboard

O relatório foi organizado em uma capa e quatro páginas analíticas:

- **Visão Geral:** indicadores principais, evolução mensal dos preços e cobertura da pesquisa.
- **Comparativo:** preços médios e quantidade de registros por bandeira.
- **Municípios:** rankings de maiores e menores preços médios e detalhamento por município.
- **Revendas:** consulta dos preços por estabelecimento, produto e data.

Também configurei três páginas de dicas de ferramenta — tooltips — para complementar as análises de tempo, município e bandeira.

## Páginas do relatório

### Início

![Capa do relatório de preços de combustíveis](./Imagens/Tela%20In%C3%ADcio.jpg)

### Visão Geral

![Visão Geral dos preços de combustíveis](./Imagens/Tela%20Vis%C3%A3o%20Geral.jpg)

### Comparativo

![Comparativo de preços e registros entre bandeiras](./Imagens/Tela%20Comparativo.jpg)

### Municípios

![Análise dos preços por município](./Imagens/Tela%20Munic%C3%ADpios.jpg)

### Revendas

![Consulta de preços por revenda](./Imagens/Tela%20Revendas.jpg)

### Dicas de ferramenta

#### Tempo

![Tooltip de análise temporal](./Imagens/Tooltip%20Tempo.jpg)

#### Município

![Tooltip de análise por município](./Imagens/Tooltip%20Munic%C3%ADpios.jpg)

#### Bandeira

![Tooltip de análise por bandeira](./Imagens/Tooltip%20Bandeira.jpg)

## Ferramentas utilizadas

- PostgreSQL e pgAdmin
- SQL
- Power BI Desktop
- Power Query
- DAX

## Organização dos arquivos

- **[Dashboard](./Dashboard/):** relatório em formato `.pbix`.
- **[SQL](./SQL/):** consultas utilizadas na exploração e verificação dos dados.
- **[Dados](./Dados/):** arquivos de origem e metadados.
- **[Imagens](./Imagens/):** capturas das páginas e do modelo de dados.

## Arquivos do projeto

- [Arquivo do relatório em Power BI](./Dashboard/Projeto%20-%20Pre%C3%A7os%20de%20Combust%C3%ADveis%20de%20S%C3%A3o%20Paulo.pbix)
- [Consultas SQL](./SQL/Projeto%20-%20Pre%C3%A7os%20de%20Combust%C3%ADveis%20de%20S%C3%A3o%20Paulo.sql)
- [Arquivo de dados da ANP em ZIP](./Dados/ca-2026-01.zip)
- [Metadados da ANP](./Dados/metadados-serie-historica-precos-combustiveis-1.pdf)

## Como abrir o projeto

1. Baixe o arquivo `.pbix` disponível na pasta **Dashboard**.
2. Abra o arquivo no **Power BI Desktop**.
3. Navegue pelas páginas, filtros e dicas de ferramenta do relatório.

> Para atualizar os dados, é necessário configurar a conexão com o PostgreSQL no seu ambiente. A conexão original utiliza um banco local.

## Aprendizados

Com este projeto, pratiquei a integração entre SQL e Power BI e a conferência dos dados antes da construção dos indicadores.

Também aprofundei meu entendimento sobre granularidade, relacionamentos, contexto de filtro e organização das informações para facilitar a leitura do relatório.

## Observações sobre a análise

Os dados representam **preços pesquisados**, não volumes vendidos ou faturamento dos postos.

O GNV utiliza **R$/m³**, enquanto os demais combustíveis utilizam **R$/litro**. As comparações de preços devem considerar o mesmo produto e período.

O relatório apresenta os municípios e estabelecimentos presentes na pesquisa utilizada, sem representar todos os postos de São Paulo.
