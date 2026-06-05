-- Exploring Measures

-- Calculate the Key Metrics of the Business (Big Numbers)

--Highest Level of Aggregation and the lowest level of Details

--Key Commands: Aggregate functions CAMMS

-- Find the Total Sales
SELECT SUM(sales_amount) [total_sales] FROM gold.fact_sales

-- Find how many items are sold

SELECT SUM(quantity) [total_itens] FROM gold.fact_sales

-- Find the Average Selling price
SELECT AVG(price) [avg_Selling_price] FROM gold.fact_sales

-- Find the Total Number of Orders
SELECT COUNT(DISTINCT order_number) [total_orders] FROM gold.fact_sales

-- Find the Total Number of products
SELECT COUNT(product_key) [total_products] FROM gold.fact_sales

-- Find the Total Number of customers
SELECT COUNT(customer_key) [total_customers] FROM gold.fact_sales


-- Find the Total Number of Customers that has placed an order
SELECT COUNT( DISTINCT customer_key)[Customers_orders] FROM gold.fact_sales
WHERE order_date IS NOT NULL

--TASK: Generate a report that shows all key metrics of the Business
SELECT 
 'Total Sales' as measure_name, SUM(sales_amount) [measure_value]
FROM gold.fact_sales
UNION ALL
SELECT 
'Total Quantity' as measure_name, SUM(quantity) [total_itens]
FROM gold.fact_sales
UNION ALL
SELECT 
'Average Price' as measure_name, AVG(price) [average_price]
FROM gold.fact_sales
UNION ALL
SELECT
'Total Nr. Orders' as measure_name, COUNT(DISTINCT order_number) [ ]
FROM gold.fact_sales
UNION ALL
SELECT
'Total Nr. Products' as measure_name,COUNT(product_name) [total_products] 
FROM gold.dim_products
UNION ALL
SELECT
'Total Nr. Customers' as measure_name,COUNT(DISTINCT customer_key) [Customers_orders]
FROM gold.fact_sales