
<div>

<h1>Análise de Desempenho Comercial e Oportunidades de Receita</h1>

<h2>Contexto</h2>

<p>Esta análise tem como base o dataset TheLook E-commerce, disponibilizado no Google BigQuery, que reúne dados históricos de uma operação de comércio varejista mundial.</p>

<p>A partir dos dados disponíveis desde 2019, será realizada uma análise do desempenho financeiro ao longo do período estudado. O objetivo inicial é compreender como as vendas se comportam em diferentes períodos e dimensões do negócio, utilizando os dados para construir uma visão mais ampla da operação.</p>
</p>

<h2>Problema de negócio</h2>

<p>A evolução da receita, quando analisada isoladamente, não permite compreender todo o contexto do desempenho comercial da operação.</p>

<p>Para obter uma visão mais ampla, é necessário analisar diferentes dimensões dos dados e compreender como elas se relacionam com os resultados observados.</p>

<p>A partir disso, o projeto busca estruturar uma análise que permita compreender o desempenho comercial da operação de forma integrada, utilizando os dados históricos disponíveis.</p>

<h2>Pergunta central</h2>

<p>Quais fatores explicam o desempenho comercial da empresa e onde estão as principais oportunidades de crescimento e geração de receita?</p>

<h2>Objetivo da análise</h2>

<p>Avaliar o desempenho comercial da operação a partir dos dados históricos disponíveis, investigando diferentes dimensões das vendas para identificar os fatores relacionados aos resultados observados.</p>

<p>A análise busca transformar os dados em informações que contribuam para uma compreensão mais ampla do desempenho da operação e para a identificação de possíveis oportunidades a partir das evidências encontradas nos dados.</p>

<h2>Abordagem da análise</h2>

<p>Para responder à pergunta central, a análise foi estruturada a partir de diferentes perspectivas do desempenho comercial da operação.</p>

<p>Primeiramente, foi analisada a evolução das vendas ao longo do tempo, buscando compreender o comportamento da receita e dos principais indicadores comerciais durante o período analisado.</p>

<p>Em seguida, a análise foi direcionada para os fatores relacionados à geração de receita, avaliando a contribuição das diferentes categorias de produtos e seu desempenho em relação à lucratividade.</p>

<p>Também foi analisado o comportamento dos clientes, com foco na identificação de padrões de compra e na representatividade dos clientes que realizaram apenas uma compra.</p>

<p>A dimensão geográfica foi utilizada para compreender a distribuição das vendas entre os estados e avaliar as diferenças de desempenho entre as regiões.</p>

<p>Por fim, foram analisados os status dos pedidos, buscando compreender seu impacto sobre os valores movimentados pela operação.</p>

<p>A combinação dessas perspectivas permite construir uma visão integrada do desempenho comercial, utilizando os dados para investigar as questões levantadas pela pergunta central.</p>

<h2>Análise</h2>

<h3>1. Evolução do desempenho comercial</h3>

<p>A primeira etapa da análise busca compreender como o desempenho comercial da operação se comportou ao longo do período estudado.</p>

<p>Para responder a essa questão, foram analisados a evolução mensal da receita, o volume de pedidos, a quantidade de clientes e o ticket médio, além das variações de receita em relação ao mês anterior (MoM) e ao mesmo período do ano anterior (YoY).</p>

<img width="965" height="408" alt="faturamento x tempo" src="https://github.com/user-attachments/assets/991fd7e3-00ba-4cb9-9d96-164b11b19320" />

<h3>2. Categorias e geração de resultado</h3>

<p>Após compreender a evolução das vendas, a análise busca identificar como as diferentes categorias de produtos contribuem para o desempenho da operação.</p>

<p>A análise compara a participação das categorias no faturamento com seu desempenho em lucratividade, permitindo avaliar a composição do resultado comercial.</p>

<img width="748" height="481" alt="receita x categoria" src="https://github.com/user-attachments/assets/2f77b8c5-228d-4d61-aa44-c4a7f7fd5018" />

<h3>3. Comportamento dos clientes</h3>

<p>A análise também considera o comportamento de compra dos clientes, buscando compreender sua participação na geração de receita.</p>

<p>A partir dessa perspectiva, são avaliados o número de clientes nessa condição, a receita associada a esse grupo, seu ticket médio e as categorias de produtos mais adquiridas.</p>

<img width="931" height="56" alt="cliente 1 compra" src="https://github.com/user-attachments/assets/1b628913-7898-4edf-a603-77fab038471c" />


<h3>4. Distribuição geográfica</h3>

<p>A dimensão geográfica permite avaliar como as vendas estão distribuídas entre os diferentes estados da operação.</p>

<p>Para essa análise, são considerados receita, pedidos, clientes, ticket médio e participação de cada estado nos resultados da operação.</p>

<img width="1056" height="378" alt="Geografico" src="https://github.com/user-attachments/assets/dbfa064a-415e-4c35-9762-991062d382a4" />


<h3>5. Status dos pedidos</h3>

<p>A última perspectiva analisa a distribuição dos pedidos de acordo com seus respectivos status e os valores associados a cada situação.</p>

<p>Essa análise busca identificar como os diferentes status se relacionam com os valores movimentados pela operação e quais situações merecem maior atenção na avaliação do desempenho comercial.</p>

<img width="769" height="81" alt="valor perdido" src="https://github.com/user-attachments/assets/586de470-c353-4488-844b-f1e4ed563dab" />


</div>

<h2>Principais Insights da Análise</h2>
<h3>Evolução das vendas</h3>
<p>O aumento da receita no ano de 2026 foi muito superior ao observado em 2025, porém o ticket médio manteve-se, na maior parte do período, relativamente estável. Isso demonstra que o crescimento da receita foi impulsionado principalmente pelo aumento do volume de vendas, e não por um aumento significativo no valor médio das compras.</p>

<h3>Concentração de Receita por Categoria</h3>
<p>As 5 principais categorias representam aproximadamente 44% da receita total das vendas. Entretanto, entre essas cinco categorias, a que apresenta maior proximidade com o ranking de margem de lucro ocupa apenas a 8ª posição.</p>
<p>Esse cenário demonstra que os produtos responsáveis pelo maior volume de vendas não são necessariamente os mais lucrativos, indicando uma oportunidade para avaliar o equilíbrio entre volume de vendas e rentabilidade por categoria.</p>

<h3>Taxa de Recompra</h3>
<p>Apenas 14% dos clientes realizaram novas compras, indicando uma baixa taxa de recompra. Esse resultado sugere que o crescimento da operação pode estar mais dependente da aquisição de novos clientes do que da retenção e recorrência da base existente.</p>

<h3>Concentração Geográfica das Vendas</h3>
<p>Embora a China concentre o maior volume de pedidos e receita, mercados como Reino Unido e França apresentam participação na receita superior à participação nos pedidos. Esse comportamento sugere um maior valor gerado por pedido nesses mercados.</p>
<p>Além disso, China, Estados Unidos e Brasil concentram aproximadamente 71% da receita, evidenciando uma forte concentração do desempenho comercial nesses três mercados.</p>

<h3>Impacto de Cancelamentos e Devoluções</h3>
<p>Quase metade das vendas (49,74%) está concentrada em pedidos cancelados ou devolvidos, representando 49,61% do valor dos pedidos.</p>
<p>O resultado evidencia um ponto de atenção relevante para a operação, uma vez que uma parcela significativa do volume comercial não se mantém como venda efetivada. Esse cenário pode impactar diretamente a receita realizada e indica a necessidade de investigar as principais causas de cancelamentos e devoluções.</p>
```
