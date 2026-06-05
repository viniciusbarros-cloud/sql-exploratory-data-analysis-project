--Advanced Analytics
--2.Cumulative Analysis
--Aggregate the data progressively over time
--Helps to understand whether our business is growing or decresing over time

--KEY FORMULA: [Cumulative Measure] By [Date Dimension]
--p.ex: Running Total Sales By Year
--Moving Average of Sales By Month
--Here, we shaw employ Windows Functions

--TASK: Calculate the total sales per month, running total of sales over time
--and moving average of the price
SELECT order_date,total_sales,
SUM(total_sales) OVER (ORDER BY order_date) running_total
,AVG(avg_price) OVER (ORDER BY order_date) moving_average
FROM(
SELECT DATETRUNC(MONTH,order_date) AS order_date,
SUM(sales_amount)  AS  total_sales,
AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH,order_date))T
