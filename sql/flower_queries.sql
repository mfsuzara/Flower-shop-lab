-- Flower Shop Lab: starter SQL queries
-- Tables: sales_log (one row per person asked), costs (one row per flower purchase)

-- 1. How many people did I ask, and how many said yes?
SELECT COUNT(*) AS people_asked,
       SUM(said_yes = 'Yes') AS said_yes,
       ROUND(100.0 * SUM(said_yes = 'Yes') / COUNT(*), 1) AS yes_rate_pct
FROM sales_log
WHERE location = 'Campus';

-- 2. Yes rate for each selling day
SELECT date, weather, time,
       COUNT(*) AS people_asked,
       SUM(said_yes = 'Yes') AS said_yes,
       ROUND(100.0 * SUM(said_yes = 'Yes') / COUNT(*), 1) AS yes_rate_pct
FROM sales_log
WHERE location = 'Campus'
GROUP BY date, weather, time
ORDER BY date;

-- 3. Sales and items sold each day
SELECT date,
       SUM(quantity) AS items_sold,
       SUM(paid) AS sales
FROM sales_log
WHERE said_yes = 'Yes'
GROUP BY date
ORDER BY date;

-- 4. How do people pay?
SELECT payment,
       COUNT(*) AS buyers,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM sales_log
                                 WHERE said_yes = 'Yes' AND payment IS NOT NULL), 1) AS pct
FROM sales_log
WHERE said_yes = 'Yes' AND payment IS NOT NULL
GROUP BY payment
ORDER BY buyers DESC;

-- 5. Average spend per buyer, by item type
SELECT item,
       COUNT(*) AS buyers,
       ROUND(AVG(paid), 2) AS avg_paid
FROM sales_log
WHERE said_yes = 'Yes'
GROUP BY item;

-- 6. Total sales vs. total costs (profit)
SELECT (SELECT SUM(paid) FROM sales_log) AS total_sales,
       (SELECT SUM(cost) FROM costs) AS total_costs,
       ROUND((SELECT SUM(paid) FROM sales_log) - (SELECT SUM(cost) FROM costs), 2) AS profit;

-- 7. Who are the flowers for? (only rows where it was logged)
SELECT who_for, COUNT(*) AS buyers
FROM sales_log
WHERE said_yes = 'Yes' AND who_for IS NOT NULL
GROUP BY who_for
ORDER BY buyers DESC;
