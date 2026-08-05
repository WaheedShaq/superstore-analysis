# Superstore — Findings

> Draft. Three findings. Numbers are from the Sample Superstore dataset
> (~9,994 order line items, 2014–2017).

## Finding #1 — Discounts above 20% lose money

Sorting line items by profit shows every large loss paired with a heavy discount. Grouping
average profit by discount level makes the pattern precise:

| discount | avg profit |
|----------|-----------|
| 0 – 0.20 | positive (+$25 to +$96) |
| 0.30 and up | negative (every level) |

Average profit crosses zero **between 20% and 30% discount**. Splitting by category (with row
counts) confirms it holds across all three categories — and shows the business really only uses
two discount levels at scale: 0% and 20% (thousands of orders each). The odd levels in between
(0.10, 0.15, 0.30) are tiny one-offs and should be ignored as noise.

**Recommendation:** Cap discounts at 20%. It's the last profitable level *and* an existing
standard price point (~2,200+ orders). Every real discount tier above it loses money on average.

**Caveat:** These are *average* profits. A specific high-margin product could survive a deeper
discount, so 20% is the right default policy, not an absolute rule.

## Finding #2 — The Central region's margin problem is a discounting problem

Region-level roll-up (size and efficiency together):

| region | total sales | total profit | margin |
|--------|-------------|--------------|--------|
| Central | $501K | $39.7K | **7.9%** |
| South | $391K | $46.7K | 11.9% |
| East | $679K | $91.5K | 13.5% |
| West | $725K | $108.4K | 14.9% |

Central is the least healthy region: it **sells more than South but earns less profit**, at
roughly half everyone else's margin. The cause connects straight back to Finding #1 — average
discount by region:

| region | avg discount |
|--------|-------------|
| West | 10.9% |
| East | 14.5% |
| South | 14.7% |
| **Central** | **24.0%** |

Central is the **only** region whose *average* discount sits above the 20% break-even line — it
discounts at nearly double the rate of every other region, and past the point where the average
order stops making money.

**Recommendation:** Cap Central's discounts at 20% as a pilot, and monitor **two** numbers, not
one — margin *and* sales volume. If margin rises and volume holds, the discounting was sloppy and
the cap should roll out. If volume drops sharply, Central may have been buying those sales
(price-sensitive market) and needs a different lever.

**Caveat:** 24% is an average — it could be a whole region running high, or a normal region plus a
pile of extreme fire-sales dragging the mean up. That distinction changes the fix, and the data
here doesn't settle it.

## Finding #3 — Peak season is Sep/Nov/Dec, and it's organic — protect margin, don't discount into it

Ranking all 12 months by total sales pooled across years points at November, then December, then
September. But that "November is #1" headline **doesn't survive** a per-year check — it was
inflated by one huge November 2017 ($118K, the single biggest month in the dataset). Breaking
sales out by year shows the real, robust pattern:

**Sep, Nov, and Dec are the top three months in every single year (2014–2017).** The #1 among them
rotates (Sep in 2014, Nov in 2015, Dec in 2016, Nov in 2017), so the reliable finding is the
*window*, not a single month. Note the odd shape: September and November/December are strong but
October dips between them — consistent with a **business budget cycle** (this company sells to
businesses, not holiday shoppers), not consumer holiday shopping.

Do the peak months need discounts to hit those sales? No — sales, profit, and discount by month:

| month | sales | profit | avg discount | margin |
|-------|-------|--------|--------------|--------|
| Sep | $308K | $36.9K | 14.9% | 12.0% |
| Nov | $352K | $35.5K | 15.8% | 10.1% |
| Dec | $325K | $43.4K | 15.0% | 13.3% |

The peak months run ~15% discount — in line with, or *below*, the quiet months — yet post the
highest sales. Demand is organic. And note **November**: the most sales of the three but *less
profit than December*, because it already discounts slightly harder. It's the one month already
showing margin stress.

**Recommendation:** Treat Sep–Dec as a demand window to **capture, not buy**. Stock inventory
ahead of it; run **awareness** campaigns (back-to-office / year-end-budget B2B messaging), not
price promotions. Hold discounts flat or trim them during the peak — demand isn't price-sensitive
here, so a lower discount barely dents volume and adds profit directly. Deeper discounting, if ever
tested, belongs in the dead months (Jan/Feb), not the peak.

**Why not discount into the peak:** Finding #1 showed 20% is the break-even *edge*, not a target.
Pushing peak-month discounts from ~15% toward 20% would thin margins on the highest-volume months —
paying customers to buy what they'd buy anyway. That's the Finding #2 (Central) mistake in a
different guise.

**Caveat:** The dataset is four years; the Sep/Nov/Dec pattern is consistent across all of them,
but four points is still a short history, and this is one (sample) business. The *why* (budget
cycle) is a reasoned interpretation, not something the data proves directly.
