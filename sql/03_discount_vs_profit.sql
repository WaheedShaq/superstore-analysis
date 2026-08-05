-- =============================================================
-- Finding #1: Where does discounting stop being profitable?
-- =============================================================

-- Step 1 — Eyeball the worst-losing line items.
-- Sorted by profit ascending; every deep loss is paired with a heavy discount.
SELECT category, sales, profit, quantity, discount
FROM superstore
ORDER BY profit;

-- Step 2 — Average profit at each discount level (the flip point).
-- Positive through 0.20; turns negative at 0.30 and stays negative.
SELECT discount, AVG(profit) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

-- Step 3 — Same cut, split by category, WITH counts.
-- Count matters: several high-profit-looking cells are only n=2 or n=5 (noise).
-- The two real discount levels the business uses are 0 and 0.20 (thousands of rows each).
SELECT category, discount, AVG(profit) AS avg_profit, COUNT(*)
FROM superstore
GROUP BY discount, category
ORDER BY discount;
