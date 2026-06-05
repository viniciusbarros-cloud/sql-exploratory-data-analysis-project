--Dimension Exploration

/*Here, we shall identify the unique values (or categories)
in each dimension, which is useful for later analysis*/

--Key commmand: DISTINCT [DIMENSION E.g. country, birthdate]

--Explore all countries our customers come from 

SELECT DISTINCT country
FROM gold.dim_customers

--Explore all Product Categories "The Major Divisions"
SELECT DISTINCT category,subcategory,product_name
FROM gold.dim_products
ORDER BY 1,2,3


