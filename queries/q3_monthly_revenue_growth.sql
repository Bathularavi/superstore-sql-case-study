-- ============================================================
-- QUESTION 3: What is the month-over-month revenue growth
--             rate for each year?
-- Technique: CTEs, LAG window function, date functions
-- Author: Ravi Bathula
-- ============================================================

-- Step 1: Aggregate monthly revenue using CTE
WITH monthly_revenue AS (
      SELECT
          YEAR(Order_Date)  AS Year,
          MONTH(Order_Date) AS Month,
          ROUND(SUM(Sales), 2) AS Monthly_Sales
      FROM orders
      GROUP BY YEAR(Order_Date), MONTH(Order_Date)
      ORDER BY Year, Month
  ),

-- Step 2: Use LAG to get previous month revenue
revenue_with_lag AS (
      SELECT
          Year,
          Month,
          Monthly_Sales,
          LAG(Monthly_Sales) OVER (
              PARTITION BY Year ORDER BY Month
          ) AS Prev_Month_Sales
      FROM monthly_revenue
  )

-- Step 3: Calculate MoM growth rate
SELECT
    Year,
    Month,
    Monthly_Sales,
    Prev_Month_Sales,
    CASE
        WHEN Prev_Month_Sales IS NULL THEN NULL
        ELSE ROUND(
              (Monthly_Sales - Prev_Month_Sales) / Prev_Month_Sales * 100,
              2
          )
    END AS MoM_Growth_Pct
FROM revenue_with_lag
ORDER BY Year, Month;

-- FINDING: 2017 showed the strongest YoY growth at +20% overall.
-- Q4 (Oct-Dec) consistently shows the highest monthly revenues each year.
-- November peaks every year due to holiday/Black Friday effect.
