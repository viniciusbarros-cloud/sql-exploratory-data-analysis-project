--Ranking Analysis

--Order the values of dimensions by measure
--Identify Top N performes | Bottom N performers


--KEY FORMULAS: RANK(), ROW_NUMBER(), DENSE_RANK()
--RANK [DIMENSION] by [Measure]
--p.ex: Rank Countries By total Sales
--TOP 5 products by quantities

--TASKS:
--Which 5 products generate the highest revenue?

SELECT top 5 *,
ROW_NUMBER() OVER (ORDER BY Total_revenue DESC) [Ranking]
FROM(
SELECT 
d.product_name,
SUM(f.sales_amount) [Total_revenue]
FROM gold.fact_sales as f
LEFT JOIN gold.dim_products as d
ON (d.product_key = f.product_key)
GROUP BY d.product_name
)T

--What are the 5 worst-performing products in terms of sales?

SELECT TOP 5 
d.product_name,
SUM(f.sales_amount) [Total_revenue]
FROM gold.fact_sales as f
LEFT JOIN gold.dim_products as d
ON (d.product_key = f.product_key)
GROUP BY d.product_name
ORDER BY [Total_revenue] ASC

--Find the TOP 10 customers who have generated the highest revenue
SELECT TOP 10
d.customer_key,
d.first_name,
d.last_name,
SUM(sales_amount) [Total_revenue]
FROM gold.fact_sales as f
LEFT JOIN gold.dim_customers as d
ON (f.customer_key = d.customer_key)
GROUP BY d.customer_key, d.first_name, d.last_name
ORDER BY [Total_revenue] DESC

-- Find the TOP 3 customers with the fewest orders placed
SELECT TOP 3
d.customer_key,
d.first_name,
d.last_name,
COUNT(DISTINCT order_number) [orders_placed]
FROM gold.fact_sales as f
LEFT JOIN gold.dim_customers as d
ON (f.customer_key = d.customer_key)
GROUP BY d.customer_key,d.first_name,d.last_name
ORDER BY COUNT(DISTINCT order_number) ASC
