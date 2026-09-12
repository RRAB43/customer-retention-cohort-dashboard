WITH customer_value AS (
  SELECT
    c.customer_id,
    c.acquisition_channel,
    COUNT(o.order_id) AS orders,
    SUM(o.revenue) AS revenue
  FROM customers c
  JOIN orders o USING (customer_id)
  GROUP BY c.customer_id, c.acquisition_channel
)
SELECT
  acquisition_channel,
  COUNT(*) AS customers,
  ROUND(SUM(revenue), 2) AS revenue,
  ROUND(100.0 * AVG(CASE WHEN orders > 1 THEN 1 ELSE 0 END), 1) AS repeat_rate
FROM customer_value
GROUP BY acquisition_channel
ORDER BY revenue DESC;

