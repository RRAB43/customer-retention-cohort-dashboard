WITH first_orders AS (
  SELECT customer_id, MIN(order_date) AS cohort_date
  FROM orders
  GROUP BY customer_id
), activity AS (
  SELECT
    o.customer_id,
    DATE_TRUNC('month', f.cohort_date) AS cohort_month,
    (EXTRACT(YEAR FROM AGE(DATE_TRUNC('month', o.order_date),
                           DATE_TRUNC('month', f.cohort_date))) * 12
     + EXTRACT(MONTH FROM AGE(DATE_TRUNC('month', o.order_date),
                              DATE_TRUNC('month', f.cohort_date))))::INT AS month_number
  FROM orders o
  JOIN first_orders f USING (customer_id)
), cohort_size AS (
  SELECT cohort_month, COUNT(DISTINCT customer_id) AS customers
  FROM activity
  WHERE month_number = 0
  GROUP BY cohort_month
)
SELECT
  a.cohort_month,
  a.month_number,
  COUNT(DISTINCT a.customer_id) AS retained_customers,
  ROUND(100.0 * COUNT(DISTINCT a.customer_id) / c.customers, 1) AS retention_rate
FROM activity a
JOIN cohort_size c USING (cohort_month)
GROUP BY a.cohort_month, a.month_number, c.customers
ORDER BY a.cohort_month, a.month_number;

