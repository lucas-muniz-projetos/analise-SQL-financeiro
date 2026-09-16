WITH comprasValidas AS (
  SELECT order_id,
         status
  FROM `projeto-dados-496708.projetobq.dl_venda`
  WHERE status IN ('RETURNED', 'CANCELLED')

),

 receitas AS (
   SELECT cv.status AS status, 
          COUNT(DISTINCT oi.order_id) AS qnt_vendas,
          ROUND(COUNT(DISTINCT oi.order_id) / 
             (SELECT COUNT(DISTINCT order_id) FROM `projeto-dados-496708.projetobq.dl_ordem_items` )
             *100
           ,2) AS porc_vendas,
          COUNT(oi.id) AS qnt_itens,
          ROUND(SUM(oi.sale_price),2) AS valores_perdidos,
          -- SUM(oi.sale_price) / (SUM(SUM(oi.sale_price)) OVER()) AS p_valor_perdido
          ROUND(SUM(oi.sale_price) / 
                (select sum(sale_price) from `projeto-dados-496708.projetobq.dl_ordem_items`)
                 * 100
           ,2) AS p_valores_perdidos,
           ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id),2) AS ticket_medio
   FROM comprasValidas AS cv
   JOIN `projeto-dados-496708.projetobq.vw_ordem_items` AS oi
    ON cv.order_id = oi.order_id
   GROUP BY status

 )

SELECT r.status,
       r.qnt_vendas,
       CONCAT(FORMAT('%.2f',r.porc_vendas),"%") as porc_venda,
       r.qnt_itens,
       CONCAT("R$ ", FORMAT('%.2F',r.valores_perdidos)) AS valores_perdidos,
       CONCAT(FORMAT('%.2f',r.p_valores_perdidos), "%") AS p_valores_perdidos,
       CONCAT("R$ ", FORMAT('%.2f',r.ticket_medio)) AS ticket_medio

FROM receitas AS r


