# 🗃️ Superstore SQL Case Study

![SQL](https://img.shields.io/badge/Tool-SQL-orange?style=flat&logo=postgresql&logoColor=white)
![Dataset](https://img.shields.io/badge/Dataset-Superstore_Sales-blue)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

## 📌 Project Overview

SQL case study answering **5 real business questions** using the Superstore Sales dataset. Demonstrates advanced SQL skills from basic SELECT queries through to CTEs, window functions, and subqueries.

**Dataset:** 9,994 orders | US Retail | Jan 2014 – Dec 2017

---

## ❓ The 5 Business Questions

| # | Business Question | SQL Technique |
|---|-------------------|---------------|
| 1 | Which product sub-categories are loss-making and in which regions? | GROUP BY, HAVING, multi-condition WHERE |
| 2 | Who are the top 10 customers by total profit contributed? | Subquery, ORDER BY, LIMIT |
| 3 | What is the month-over-month revenue growth rate for each year? | CTEs, LAG window function, date functions |
| 4 | Which orders had discount above 40% — and what was their total profit impact? | CASE WHEN, SUMIFS logic in SQL |
| 5 | Rank all sub-categories by profit margin within each category | PARTITION BY, RANK(), calculated fields |

---

## 🔑 Key SQL Concepts Used

- SELECT, WHERE, GROUP BY, ORDER BY, HAVING
- INNER JOIN, LEFT JOIN
- Subqueries and correlated subqueries
- Common Table Expressions (CTEs)
- Window functions: ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD()
- PARTITION BY for group-level window calculations
- CASE WHEN for conditional logic
- Date functions for time-series analysis

---

## 💡 Key Findings

| Question | Finding |
|----------|---------|
| Loss-making sub-categories | Tables, Bookcases, Supplies lose money in all regions |
| Top customer by profit | Sean Miller contributed $25,000+ in profit |
| Fastest growth year | 2017 had strongest revenue growth (+20% YoY) |
| High-discount impact | Orders >40% discount = -$63,000 total profit loss |
| Best sub-category margin | Copiers: 37% margin (best in Technology) |

---

## 📂 Repository Structure

```
superstore-sql-case-study/
├── README.md
├── schema/
│   └── superstore_create.sql     # Table creation script
├── queries/
│   ├── q1_loss_making_subcategories.sql
│   ├── q2_top_customers_by_profit.sql
│   ├── q3_monthly_revenue_growth.sql
│   ├── q4_high_discount_impact.sql
│   └── q5_subcategory_profit_rank.sql
└── case_study_report.md          # Written findings document
```

---

## 🛠️ Skills Demonstrated

- Database setup and table design
- SQL query writing from basic to advanced
- CTEs for readable, maintainable query structure
- Window functions for rankings and trend analysis
- Business question framing and SQL-based answering
- Documented case study with written findings

---
*Part of the 90-Day Data Analyst Career System | By Ravi Bathula*
