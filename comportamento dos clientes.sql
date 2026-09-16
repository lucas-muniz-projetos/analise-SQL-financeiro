-- cliente que fizeram compras
WITH cliente1compra AS (
  SELECT
     v.user_id,
     COUNT(*) AS contagem_compra
   FROM `projeto-dados-496708.projetobq.dl_venda` AS v
  WHERE v.status = 'COMPLETE'
  GROUP BY user_id
  HAVING COUNT(*) = 1
),

-- verificação se o pedido está completo
pedidos_validos AS (
  SELECT v.user_id,
         v.order_id
  FROM `projeto-dados-496708.projetobq.dl_venda` AS v
  WHERE v.status = 'COMPLETE'
),

-- calculo dos clintes que fizeram apenas uma compra
valores1Compra AS (
  SELECT 
      c1.user_id,
      oi.order_id,
      oi.sale_price
  FROM cliente1compra c1
  JOIN pedidos_validos pv
    ON c1.user_id = pv.user_id
  JOIN `projeto-dados-496708.projetobq.dl_ordem_items` AS oi
    ON pv.order_id = oi.order_id
),

-- calculando categoria que mais vendeu entre os clientes que só realizaram uma compra
categoria AS (
  SELECT
         p.categoria AS categorias,
         COUNT(*) AS cont_categoria,
         
          
  FROM cliente1compra AS c1
  JOIN pedidos_validos AS pv
   ON c1.user_id = pv.user_id
  JOIN `projeto-dados-496708.projetobq.dl_ordem_items` AS oi
   ON pv.order_id = oi.order_id
  JOIN `projeto-dados-496708.projetobq.dl_produto` AS p
   ON oi.product_id = p.id
  group by p.categoria
  order by cont_categoria DESC
  limit 1
)



SELECT 
    COUNT(DISTINCT c1.user_id) AS cliente_1_compra,
  -- % clientes que só fizeram uma única compra e está com status de completa
  CONCAT(
    FORMAT('%.2f',
        COUNT(DISTINCT c1.user_id) /
        (SELECT COUNT(DISTINCT user_id)
         FROM `projeto-dados-496708.projetobq.dl_venda`
         WHERE status = 'COMPLETE') * 100
    ),
    '%'
  ) AS porcentagem_cliente_1_compra,

  --receita gerada
  CONCAT(
        'R$ ',
        REPLACE(REPLACE(REPLACE(
            FORMAT("%'.2f", SUM(v1c.sale_price)),
        ',', '#'), '.', ','), '#', '.')
    ) AS receita_gerada,

    -- ticket_medio
    CONCAT(
        'R$ ',
        REPLACE(REPLACE(REPLACE(
          FORMAT('%.2f', SUM(v1c.sale_price) / COUNT(DISTINCT v1c.order_id)),
         ',', '#'), '.', ','), '#', '.')
    ) AS ticket_medio,
    
    (SELECT categoria.categorias AS categoria from categoria ) AS categoria_mais_vendida

FROM cliente1compra c1
JOIN valores1Compra v1c
  ON c1.user_id = v1c.user_id

