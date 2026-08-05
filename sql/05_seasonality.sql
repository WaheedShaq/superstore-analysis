-- =============================================================
-- Finding #3: Is there a seasonal sales pattern, and can we act on it?
-- =============================================================

-- Step 1 — Rank all 12 months by total sales (all years pooled).
-- Nov, Dec, Sep are the top three. (Note: pooling years hides whether the
-- pattern actually repeats -- that's what Step 2 is for.)
SELECT EXTRACT(MONTH FROM order_date) AS month,
       SUM(sales) AS total_sales
FROM superstore
GROUP BY month
ORDER BY total_sales DESC;

-- Step 2 — Break it out by year to prove the pattern repeats.
-- Order by year, month so each year reads together.
-- Result: Sep/Nov/Dec are the top 3 in EVERY year (2014-2017), but the #1 among
-- them rotates (Sep '14, Nov '15, Dec '16, Nov '17). "November is #1 overall" was
-- an artifact of one huge Nov 2017 ($118K, the single biggest month in the data) --
-- so the robust claim is the Sep/Nov/Dec *window*, not any single month.
SELECT EXTRACT(YEAR  FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month,
       SUM(sales) AS total_sales
FROM superstore
GROUP BY year, month
ORDER BY year, month;

-- Step 3 — Sales, profit, and avg discount by month together.
-- Checks whether the peak months need discounting to hit their sales.
-- They don't: Sep/Nov/Dec run ~15% discount (in line with, or below, quiet
-- months) yet post the highest sales -- demand is organic (business budget
-- cycle), not price-driven. Note Nov: most sales but LESS profit than Dec,
-- because it already discounts slightly harder (15.8% vs 15.0%).
SELECT EXTRACT(MONTH FROM order_date) AS month,
       SUM(sales)    AS total_sales,
       SUM(profit)   AS total_profit,
       AVG(discount) AS avg_discount
FROM superstore
GROUP BY month
ORDER BY month;
