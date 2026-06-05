--Advanced Analysis
--Part to role analysis
--Analyze now an individual part is performing compared to the overall
--allowing us to understand which category has the greatest impac on the business


-- KEY FORMULA:
--([Measure]/Total [Measure])*100 BY [Dimension]
--p.ex: (Sales/Total Sales)*100 By category

--TASK: Which categories contribute the most to overall sales
WITH summary_sales_product AS (
SELECT
d.category,
SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products d
ON (f.product_key = d.product_key)
GROUP BY d.category )

SELECT category,total_sales,SUM(total_sales) OVER() [Overall_sales],
CONCAT(ROUND((CAST(total_sales AS FLOAT)/(SUM(total_sales) OVER()))*100,2),' %') AS Percentage_of_total
FROM summary_sales_product
GROUP BY category,total_sales
ORDER BY total_sales DESC

