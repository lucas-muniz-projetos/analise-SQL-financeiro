-- VALIDAÇÃO DOS PEDIDOS QUE ESTÃO COM STATUS COMPLETO
WITH pedidos_validos AS (
  SELECT  u.id,
          v.order_id,
          v.status
  FROM `projeto-dados-496708.projetobq.dl_usuarios` AS u
  JOIN `projeto-dados-496708.projetobq.dl_venda` AS v 
    ON v.user_id = u.id 
  WHERE v.status IN ('COMPLETE')
), 

-- REGIOES E PEDIDOS VALIDOS
 regioes AS (
      SELECT pv.id,
             pv.status,
             pv.order_id, 
             u.pais,
             u.estado
      FROM pedidos_validos AS pv
      JOIN `projeto-dados-496708.projetobq.dl_usuarios` AS u
        ON pv.id = u.id

 ),

-- CALCULOS DAS RECEITAS 
  receita AS (
     SELECT re.pais,
            SUM(oi.sale_price) AS receita ,
            COUNT(DISTINCT oi.order_id) AS c_vendas,
            COUNT(DISTINCT oi.user_id) AS c_clientes,
            SUM(p.cost) AS custo
        
     FROM regioes AS re
     JOIN `projeto-dados-496708.projetobq.dl_ordem_items` AS oi
      ON re.order_id = oi.order_id
     JOIN `projeto-dados-496708.projetobq.dl_produto` AS p
      ON p.id = oi.product_id
     GROUP BY re.pais





  )

select r.pais,
-- QNT DE VENDAS
       r.c_vendas AS c_vendas,
-- QNT CLIENTES       
       r.c_clientes AS c_clientes,
-- RECEITA
       CONCAT('R$', FORMAT("%.2f",r.receita)) AS receita,
-- LUCRO       
       CONCAT('R$', FORMAT("%.2f", r.receita - r.custo)) AS lucro,
--- TICKET MEDIO       
       CONCAT('R$', FORMAT("%.2f",r.receita / r.c_vendas)) AS ticket_medio,
 -- MARGEM DE LUCRO EM %      
       CONCAT(FORMAT("%.2f",(r.receita - r.custo) / r.receita * 100),'%') AS margem_lucro,
  -- PARTICIPAÇÃO DE CADA PAIS NA RECEITA TOTAL     
       CONCAT(FORMAT("%.2f",(r.c_vendas / sum(r.c_vendas) OVER()) * 100),'%') AS pct_vendas_total,
  -- PARTICIPAÇÃO DE CADA PAIS NO N° DE PEDIDOS     
       CONCAT(FORMAT("%.2f",(r.receita / sum(r.receita) over()) * 100), '%') AS pct_receita_total
       
      
 from receita AS r
 ORDER BY r.c_vendas DESC

 
