
<div>
<h1>Análise de Desempenho Comercial e Oportunidades de Receita</h1>

<h2>Visão Geral</h2>

<p>Análise do desempenho comercial de uma operação de e-commerce global, com base no dataset Thelook E-commerce(Google BigQuery) e dados históricos desde 2019.</p>

<p>A receita isolada não explica o desempenho comercial da operação: categoria, de produto, comportamento de recompra, distribuição geográfica e status dos pedidos têm impacto direto nos resultados. A investigação desses fatores via SQL aponta oportunidades concretas de crescimento e geração de receita</p>

<p>Toda a extração, tratamento e análise dos dados foram realizads exclusivamente em SQL, no Google BigQuery</p>

<p><strong>Pergunta central: Quais fatores explicam o desempenho comercial da empresa, e onde estão as principais oportunidades de crescimento e geração de receita ?</strong></p>

<h2>Abordagem</h2>
<p>Cinco frentes foram avaliadas:</p> 
<p>evolução temporal da receita e dos principais indicadores comerciais</p>
<p>Contribuição das categorias de produto para a receita e lucratividade</p>
<p>Comportamento de recompra dos clientes</p>
<p>distribuição geográfica das vendas</p>
<p>Impacto de cancelamentos e devoluções sobre os valores movimentados</p>

<h2>Preparação dos dados</h2>
<p>Antes da análise, os dados passaram por uma etapa de tratamento para garantir consitência e confiabilidade das informações.</p>
<p>Foram utilizadas as tabelas de Pedidos (orders), Itens do Pedido (order_items), Clientes (Usuários) e Produtos (products) do dataset TheLook E-commerce, relacionadas entre si por meio de order_id (pedidos e itens pedidos), product_id (itens do pedido e produtos) e user_id (pedidos e clientes). Foram selecionadasapenas as colunas relevantes para as questões de negócios investigadas, e carregados paenas os pedidos com status de "completo", "cancelado", "devolvido". </p>
<p>A ausência de nulos nos identificadores foi validada, mantendo-se, ainda assim, uma cláusula de verificação (WHERE) como proteção contra eventuais inconsistências em atualizações futuras na base. Na tabela de clientes, foi aplicado distinct para garantir a unicidade dos registros.</p>
<p>Campos de texto foram padronizados por meio da remoção de espaços em branco e o campo de status foi convertido para letras maiúsculas, enquanto os campos destinados à visualização, como nome de país, categoria e usuários, foram formatados com a primeira letra maiúscula (InitCap). Os valores numéricos foram definidos para duas casas decimais.</p>



<h2>Análise</h2>

<h3>1. Evolução do desempenho comercial</h3>

<p>O desempenho comercial ao longo do período é avaliado pela receita mensal, volume de pedidos, quantidade de clientes e ticket médio, incluindo as variações mês a mês (MoM) e ano a ano (YoY)</p>

<img width="965" height="408" alt="faturamento x tempo" src="https://github.com/user-attachments/assets/991fd7e3-00ba-4cb9-9d96-164b11b19320" />

<h3>2. Categorias e geração de resultado</h3>

<p>A participação de cada categoria de produto no faturamento é comparada ao seu desempenho em lucratividade, evidenciando a real composição do resultado comercial da operação.</p>

<img width="748" height="481" alt="receita x categoria" src="https://github.com/user-attachments/assets/2f77b8c5-228d-4d61-aa44-c4a7f7fd5018" />

<h3>3. Comportamento dos clientes</h3>

<p>O comportamento de compra é avaliado a partir do volume de clientes de compra única, da receita gerada por esse grupo, do ticket médio e das categorias mais adquiridas.</p>

<img width="931" height="56" alt="cliente 1 compra" src="https://github.com/user-attachments/assets/1b628913-7898-4edf-a603-77fab038471c" />


<h3>4. Distribuição geográfica</h3>

<p>A distribuição das vendas entre os estados é avaliada por receita, pedidos, clientes, ticket médio e participação de cada região nos resultados da operação.</p>

<img width="1056" height="378" alt="Geografico" src="https://github.com/user-attachments/assets/dbfa064a-415e-4c35-9762-991062d382a4" />


<h3>5. Status dos pedidos</h3>

<p>Os pedidos são segmentados por status para identificar sua relação com os valores movimentados e apontar as situações que exigem atenção prioritária na gestão comercial.</p>

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

<h2>Recomendações</h2>
<h4>Entre os achados da análise, dois se destacaram pelo potencial de retorno frente ao esforço necessário para endereçá-lo:  a alta concentração de 
cancelamentos/devoluções e a baixa taxa de recompra dos clientes. As recomendações a seguir priorizam essas duas frentes:</h4>
<h6>Cancelamentos e devoluções</h6>
<p>Cancelamentos e devoluções concentram 49,74% dos pedidos e aproximadamente U$2.666.789,75 em pedidos não efetivados no período analisado. Recomenda-se levantar os motivos de cancelamentos devolução por categoria e por região, priorizando as combinações com maior volume,  para identificar rapidamente se a causa predominante é operacional (atraso de entrega, ruptura de estoque) ou comercial (divergência entre o produto anunciado e o recebido). A partir desse mapeamento, é possível direcionar ações específicas, como a revisão de SLA  de entrega junto às transportadoras nas regiões mais afetadas, ou ajuste de descrição/fotos dos produtos nas categorias com maior taxa de devolução e acompanhar mensalmente a evolução do indicador para validar o impacto das ações implementadas</p>

<h6>Recompra</h6>
<p>Apenas 14% dos clientes realizaram novas compras no período analisado, indicando baixa retenção da base atual. Recomenda-se implementar um programa de cumpom ou desconto para segunda compra, disparado automaticamente após a finalização do primeiro pedido, além de e-mails de reengajamento para clientes sem compra há mais de 60 dias. Também é recomendável priorizar essas ações nas categorias com maior participação na receita, de forma a maximizar o retorno do investimento em retenção. Ao aumentar a taxa de recompra, a operação reduz sua dependência de aquisição constante de novos clientes e melhora a previsibilidade de receita no médio prazo. </p>

