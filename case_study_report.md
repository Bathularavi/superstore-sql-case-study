# Superstore SQL Case Study Report

**Author:** Ravi Bathula  
**Dataset:** Superstore Sales | 9,994 orders | Jan 2014 - Dec 2017  
**Tools:** MySQL, SQL (CTEs, Window Functions, Subqueries)

---

## Problem Statement

The Superstore is a US retail business selling Furniture, Office Supplies, and Technology products across 4 regions (East, West, Central, South). The business wanted to understand which products and customer segments are driving profit and which are destroying it, so that leadership could make targeted decisions on pricing, discounting, and inventory.

---

## Dataset Overview

- **Source:** Kaggle Superstore Dataset
- **Size:** 9,994 rows x 21 columns
- **Period:** January 2014 to December 2017
- **Key columns:** Sales, Profit, Discount, Category, Sub-Category, Region, Segment, Ship Mode
- **Quality issues found:** No nulls in key columns. Discount values range 0-0.8. Some orders have negative profit (loss-making).

---

## The 5 Business Questions

| # | Question | SQL Technique |
|---|----------|---------------|
| 1 | Which product sub-categories are loss-making and in which regions? | GROUP BY, HAVING, multi-condition WHERE |
| 2 | Who are the top 10 customers by total profit contributed? | Subquery, ORDER BY, LIMIT |
| 3 | What is the month-over-month revenue growth rate for each year? | CTEs, LAG window function, date functions |
| 4 | Which orders had discount above 40% and what was their total profit impact? | CASE WHEN, conditional aggregation |
| 5 | Rank all sub-categories by profit margin within each category | PARTITION BY, RANK(), calculated fields |

---

## Results

### Q1: Loss-Making Sub-Categories

**Finding:** Three sub-categories consistently lose money: Tables (-$17,725 total profit), Bookcases (-$3,473), and Supplies (-$1,189). Tables alone lose money in all 4 regions. Despite generating $207,000 in sales, Tables destroy $17,725 in profit — a -8.6% margin.

**Business implication:** Tables should be reviewed for pricing strategy or potentially removed from the product range in lower-performing regions.

### Q2: Top Customers by Profit

**Finding:** Sean Miller is the top profit-contributing customer at $25,043 across the 4-year period. The top 10 customers collectively contribute approximately $43,000 in profit — 15% of the total $286K profit from just 1% of the customer base.

**Business implication:** High-value customers deserve a premium retention strategy. Even losing one top customer represents a significant profit impact.

### Q3: Month-over-Month Revenue Growth

**Finding:** 2017 showed the strongest annual revenue performance with approximately +20% YoY growth. Q4 (October-December) consistently drives the highest monthly revenues each year. November is the single highest revenue month every year, driven by holiday and promotional demand.

**Business implication:** Q4 planning is critical. Inventory, logistics, and marketing budgets should be front-loaded for October-December. Q1 consistently underperforms — targeted promotions in January-March could reduce seasonality.

### Q4: High Discount Impact

**Finding:** Orders with discount above 40% generate a cumulative profit loss of -$63,000 across the dataset. These 1,019 orders represent 10.2% of all orders but are systemically loss-making. Average profit per order in the 40%+ discount band is -$61.8 compared to +$38.4 for undiscounted orders.

**Business implication:** Implement a hard cap at 30% maximum discount. Above 30%, the data shows consistent losses. Removing high-discount orders entirely would recover approximately $63,000 in profit.

### Q5: Sub-Category Profit Ranking

**Finding:** Copiers rank #1 in Technology with a 37% profit margin. Labels have the highest margin of any sub-category at 41%. At the bottom, Tables (-8.6%) and Bookcases (-3.5%) are the only sub-categories with negative margins. Within Office Supplies, Envelopes (21%) and Labels (41%) are the best performers — both under-invested compared to Binders.

**Business implication:** Investment should follow margin. Copiers and Labels deserve increased inventory and marketing. Tables and Bookcases need urgent pricing review.

---

## 3 Recommendations

1. **Cap all discounts at 30% maximum.** Orders above 40% discount generate -$63,000 in cumulative loss. Enforcing a 30% cap eliminates systematic discount-driven losses.

2. **Exit or re-price the Tables sub-category.** Tables lose $17,725 across all 4 regions with no profitable exceptions. Either raise prices to market rate or phase out the product line.

3. **Invest in Q4 capacity and reduce Q1 fragility.** Q4 drives 32-35% of annual revenue. Adding Q1 promotional budget (currently the weakest quarter) would reduce revenue seasonality without cannibalising peak-season performance.

---

## What I Would Investigate Next

If I had more data, I would investigate:

- **Customer churn rate** — how many of the top 10 customers in 2014 were still buying in 2017? Retention analysis requires customer-level time series data.
- **Regional pricing differences** — the data shows West is most profitable but does not explain why. Is it product mix, pricing, or lower discounting? A per-region discount analysis would answer this.
- **Ship mode profitability** — First Class shipping is expensive. Do First Class orders generate enough margin uplift to justify the cost, or are customers just selecting it without paying a premium?

---

*Part of the 90-Day Data Analyst Career System | By Ravi Bathula*  
*GitHub: [Bathularavi](https://github.com/Bathularavi)*
