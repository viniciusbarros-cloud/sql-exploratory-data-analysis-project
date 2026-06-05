--Date Exploration 

--Identify the earliest and latest dates (boundaries).
--Understand the scope of data and the timespan

--Key commands: MIN/MAX [Date Dimension] p.ex.:Order_date,Create_date,Birthdate

--TASK: Find the date of the first and last order

SELECT MAX(order_date) [last_order], MIN(order_date) [first_order]
FROM gold.fact_sales

--TASK: How many years of Sales are avaliable:
SELECT MAX(order_date) [last_order], MIN(order_date) [first_order],
DATEDIFF(Year,MIN(order_date),MAX(order_date)) [order_range_years]
FROM gold.fact_sales
--Now, you may realize how the change of the time measurement also change the granularity
--Changing to Month, we shall see:
SELECT MAX(order_date) [last_order], MIN(order_date) [first_order],
DATEDIFF(Month,MIN(order_date),MAX(order_date)) [order_range_years]
FROM gold.fact_sales

--TASK: Find the youngest and oldest customer

SELECT MIN(birthdate) [oldest_birthdate], MAX(birthdate) [youngest_birthdate],
DATEDIFF(Year,MIN(birthdate),GETDATE()) [oldest_age],
DATEDIFF(Year,MAX(birthdate),GETDATE()) [youngest_age]
FROM gold.dim_customers