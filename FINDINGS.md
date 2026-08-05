# Superstore — Findings

> Draft. Two findings so far; more to come. Numbers are from the Sample Superstore dataset
> (~9,994 order line items).

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
