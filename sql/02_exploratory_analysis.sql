/*
=========================================
Retail Sales Analytics
Business Analysis using PostgreSQL

Author: Rahim Manji
=========================================
*/


-- =====================================
-- Question 1
-- How many orders are in the dataset?
-- Answer: 9,994
-- =====================================

SELECT COUNT(*) AS total_orders
FROM superstore_orders;



-- =====================================
-- Question 2
-- What are the total sales?
-- Answer: $2,297,201.07
-- =====================================

SELECT
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_orders;




-- =====================================
-- Question 3
-- What is the total profit?
-- Answer: $286,397.79
-- =====================================

SELECT
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_orders;



-- =====================================
-- Question 4
-- What is the average sales amount per order?
-- Answer: $229.86
-- =====================================

SELECT
    ROUND(AVG(sales),2) AS average_order_value
FROM superstore_orders;




-- =====================================
-- Question 5
-- How many unique customers placed orders?
-- Answer: 793
-- =====================================

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore_orders;



/*
=========================================
SECTION 2
Regional Performance
=========================================
*/

-- =====================================
-- Question 6
-- Which regions generate the highest sales?
--
-- Answer:
-- 1. West    - $725,457.93
-- 2. East    - $678,781.36
-- 3. Central - $501,239.88
-- 4. South   - $391,721.90
--
-- Business Insight:
-- The West region generates the highest revenue, while the South
-- generates the lowest sales.
-- =====================================

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_orders
GROUP BY region
ORDER BY total_sales DESC;


-- =====================================
-- Question 7
-- Which regions generate the highest profit?
--
-- Answer:
-- 1. West    - $108,418.79
-- 2. East    - $91,522.84
-- 3. South   - $46,749.71
-- 4. Central - $39,706.45
--
-- Business Insight:
-- The West region leads in profit, while Central produces the
-- lowest profit despite generating substantial sales.
-- =====================================

SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY region
ORDER BY total_profit DESC;


-- =====================================
-- Question 8
-- What is the average sales value per row by region?
--
-- Answer:
-- 1. South   - $241.80
-- 2. East    - $238.34
-- 3. West    - $226.49
-- 4. Central - $215.77
--
-- Business Insight:
-- The South has the highest average sales value per row, even
-- though it has the lowest total regional sales.
-- =====================================

SELECT
    region,
    ROUND(AVG(sales), 2) AS average_sales_value
FROM superstore_orders
GROUP BY region
ORDER BY average_sales_value DESC;







/*
=========================================
SECTION 3
Category Performance
=========================================
*/

-- =====================================
-- Question 9
-- Which product categories generate the highest sales?
-- Answer:
-- 1. Technology      - $836,154.10
-- 2. Furniture       - $741,999.98
-- 3. Office Supplies - $719,046.99
--
-- Business Insight:
-- Technology generates the highest total sales, indicating strong
-- customer demand for technology products.
-- =====================================

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_orders
GROUP BY category
ORDER BY total_sales DESC;


-- =====================================
-- Question 10
-- Which product categories generate the highest profit?
-- Answer:
-- 1. Technology      - $145,455.66
-- 2. Office Supplies - $122,490.88
-- 3. Furniture       - $18,451.25
--
-- Business Insight:
-- Although Furniture generates high revenue, it produces significantly
-- less profit than the other categories. This may indicate lower margins,
-- higher costs, or more aggressive discounting.
-- =====================================

SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY category
ORDER BY total_profit DESC;