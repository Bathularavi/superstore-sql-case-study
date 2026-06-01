-- ============================================================
-- QUESTION 2: Who are the top 10 customers by total profit?
-- Technique: Subquery, ORDER BY, LIMIT, aggregate functions
-- Author: Ravi Bathula
-- ============================================================

-- Top 10 customers by total profit contributed
SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    Region,
    COUNT(DISTINCT Order_ID)        AS Total_Orders,
    ROUND(SUM(Sales), 2)            AS Total_Sales,
    ROUND(SUM(Profit), 2)           AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Pct,
    ROUND(AVG(Sales), 2)            AS Avg_Order_Value
FROM orders
GROUP BY Customer_ID, Customer_Name, Segment, Region
ORDER BY Total_Profit DESC
LIMIT 10;

-- Additional: Compare top vs bottom customers
-- Top 10 vs Bottom 10 profit to understand customer value spread
SELECT 'Top 10' AS Group_Label,
    ROUND(SUM(Total_Profit), 2) AS Combined_Profit
FROM (
      SELECT Customer_Name, SUM(Profit) AS Total_Profit
      FROM orders
      GROUP BY Customer_Name
      ORDER BY Total_Profit DESC
      LIMIT 10
  ) top_customers

UNION ALL

SELECT 'Bottom 10' AS Group_Label,
    ROUND(SUM(Total_Profit), 2) AS Combined_Profit
FROM (
      SELECT Customer_Name, SUM(Profit) AS Total_Profit
      FROM orders
      GROUP BY Customer_Name
      ORDER BY Total_Profit ASC
      LIMIT 10
  ) bottom_customers;

-- FINDING: Sean Miller is the top customer contributing $25,043 in profit.
-- Top 10 customers contribute approx 15% of total profit ($286K).
