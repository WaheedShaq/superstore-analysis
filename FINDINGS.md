# Superstore — Findings

Three findings from the Sample Superstore dataset (~9,994 order line items, 2014–2017). Each write-up
is the takeaway; the table under it is the evidence.

## Finding #1 — Discounts above 20% lose money

After reviewing discounts across the whole dataset, made a finding that having discounts above 20%
results in money loss, so the recommendation is to keep it capped at 20% to avoid profit loss. Worth
noting this is based on average profit, so a high-margin product might survive a deeper cut — 20% is
the safe default, not a hard rule for every single item.

| discount | avg profit per line |
|----------|---------------------|
| 0 – 0.20 | positive (+$25 to +$96) |
| 0.30 and up | negative (every level) |

Average profit crosses zero between 20% and 30% discount, and it holds across all three categories.
The business really only uses two discount levels at scale — 0% and 20% (thousands of orders each);
the odd levels in between (0.10, 0.15, 0.30) are tiny one-offs and are noise.

## Finding #2 — Central region: least profitable, and it's a discounting problem

Studied region sales and profits and found that Central is the one with the least amount of profit
because of high discount percentages — 24% on average was found to be the culprit, which connects
straight back to the first finding. Recommendation is to cap Central's discounts at 20% and monitor
both the margin and the sales volume next year, not just profit. If volume drops after the cap, that
means those sales were being bought by the discounts and we'd need a different approach. Keep in mind
24% is an average, so it could be the whole region running high or a handful of big fire-sales
dragging it up.

| region | total sales | total profit | margin |
|--------|-------------|--------------|--------|
| Central | $501K | $39.7K | **7.9%** |
| South | $391K | $46.7K | 11.9% |
| East | $679K | $91.5K | 13.5% |
| West | $725K | $108.4K | 14.9% |

| region | avg discount |
|--------|-------------|
| West | 10.9% |
| East | 14.5% |
| South | 14.7% |
| **Central** | **24.0%** |

Central sells more than South but earns less profit, at roughly half everyone else's margin — and
it's the only region whose average discount sits above the 20% break-even line.

## Finding #3 — Peak season is Sep/Nov/Dec, and it's organic — protect margin

Looked at the months the business sells the most and found that Sep, Nov and Dec are the top three
every year from 2014 to 2017 — and interestingly October dips right between them, so it's not a clean
holiday ramp, it's a business budget cycle since the company sells office supplies and furniture B2B.
November looked like the single best month at first, but that was one huge November in 2017 skewing
it, so the real finding is the Sep/Nov/Dec window, not one month. Also compared discounts on those
months — they run 14–16%, already under the 20% cap, and since the demand is there without
discounting, keeping them where they are or lowering them will make us more profit, not less. Only
caveat is it's four years of one business, so the budget-cycle reasoning is my interpretation more
than something the data flat-out proves.

| month | sales | profit | avg discount | margin |
|-------|-------|--------|--------------|--------|
| Sep | $308K | $36.9K | 14.9% | 12.0% |
| Nov | $352K | $35.5K | 15.8% | 10.1% |
| Dec | $325K | $43.4K | 15.0% | 13.3% |

Note November: the most sales of the three, but less profit than December, because it already
discounts slightly harder — the one peak month already showing margin stress.
