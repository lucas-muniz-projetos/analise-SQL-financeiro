
<div>
<h1>Análise de Desempenho Comercial e Oportunidades de Receita</h1>

<h2>Visão Geral</h2>

<p>Análise do desempenho comercial de uma operação de e-commerce global, com base no dataset Thelook E-commerce (Google BigQuery) e dados históricos desde 2019.</p>

<p>A receita isolada não explica o desempenho comercial da operação: categoria de produto, comportamento de recompra, distribuição geográfica e status dos pedidos têm impacto direto nos resultados. A investigação desses fatores via SQL aponta oportunidades concretas de crescimento e geração de receita.</p>

<p>Toda a extração, tratamento e análise dos dados foram realizados exclusivamente em SQL, no Google BigQuery.</p>

<p><strong>Pergunta central: Quais fatores explicam o desempenho comercial da empresa, e onde estão as principais oportunidades de crescimento e geração de receita ?</strong></p>

<h2>Abordagem</h2>
<p>Para responder à pergunta central, o desempenho comercial foi decomposto em cinco frentes complementares:</p> 
<p>evolução temporal da receita e dos principais indicadores comerciais</p>
<p>Contribuição das categorias de produto para a receita e lucratividade</p>
<p>Comportamento de recompra dos clientes</p>
<p>distribuição geográfica das vendas</p>
<p>Impacto de cancelamentos e devoluções sobre os valores movimentados</p>

<h2>Preparação dos dados</h2>
<p>Antes da análise, os dados passaram por uma etapa de tratamento para garantir consistência e confiabilidade das informações.</p>
<p>Foram utilizadas as tabelas de Pedidos (orders), Itens do Pedido (order_items), Clientes (customers) e Produtos (products) do dataset TheLook E-commerce, relacionadas entre si por meio de order_id (pedidos e itens pedidos), product_id (itens do pedido e produtos) e user_id (pedidos e clientes). Foram selecionadas apenas as colunas relevantes para as questões de negócios investigadas, e carregados apenas os pedidos com status de "completo", "cancelado" ou "devolvido". </p>
<p>A ausência de nulos nos identificadores foi validada, mantendo-se, ainda assim, uma cláusula de verificação (WHERE) como proteção contra eventuais inconsistências em atualizações futuras na base. Na tabela de clientes, foi aplicado DISTINCT para garantir a unicidade dos registros.</p>
<p>Campos de texto foram padronizados por meio da remoção de espaços em branco e o campo de status foi convertido para letras maiúsculas, enquanto os campos destinados à visualização, como nome de país, categoria e usuários, foram formatados com a primeira letra maiúscula (InitCap). Os valores numéricos foram arredondados para duas casas decimais.</p>



<h2>Análise</h2>

<h3>1. Evolução do desempenho comercial</h3>

<p>O desempenho comercial ao longo do período é avaliado pela receita mensal, volume de pedidos, quantidade de clientes e ticket médio, incluindo as variações mês a mês (MoM) e ano a ano (YoY)</p>

<img width="1414" height="592" alt="evolução" src="https://github.com/user-attachments/assets/ffe4ddb5-10c7-4ead-b2d4-1f9e0365e3b4" />


<h3>2. Categorias e geração de resultado</h3>

<p>A participação de cada categoria de produto no faturamento é comparada ao seu desempenho em lucratividade, evidenciando a real composição do resultado comercial da operação.</p>

<img width="1329" height="595" alt="categoria" src="https://github.com/user-attachments/assets/c4c1d457-8ad2-4aff-9c51-f8ef07d4f122" />


<h3>3. Comportamento dos clientes</h3>

<p>O comportamento de compra é avaliado a partir do volume de clientes de compra única, da receita gerada por esse grupo, do ticket médio e das categorias mais adquiridas.</p>

<img width="1078" height="68" alt="cliente recompra" src="https://github.com/user-attachments/assets/fa7d1183-1847-45ac-a640-194710f9fbbc" />


<h3>4. Distribuição geográfica</h3>

<p>A distribuição das vendas entre os estados é avaliada por receita, pedidos, clientes, ticket médio e participação de cada região nos resultados da operação.</p>

<img width="1078" height="409" alt="GEOGRAFICO" src="https://github.com/user-attachments/assets/d68ac473-d7ab-4294-8866-c5fc9f3d3a3d" />



<h3>5. Status dos pedidos</h3>

<p>Os pedidos são segmentados por status para identificar sua relação com os valores movimentados e apontar as situações que exigem atenção prioritária na gestão comercial.</p>

<img width="1078" height="82" alt="PERDIDO" src="https://github.com/user-attachments/assets/9c34d9ee-2b50-49ed-80d6-210520f18471" />

</div>

<h2>Principais Insights da Análise</h2>
<h3>Evolução das vendas</h3>
<p>O aumento da receita no ano de 2026 foi muito superior ao observado em 2025, porém o ticket médio manteve-se, na maior parte do período, relativamente estável. Isso demonstra que o crescimento da receita foi impulsionado principalmente pelo aumento do volume de vendas, e não por um aumento significativo no valor médio das compras.</p>

