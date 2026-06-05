--Advanced Analytics
--Data Segmentation
/*Group the data based on a specific range
it helps to understand the correlation between two measures and
as a result creating new categories*/

--KEY FORMULA: [Measure1] By [Measure2]
--P.ex: Total Products By Sales Range
--CASE WHEN STATEMENT

--TASK: Segment products into cost range and count how many products fall into
--each segment
WITH product_segment AS (
SELECT
product_key,
product_name,
cost
--CASE WHEN
, CASE 
   WHEN cost < 100 THEN 'Below 100'
   WHEN cost BETWEEN 100 AND 500 THEN '100-500'
   WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
   ELSE 'above 1000'
   END cost_range
FROM gold.dim_products)

SELECT
cost_range,
COUNT(product_key) AS total_products
FROM product_segment
GROUP BY cost_range
ORDER BY total_products DESC

--TASK: Group customers into 03 segmentes based on their spending behavior:
/* VIP: at least 12 months of history and spending more than 5000 euros
Regular: at least 12 months of history but spending 5000 euros or less
New: lifespan less than 12 months

Find the total number of customers by each group
*/

WITH customer_spending AS (
SELECT 
d.customer_key,
SUM(f.sales_amount) AS total_spending,
MAX(order_date) AS last_order,
MIN(order_date) AS first_order,
DATEDIFF(Month,MIN(order_date),MAX(order_date)) AS lifespan
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers d
ON (d.customer_key = f.customer_key)
GROUP BY d.customer_key)

, customer_segmentation_cte AS (

SELECT 
customer_key,
total_spending,
lifespan,
CASE WHEN lifespan >=12 AND total_spending > 5000 THEN 'VIP'
	 WHEN lifespan >=12 AND total_spending <= 5000 THEN 'Regular'
	 ELSE 'New'
	 END customer_segment
	 FROM customer_spending)

SELECT
customer_segment,
COUNT(customer_key) AS total_customers
FROM customer_segmentation_cte
GROUP BY customer_segment



