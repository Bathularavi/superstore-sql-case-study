-- ============================================================
-- QUESTION 1: Which product sub-categories are loss-making
--             and in which regions?
-- Technique: GROUP BY, HAVING, multi-condition WHERE
-- Author: Ravi Bathula
-- ============================================================

-- Step 1: Identify all sub-categories with negative total profit
SELECT
    Sub_Category,
    Region,
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*)              AS Order_Count,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct
FROM orders
GROUP BY Sub_Category, Region
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- Step 2: Summary - which sub-categories lose money overall?
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct,
    COUNT(DISTINCT Region) AS Regions_With_Losses
FROM orders
GROUP BY Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- FINDING: Tables (-$17,725), Bookcases (-$3,473), and Supplies (-$1,189)
-- are loss-making sub-categories. Tables lose money in all 4 regions.
