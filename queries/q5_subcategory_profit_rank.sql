-- ============================================================
-- QUESTION 5: Rank all sub-categories by profit margin
--             within each category
-- Technique: PARTITION BY, RANK(), calculated fields
-- Author: Ravi Bathula
-- ============================================================

-- Rank sub-categories by profit margin within each category
WITH subcategory_summary AS (
      SELECT
          Category,
          Sub_Category,
          COUNT(*)                              AS Order_Count,
          ROUND(SUM(Sales), 2)                  AS Total_Sales,
          ROUND(SUM(Profit), 2)                 AS Total_Profit,
          ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct
      FROM orders
      GROUP BY Category, Sub_Category
  )

SELECT
    Category,
    Sub_Category,
    Order_Count,
    Total_Sales,
    Total_Profit,
    Profit_Margin_Pct,
    RANK() OVER (
          PARTITION BY Category
          ORDER BY Profit_Margin_Pct DESC
      ) AS Rank_Within_Category,
    RANK() OVER (
          ORDER BY Profit_Margin_Pct DESC
      ) AS Overall_Rank
FROM subcategory_summary
ORDER BY Category, Rank_Within_Category;

-- Additional: Best and worst in each category
SELECT
    Category,
    Sub_Category,
    Profit_Margin_Pct,
    CASE
        WHEN RANK() OVER (PARTITION BY Category ORDER BY Profit_Margin_Pct DESC) = 1
        THEN 'Best in Category'
        WHEN RANK() OVER (PARTITION BY Category ORDER BY Profit_Margin_Pct ASC) = 1
        THEN 'Worst in Category'
        ELSE 'Mid'
    END AS Category_Position
FROM (
      SELECT
          Category,
          Sub_Category,
          ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct
      FROM orders
      GROUP BY Category, Sub_Category
  ) sub
ORDER BY Category, Profit_Margin_Pct DESC;

-- FINDING: Copiers (37% margin) = best in Technology.
-- Labels (41% margin) = best overall across all sub-categories.
-- Tables (-9% margin) = worst performing sub-category in Furniture.
