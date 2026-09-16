-- Quais categorias têm maior impacto no faturamento da empresa e melhor desempenho em lucratividade ?

-- comprasValidas foi feito para poder validar as vendas que estão com o status completo 
WITH comprasValidas AS (
  SELECT v.order_id
  FROM `projeto-dados-496708.projetobq.dl_venda` AS v
  WHERE v.status = 'COMPLETE'
),
  receita AS (
    SELECT p.categoria AS categoria,
           -- quantidade de itens vendidos por categoria
           COUNT(oi.product_id) AS p_vendidos,
           -- receita total da categoria
           ROUND(SUM(oi.sale_price),2) AS receita, 
           -- participação da categoria na receita total (%)
           ROUND(SUM(oi.sale_price) / SUM(SUM (oi.sale_price)) OVER() *100, 2) AS p_receita,
           -- lucro total na categoria
           ROUND(SUM(oi.sale_price - p.cost),2) AS lucro,
           -- percentual da receita convertida em lucro
           ROUND((SUM(oi.sale_price - p.cost) / SUM(oi.sale_price)) *100, 2) AS margem_lucro,
           -- valor médio gasto na ategoria por pedido
           ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id),2) AS ticket_medio,
           -- ranking das categorias por receita
           RANK() OVER(ORDER BY sum(oi.sale_price) DESC ) AS rank
    FROM comprasValidas AS cv
    JOIN `projeto-dados-496708.projetobq.dl_ordem_items` AS oi 
      ON cv.order_id = oi.order_id
    JOIN `projeto-dados-496708.projetobq.dl_produto` AS p
     ON p.id = oi.product_id
    GROUP BY p.categoria
  )


SELECT r.categoria,
       r.p_vendidos,
       CONCAT("R$", r.receita) AS receita,
       CONCAT(FORMAT('%.2f',r.p_receita), "%") AS receita_p,
       CONCAT("R$",FORMAT('%.2f', r.lucro)) AS lucro,
       CONCAT(FORMAT('%.2f',r.margem_lucro), "%") AS lucro_p,
       CONCAT("R$",FORMAT('%.2f',r.ticket_medio)) as ticket_medio
FROM receita AS r 
ORDER BY r.rank