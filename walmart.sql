-- Walmart Project Queries

SELECT * FROM walmart;

-- DROP TABLE walmart

-- DROP TABLE walmart
SELECT COUNT(*) FROM walmart;

SELECT 
	 payment_method,
	 COUNT(*)
FROM walmart
GROUP BY payment_method

SELECT 
	COUNT(DISTINCT branch) 
FROM walmart;

SELECT MIN(quantity) FROM walmart;
-- different types of payment and no of transactions
SELECT payment_method,
COUNT(*) FROM walmart
GROUP BY payment_method;
--different types of branch
SELECT COUNT(DISTINCT branch) FROM walmart;
-- max and min quantities sold 
SELECT MAX(quantity), MIN(quantity)FROM walmart;
--find different payment methods and the number of transactions, number of quantities sold 
SELECT payment_method,
COUNT(*) AS no_payments,
SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;
--Identity the highest-rated category in each branch, displaying the branch, category AVG ranting
SELECT * FROM (
SELECT branch, category,
AVG(rating) as avg_rating,
RANK() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) AS RANK
FROM walmart
GROUP BY 1,2 
) 
WHERE RANK = 1;

-- Identity the busiest day for each branch based 	on the number of sales

SELECT * FROM
(SELECT branch,
       TO_CHAR(date, 'Day') AS day_name,
	   COUNT(*) AS no_transactions,
	   RANK() OVER(PARTITION BY branch ORDER BY COUNT(*)DESC) AS RANK
FROM walmart
GROUP BY 1,2
)
WHERE RANK = 1;
--Calculate the total quantity of items sold per payment method.List payment_method and total_quantity
SELECT payment_method,
COUNT(*) AS no_payments,
SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;
--Determine the average, minimum and maximum rating of products for each city,
--list the city, average_rating,min_rating and max_rating.

SELECT 
      city,
	  category,
	  MIN(rating) as min_rating,
	  MAX(rating) as max_rating,
	  AVG(rating) as avg_rating
FROM walmart
GROUP BY 1,2;
---calculate the total profit for each category by considering total_profit as
--(unit_price*quantity*profit_margin).List category and total_profit,ordered from highest to lowest profit.
SELECT
     category,
	 SUM(total) as revenue,
	 SUM(total*profit_margin) AS profit
FROM walmart
GROUP BY 1;
--Determine the most common payment method for each branch.
--display branch and the preferred payment method.
WITH cte
AS
(SELECT 
      branch,
	  payment_method,
	  COUNT(*) as total_trans,
	  RANK() OVER(PARTITION BY branch ORDER BY COUNT(*)DESC) as rank
FROM walmart
GROUP BY 1,2
)
SELECT *
FROM cte
WHERE RANK = 1;
--categorize sales into 3 groups morning,afternoon, evening find out which of the shift and number of invoices
SELECT 
   branch,
      CASE
	      WHEN EXTRACT (HOUR FROM (time::time)) < 12 THEN 'Morning'
		  WHEN EXTRACT (HOUR FROM (time::time)) BETWEEN 12 AND 17 THEN 'Afternoon'
		  ELSE 'Evening'
		END day_time,
		Count(*)
FROM walmart
GROUP By 1,2
ORDER BY 1,3 DESC;
--Identify 5 branch with highest decrese eatio in
--revenue compare to last year (current year 2023 and last year 2022)
SELECT *
EXTRACT(YEAR FROM TO_DATE(date,'DD/MM/YY')) as formated_date
FROM walmart

-- 2022 sales
WITH revenue_2022 AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM date) = 2022  -- Removed TO_DATE()
    GROUP BY branch
),
revenue_2023 AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM date) = 2023  -- Removed TO_DATE()
    GROUP BY branch
)
SELECT 
    ls.branch,
    ls.revenue AS last_year_revenue,
    cs.revenue AS cr_year_revenue,
    ROUND(
        (ls.revenue - cs.revenue)::NUMERIC / ls.revenue::NUMERIC * 100, 
        2
    ) AS rev_dec_ratio
FROM revenue_2022 AS ls
JOIN revenue_2023 AS cs
ON ls.branch = cs.branch
WHERE ls.revenue > cs.revenue
ORDER BY 4 DESC
LIMIT 5;
		