<h3>Concentração de Receita por Categoria</h3>
<p>As 5 principais categorias representam aproximadamente 44% da receita total das vendas. Entretanto, entre essas cinco categorias, a que apresenta maior proximidade com o ranking de margem de lucro ocupa apenas a 8ª posição.</p>
<p>Esse cenário demonstra que os produtos responsáveis pelo maior volume de vendas não são necessariamente os mais lucrativos, indicando uma oportunidade para avaliar o equilíbrio entre volume de vendas e rentabilidade por categoria.</p>

<h3>Taxa de Recompra</h3>
<p>Apenas 12,11% dos clientes realizaram novas compras, indicando uma baixa taxa de recompra. Esse resultado sugere que o crescimento da operação pode estar mais dependente da aquisição de novos clientes do que da retenção e recorrência da base existente.</p>

<h3>Concentração Geográfica das Vendas</h3>
<p>Embora a China concentre o maior volume de pedidos e receita, mercados como Reino Unido e França apresentam participação na receita superior à participação nos pedidos. Esse comportamento sugere um maior valor gerado por pedido nesses mercados.</p>
<p>Além disso, China, Estados Unidos e Brasil concentram aproximadamente 70,67% da receita, evidenciando uma forte concentração do desempenho comercial nesses três mercados.</p>

<h3>Impacto de Cancelamentos e Devoluções</h3>
<p>Aproximadamente 50% das vendas estão concentrada em pedidos cancelados ou devolvidos.</p>
<p>O resultado evidencia um ponto de atenção relevante para a operação, uma vez que uma parcela significativa do volume comercial não se mantém como venda efetivada. Esse cenário pode impactar diretamente a receita realizada e indica a necessidade de investigar as principais causas de cancelamentos e devoluções.</p>

<h2>Recomendações</h2>
<h4>Entre os achados da análise, dois se destacaram pelo potencial de retorno frente ao esforço necessário para endereçá-los: a alta concentração de cancelamentos/devoluções e a baixa taxa de recompra dos clientes. As recomendações a seguir priorizam essas duas frentes:</h4>
<h6>Cancelamentos e devoluções</h6>
<p>Cancelamentos e devoluções concentram 50,04% dos pedidos e aproximadamente R$2.731.432,82 em pedidos não efetivados no período analisado. Recomenda-se levantar os motivos de cancelamentos e devoluções por categoria e por região, priorizando as combinações com maior volume,  para identificar rapidamente se a causa predominante é operacional (atraso de entrega, ruptura de estoque) ou comercial (divergência entre o produto anunciado e o recebido). A partir desse mapeamento, é possível direcionar ações específicas, como a revisão de SLA  de entrega junto às transportadoras nas regiões mais afetadas, ou ajuste de descrição/fotos dos produtos nas categorias com maior taxa de devolução e acompanhar mensalmente a evolução do indicador para validar o impacto das ações implementadas</p>

<h6>Recompra</h6>
<p>Apenas 12,11% dos clientes realizaram novas compras no período analisado, indicando baixa retenção da base atual. Recomenda-se implementar um programa de cupom ou desconto para segunda compra, disparado automaticamente após a finalização do primeiro pedido, além de e-mails de reengajamento para clientes sem compra há mais de 60 dias. Também é recomendável priorizar essas ações nas categorias com maior participação na receita, de forma a maximizar o retorno do investimento em retenção. Ao aumentar a taxa de recompra, a operação reduz sua dependência de aquisição constante de novos clientes e melhora a previsibilidade de receita no médio prazo. </p>

<H3>Conclusão</H3>
<P>
No fim das contas, o crescimento de receita observado veio muito mais de vender mais unidades do que de vender mais caro ,o ticket médio praticamente não se mexeu. Isso é bom, mas também é um sinal de alerta: um crescimento apoiado só em volume tende a ser mais frágil se a aquisição de clientes desacelerar.
Dois problemas se destacaram claramente na análise. Primeiro, quase metade dos pedidos 50,04% acaba em cancelamento ou devolução um volume de dinheiro parado enorme perto de R$ 2,7 milhões que simplesmente não vira receita de fato. Segundo, a recompra é baixa: só 12,11% dos clientes voltam a comprar. Isso mostra uma operação ainda muito dependente de trazer gente nova, e pouco de fidelizar quem já comprou.
Também vale reforçar um ponto que passa despercebido se só olhar receita: as categorias que mais vendem não são as mais lucrativas. E a operação está bem concentrada em três países China, EUA e Brasil, o que ajuda hoje mas é um risco se algum desses mercados desacelerar.
As duas recomendações feitas aqui atacam justamente os pontos com mais impacto e menos esforço para agir. O próximo passo natural é acompanhar esses dois indicadores mês a mês depois que as ações forem implementadas, pra ver se realmente estão fazendo diferença e ajustar o que não estiver funcionando.
</P>
