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



/*
=========================================
SECTION 4
Sub- Category Performance
=========================================
*/


-- =====================================
-- Question 11
-- Which sub-categories generate the highest sales?
--
-- Key Findings:
-- 1. Phones    - $330,007.10
-- 2. Chairs    - $328,449.13
-- 3. Storage   - $223,843.59
-- 4. Tables    - $206,965.68
-- 5. Binders   - $203,412.77
--
-- Business Insight:
-- Phones and Chairs generate the highest sales among all
-- sub-categories and are major revenue drivers.
-- =====================================

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_orders
GROUP BY sub_category
ORDER BY total_sales DESC;



-- =====================================
-- Question 12
-- Which sub-categories generate the highest profit?
--
-- Key Findings:
-- 1. Copiers     - $55,617.90
-- 2. Phones      - $44,516.25
-- 3. Accessories - $41,936.78
-- 4. Paper       - $34,053.34
-- 5. Binders     - $30,221.64
--
-- Business Insight:
-- Copiers generate the highest profit despite ranking
-- lower in total sales, indicating excellent profit margins.
-- =====================================

SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY sub_category
ORDER BY total_profit DESC;



-- =====================================
-- Question 13
-- Which sub-categories lose the most money?
--
-- Key Findings:
-- 1. Tables     - -$17,725.59
-- 2. Bookcases  - -$3,472.56
-- 3. Supplies   - -$1,188.99
--
-- Business Insight:
-- Tables generate strong sales but produce the largest
-- overall loss. This sub-category should be investigated
-- for pricing, discounts, or operating costs.
-- =====================================

SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY sub_category
ORDER BY total_profit ASC;



/*
=========================================
SECTION 5
Customer Analysis
=========================================
*/

-- =====================================
-- Question 14
-- Who are the top 10 customers by total sales?
--
-- Key Findings:
-- 1. Sean Miller        - $25,043.07
-- 2. Tamara Chand       - $19,052.22
-- 3. Raymond Buch       - $15,117.35
-- 4. Tom Ashbrook       - $14,595.62
-- 5. Adrian Barton      - $14,473.57
--
-- Business Insight:
-- A relatively small number of customers generate a significant
-- amount of revenue. These customers are valuable relationships
-- that the business should retain.
-- =====================================

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;




-- =====================================
-- Question 15
-- Who are the top 10 customers by total profit?
--
-- Key Findings:
-- 1. Tamara Chand      - $8,981.32
-- 2. Raymond Buch      - $6,976.09
-- 3. Sanjit Chand      - $5,757.42
-- 4. Hunter Lopez      - $5,622.43
-- 5. Adrian Barton     - $5,444.81
--
-- Business Insight:
-- The highest spending customer is not necessarily the most
-- profitable customer. Businesses should evaluate customers
-- based on profitability as well as revenue.
-- =====================================

SELECT
    customer_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;



-- =====================================
-- Question 16
-- Which customers generated an overall loss?
--
-- Key Findings:
-- 1. Cindy Stewart    - -$6,626.37
-- 2. Grant Thornton   - -$4,108.66
-- 3. Luke Foster      - -$3,583.97
--
-- Business Insight:
-- Some customers generate overall losses despite making
-- purchases. The company should investigate pricing,
-- discounts, or return patterns for these customers.
-- =====================================

SELECT
    customer_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY customer_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;



/*
=========================================
SECTION 6
Geographic & Business Performance
=========================================
*/


-- =====================================
-- Question 17
-- Which states generate the highest sales?
--
-- Key Findings:
-- 1. California   - $457,687.68
-- 2. New York     - $310,876.20
-- 3. Texas        - $170,187.98
-- 4. Washington   - $138,641.29
-- 5. Pennsylvania - $116,512.02
--
-- Business Insight:
-- California is the company's largest market by revenue,
-- generating significantly more sales than any other state.
-- =====================================

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_orders
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;




-- =====================================
-- Question 18
-- Which states generate the highest profit?
--
-- Key Findings:
-- 1. California - $76,381.60
-- 2. New York   - $74,038.64
-- 3. Washington - $33,402.70
-- 4. Michigan   - $24,463.15
-- 5. Virginia   - $18,598.00
--
-- Business Insight:
-- California and New York are the company's most profitable
-- states, making them important markets for continued investment.
-- =====================================

SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;




-- =====================================
-- Question 19
-- Which states lose the most money?
--
-- Key Findings:
-- 1. Texas        - -$25,729.29
-- 2. Ohio         - -$16,971.37
-- 3. Pennsylvania - -$15,560.04
-- 4. Illinois     - -$12,607.89
-- 5. North Carolina - -$7,490.81
--
-- Business Insight:
-- Texas generates high sales but also records the largest
-- overall loss, suggesting pricing, discounting, or cost
-- management issues in that market.
-- =====================================

SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;




/*
=========================================
SECTION 7
Advanced Business Analysis
=========================================
*/

-- =====================================
-- Question 20
-- How can states be classified by profitability?

-- Key Findings:
-- • California, New York, and Washington are classified as High Profit states.
-- • Several states fall into the Moderate Profit category.
-- • A number of states are classified as Low Profit or Loss-Making.
--
-- Business Insight:
-- CASE statements make it easier to categorize business performance
-- instead of reviewing raw numbers. This helps managers quickly
-- identify high-performing and underperforming markets.

