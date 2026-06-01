-- ============================================================
-- QUESTION 4: Which orders had discount above 40% and what
--             was their total profit impact?
-- Technique: CASE WHEN, conditional aggregation, filtering
-- Author: Ravi Bathula
-- ============================================================

-- Step 1: Analyse profit by discount band
SELECT
    CASE
        WHEN Discount = 0          THEN '0% - No Discount'
        WHEN Discount <= 0.10      THEN '1-10%'
        WHEN Discount <= 0.20      THEN '11-20%'
        WHEN Discount <= 0.30      THEN '21-30%'
        WHEN Discount <= 0.40      THEN '31-40%'
        WHEN Discount <= 0.50      THEN '41-50%'
        ELSE                            'Over 50%'
    END AS Discount_Band,
    COUNT(*)                              AS Order_Count,
    ROUND(SUM(Sales), 2)                  AS Total_Sales,
    ROUND(SUM(Profit), 2)                 AS Total_Profit,
    ROUND(AVG(Profit), 2)                 AS Avg_Profit_Per_Order,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2)  AS Profit_Margin_Pct,
    COUNT(CASE WHEN Profit < 0 THEN 1 END) AS Loss_Orders,
    ROUND(COUNT(CASE WHEN Profit < 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS Loss_Pct
FROM orders
GROUP BY Discount_Band
ORDER BY MIN(Discount);

-- Step 2: Specific focus on >40% discount orders
SELECT
    Order_ID,
    Customer_Name,
    Category,
    Sub_Category,
    Region,
    ROUND(Sales, 2)    AS Sales,
    ROUND(Discount, 2) AS Discount,
    ROUND(Profit, 2)   AS Profit
FROM orders
WHERE Discount > 0.40
ORDER BY Profit ASC
LIMIT 20;

-- Step 3: Total impact of high-discount orders
SELECT
    COUNT(*) AS High_Discount_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit_Loss,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS Pct_Of_All_Orders
FROM orders
WHERE Discount > 0.40;

-- FINDING: Orders with >40% discount generate -$63,000 total profit loss.
-- These 1,019 orders represent 10.2% of all orders but destroy profitability.
-- Recommendation: Cap maximum discount at 30% to eliminate systematic losses.
