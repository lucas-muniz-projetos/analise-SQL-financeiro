/*
Análise 5 — Distribuição geográfica das vendas

Pergunta de negócio
"Em quais regiões a empresa concentra suas vendas e quais áreas apresentam maior potencial de crescimento?"

Um executivo quer saber
Quais estados ou regiões mais contribuem para a receita total.
Se a receita está concentrada em poucos estados ou distribuída de forma equilibrada.
Quais regiões têm maior volume de pedidos.
Quais regiões possuem clientes de maior valor (ticket médio).
Onde existem mercados subexplorados.
Como priorizar investimentos comerciais e de marketing por região.

O que você precisaria descobrir
Receita total por estado. xxxxxxxxxx
Quantidade de pedidos por estado. xxxxxxxxxx
Quantidade de clientes por estado. xxxxxxxxxx
Ticket médio por estado. XXXXXXXXXXXXX
Participação (%) de cada estado na receita total.XXXXX
Participação (%) de cada estado no total de pedidos.
*/

/*
WITH pedidos_validos AS (
  SELECT  u.id,
          v.order_id,
          v.status
  FROM `projeto-dados-496708.projetobq.dl_usuarios` AS u
  JOIN `projeto-dados-496708.projetobq.dl_venda` AS v 
    ON v.user_id = u.id 
  WHERE v.status IN ('COMPLETE')
), 

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

  receita AS (
    SELECT r.pais,
           r.estado,
           SUM(oi.sale_price) AS receita,
           COUNT(DISTINCT oi.order_id) AS c_vendas,
           COUNT(DISTINCT oi.user_id) AS c_usuario

    FROM regioes AS r
    JOIN `projeto-dados-496708.projetobq.vw_ordem_items` AS oi
      ON oi.order_id = r.order_id
    JOIN pedidos_validos AS pv 
      ON pv.order_id = oi.order_id
    GROUP BY r.pais, r.estado
    ORDER BY R.PAIS
  )



SELECT r.pais,
       r.estado,
       r.c_vendas,
       r.c_usuario,
       r.receita AS receita,
       (r.receita / SUM(r.receita) OVER(PARTITION BY r.pais)) *100 AS porc_estado_pais,
       CONCAT("R$", ROUND(r.receita / r.c_vendas,2)) AS ticket_medio,
       r.c_vendas / SUM(r.c_vendas) OVER(PARTITION BY r.pais)

FROM receita AS r

*/


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

 