-- =====================================

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    CASE
        WHEN SUM(profit) < 0 THEN 'Loss-Making'
        WHEN SUM(profit) < 10000 THEN 'Low Profit'
        WHEN SUM(profit) < 30000 THEN 'Moderate Profit'
        ELSE 'High Profit'
    END AS profitability_status
FROM superstore_orders
GROUP BY state
ORDER BY total_profit DESC;



-- =====================================
-- Question 21
-- How have sales and profit changed by year?

-- Key Findings:
-- 2014 - Sales: $484,247.56 | Profit: $49,544.06
-- 2015 - Sales: $470,532.46 | Profit: $61,618.69
-- 2016 - Sales: $609,205.86 | Profit: $81,795.27
-- 2017 - Sales: $733,215.19 | Profit: $93,439.77
--
-- Business Insight:
-- Both sales and profit increased substantially over time.
-- 2017 was the company's strongest year in both revenue
-- and profitability.
-- =====================================

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;



-- =====================================
-- Question 22
-- What is the actual average order value?

-- Key Findings:
-- Actual Average Order Value: $458.61
--
-- Business Insight:
-- The true average order value is much higher than the earlier
-- row-level average because many orders contain multiple products.
-- =====================================

WITH order_totals AS (
    SELECT
        order_id,
        SUM(sales) AS order_sales
    FROM superstore_orders
    GROUP BY order_id
)

SELECT
    ROUND(AVG(order_sales), 2) AS actual_average_order_value
FROM order_totals;



/*
=========================================
SECTION 8
Final Advanced Analysis
=========================================
*/


-- =====================================
-- Question 23
-- How do sub-categories rank by total profit?

-- Key Findings:
-- 1. Copiers rank as the most profitable sub-category.
-- 2. Phones and Accessories rank second and third.
-- 3. Tables rank last due to overall negative profit.
--
-- Business Insight:
-- Ranking functions make it easier to compare business
-- performance and identify the strongest and weakest
-- performing product groups.
-- =====================================

WITH subcategory_profit AS (
    SELECT
        sub_category,
        ROUND(SUM(profit), 2) AS total_profit
    FROM superstore_orders
    GROUP BY sub_category
)

SELECT
    sub_category,
    total_profit,
    RANK() OVER (ORDER BY total_profit DESC) AS profit_rank
FROM subcategory_profit
ORDER BY profit_rank;



-- =====================================
-- Question 24
-- Which product generates the highest sales within each category?

-- Key Findings:
-- Technology:
-- Canon imageCLASS 2200 Advanced Copier
--
-- Office Supplies:
-- Fellowes PB500 Electric Punch Plastic Comb Binding Machine
--
-- Furniture:
-- HON 5400 Series Task Chairs
--
-- Business Insight:
-- Identifying the highest-selling product within each category
-- helps businesses prioritize inventory and marketing efforts.

-- =====================================

WITH product_sales AS (
    SELECT
        category,
        product_name,
        ROUND(SUM(sales), 2) AS total_sales
    FROM superstore_orders
    GROUP BY category, product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)

SELECT
    category,
    product_name,
    total_sales
FROM ranked_products
WHERE product_rank = 1
ORDER BY total_sales DESC;




-- =====================================
-- Question 25
-- How have monthly sales changed over time?

-- Key Findings:
-- Monthly sales fluctuate throughout the year,
-- with noticeable seasonal increases during several
-- months across the dataset.
--
-- Business Insight:
-- Monthly trend analysis allows management to identify
-- seasonal demand and improve inventory planning.
-- =====================================

SELECT
    DATE_TRUNC('month', order_date)::date AS order_month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY order_month;




-- =====================================
-- Question 26
-- How does discount level affect profitability?

-- Key Findings:
-- • No Discount generated the highest profit.
-- • Low Discount remained profitable.
-- • Medium Discount resulted in an overall loss.
-- • High Discount produced the largest overall loss.
--
-- Business Insight:
-- Large discounts significantly reduce profitability.
-- The business should carefully evaluate discount
-- strategies before increasing promotional offers.

-- =====================================

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.20 THEN 'Low Discount'
        WHEN discount <= 0.40 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,
    COUNT(*) AS line_items,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_orders
GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.20 THEN 'Low Discount'
        WHEN discount <= 0.40 THEN 'Medium Discount'
        ELSE 'High Discount'
    END
ORDER BY total_profit DESC;



-- =====================================
-- Question 27
-- Which categories have the strongest profit margins?

-- Key Findings:
-- Technology: 17.40%
-- Office Supplies: 17.04%
-- Furniture: 2.49%
--
-- Business Insight:
-- Furniture generates substantial revenue but has a
-- much lower profit margin than the other categories

-- =====================================

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(profit) / NULLIF(SUM(sales), 0),
        2
    ) AS profit_margin_percent
FROM superstore_orders
GROUP BY category
ORDER BY profit_margin_percent DESC;



-- =====================================
-- Question 28
-- How do shipping modes compare by sales and profit?
-- Key Findings:
--  Standard Class handled the highest number of orders and
--  generated the highest total sales and profit.

--  First Class achieved the highest profit margin (13.93%)

--  Same Day shipping generated the fewest orders
--
-- Business Insight:
-- Standard Class is the primary shipping method and drives
-- the majority of revenue. 
-- First Class produces the strongest profit margin, 
-- suggesting premium shipping may provide
-- greater profitability despite lower sales volume.

-- =====================================

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(profit) / NULLIF(SUM(sales), 0),
        2
    ) AS profit_margin_percent
FROM superstore_orders
GROUP BY ship_mode
ORDER BY total_profit DESC;