/*
Como as vendas evoluíram ao longo do tempo e existem períodos de maior ou menor desempenho?

Análises principais:
1. Receita total por mês XXXXXXXX 
2. Quantidade de pedidos por mês XXXXXXXXXXX
3. Quantidade de clientes por mês XXXXXXXXXX
4. Ticket médio por mês XXXXXXXXXX
5. Participação (%) de cada mês na receita total do período 
6. Crescimento (%) da receita em relação ao mês anterior (MoM) XXXXXXXXXXXXXX
7. Crescimento (%) da receita em relação ao mesmo mês do ano anterior (YoY) XXXXXXXXXXXXX
*/

-- validação das vendas que estão completas
WITH comprasValidas AS (
  SELECT order_id,
         created_at_br
  FROM `projeto-dados-496708.projetobq.dl_venda`
  WHERE status = "COMPLETE"
),


-- valores dos pedidos validos para análise 
 pedidos_mes AS (
       SELECT 
             DATE_TRUNC(cv.created_at_br, MONTH) AS data,
             COUNT(DISTINCT oi.order_id) AS venda_mes,
             ROUND(SUM(oi.sale_price), 2) AS valor_vendido,
             ROUND(SUM(p.cost),2) AS custo
       FROM comprasValidas AS cv
       JOIN `projeto-dados-496708.projetobq.dl_ordem_items` AS oi
         ON oi.order_id = cv.order_id
        JOIN `projeto-dados-496708.projetobq.dl_produto` AS p
          ON oi.product_id = p.id
       GROUP BY data
)


SELECT FORMAT_DATE('%Y',pm.data) AS ano,
       FORMAT_DATE('%B',pm.data) AS mes,
       CONCAT('R$',FORMAT("%.2f", pm.valor_vendido)) AS valor_vendido,
       pm.venda_mes AS contagem_pedido,
       CONCAT('R$', FORMAT("%.2f",(pm.valor_vendido / pm.venda_mes))) AS ticket_medio,
       CONCAT('R$', FORMAT("%.2f", pm.valor_vendido - pm.custo)) AS lucro,
       -- % do valor vendido no faturamento total dos 2 anos
       CONCAT(FORMAT("%.2f", pm.valor_vendido / SUM(pm.valor_vendido) OVER() *100),'%') AS porc_total,
       -- % do valor vendido no faturamento de cada ano 
       CONCAT(FORMAT("%.2f",pm.valor_vendido/ SUM(pm.valor_vendido) OVER(PARTITION BY EXTRACT( YEAR FROM pm.data)) * 100), '%') AS porc_part_ano, 
       -- compração entre os meses
       CONCAT(FORMAT("%.2f",(pm.valor_vendido - LAG(valor_vendido) OVER(ORDER BY pm.data))/ LAG(valor_vendido) OVER(ORDER BY pm.data) *100),'%') AS MoM,
       -- comparação do mesmo mês no ano passado
       CONCAT(FORMAT("%.2f",(pm.valor_vendido - LAG(pm.valor_vendido,12) OVER(ORDER BY data)) / LAG(pm.valor_vendido,12) OVER(ORDER BY data)  *100),'%') AS YoY
FROM pedidos_mes AS pm

