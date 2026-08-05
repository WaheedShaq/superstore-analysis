-- =============================================================
-- Finding #2: Which region is least profitable, and why?
-- =============================================================

-- Step 1 — Robustness check: does Finding #1 hold in every region?
-- Sorted by avg_profit; every deep loss is a high discount, in all four regions.
SELECT region, category, discount, AVG(profit) AS avg_profit, COUNT(*)
FROM superstore
GROUP BY region, category, discount
ORDER BY avg_profit;

-- Step 2 — Region-level roll-up: size AND efficiency in one table.
-- Central sells MORE than South ($501K vs $391K) but earns LESS profit
-- ($39.7K vs $46.7K) — margin 7.9% vs everyone else's 12-15%.
SELECT region,
       SUM(sales)               AS total_sales,
       SUM(profit)              AS total_profit,
       SUM(profit) / SUM(sales) AS margin
FROM superstore
GROUP BY region
ORDER BY margin;

-- Step 3 — The "why": average discount by region.
-- Central averages 24% discount vs 11-15% elsewhere -- the ONLY region whose
-- average discount sits above the 20% break-even line from Finding #1.
SELECT region, AVG(discount) AS avg_discount
FROM superstore
GROUP BY region
ORDER BY avg_discount;
