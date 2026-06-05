--Advanced Data Analysis Projects
--1. Change over time
--Analyze how a measure evolves over time.
--Helps track trends and identify seasonality in your data

--KEY FORMULA: Measure By Date Dimension
 --p.ex: Total Sales By Year, Average Cost By Month

 --TASK: Analyze Sales Performance Over Time (Year,Month)
 --Year
 SELECT YEAR(order_date) [order_year],
 SUM(sales_amount) [total_sales],
 COUNT(DISTINCT customer_key) AS total_customers,
 SUM(quantity) as total_quantity
 FROM gold.fact_sales
 WHERE order_date IS NOT NULL
 GROUP BY YEAR(order_date)

 --Month
 SELECT MONTH(order_date) [order_month],
 SUM(sales_amount) [total_sales],
 COUNT(DISTINCT customer_key) AS total_customers,
 SUM(quantity) as total_quantity
 FROM gold.fact_sales
 WHERE order_date IS NOT NULL
 GROUP BY MONTH(order_date) 
 ORDER BY MONTH(order_date) DESC

 --Year & Month
 SELECT 
 YEAR(order_date) [order_year],
 MONTH(order_date) [order_month],
 SUM(sales_amount) [total_sales],
 COUNT(DISTINCT customer_key) AS total_customers,
 SUM(quantity) as total_quantity
 FROM gold.fact_sales
 WHERE order_date IS NOT NULL
 GROUP BY YEAR(order_date) , MONTH(order_date) 
 ORDER BY YEAR(order_date) , MONTH(order_date) DESC