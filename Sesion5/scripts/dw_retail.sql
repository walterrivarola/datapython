use dw_retail;

INSERT INTO dimension_time (time_id, year, quarter, month, day, day_of_week, day_of_year, week_of_year, is_weekend)
SELECT
    DISTINCT DATE_FORMAT(order_date, '%Y%m%d') AS time_id,
    YEAR(order_date) AS year,
    QUARTER(order_date) AS quarter,
    MONTH(order_date) AS month,
    DAY(order_date) AS day,
    DAYOFWEEK(order_date) AS day_of_week,
    DAYOFYEAR(order_date) AS day_of_year,
    WEEK(order_date) AS week_of_year,
    CASE WHEN DAYOFWEEK(order_date) IN (1,7) THEN TRUE ELSE FALSE END AS is_weekend
FROM retail_db.orders;


SELECT * FROM fact_orders

-- Total de órdenes por año y trimestre
SELECT
    year,
    quarter,
    COUNT(*) AS total_orders
FROM fact_orders
INNER JOIN dimension_time dt ON fact_orders.time_id = dt.time_id
GROUP BY year, quarter
ORDER BY year, quarter;
 
-- Monto total de órdenes por mes
SELECT
    year,
    month,
    SUM(total_amount) AS total_amount
FROM fact_orders
INNER JOIN dimension_time dt ON fact_orders.time_id = dt.time_id
GROUP BY year, month
ORDER BY year, month;