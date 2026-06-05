--Advanced Analysis
--3. Performance Analysis
--Comparing the current value to a target value
--Helps measure success and compare performance

--KEY FORMULA: current[Measure] -Target[Measure]
--p.ex: Current_Sale - Average Sales, Current year Sales - Previous Year Sales
--Again, We shall use windows functions

--TASK:
--Analyse the yearly performance of products by comparing
--each product's sales to both its average sales performance and the
--previous year's sales

WITH yearly_product_sales AS (
SELECT
YEAR(f.order_date) AS order_year,
p.product_name,
SUM(f.sales_amount) AS current_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
GROUP BY YEAR(f.order_date),p.product_name
)

SELECT 
order_year,
product_name,
current_sales,
AVG(current_sales) OVER (PARTITION by product_name) avg_sales,
current_sales -AVG(current_sales) OVER (PARTITION by product_name) AS diff_avg,

CASE WHEN current_sales -AVG(current_sales) OVER (PARTITION by product_name) < 0 THEN 'Below The Average'
WHEN current_sales -AVG(current_sales) OVER (PARTITION by product_name) > 0 THEN 'Above the Average'
ELSE 'On Average'
END [avg_change],

LAG(current_sales) OVER (PARTITION by product_name ORDER BY order_year) [Previous_sales],
current_sales - LAG(current_sales) OVER (PARTITION by product_name ORDER BY order_year) [diff_previous_sales],
CASE WHEN current_sales - LAG(current_sales) OVER (PARTITION by product_name ORDER BY order_year) < 0 THEN 'Decrease'
WHEN current_sales - LAG(current_sales) OVER (PARTITION by product_name ORDER BY order_year) > 0 THEN 'Increase'
ELSE 'No change'
END [py_change]
FROM yearly_product_sales
ORDER BY product_name,order_year











