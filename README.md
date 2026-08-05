# Superstore Sales & Profit Analysis

SQL analysis of the Sample Superstore dataset (~9,994 order line items) in PostgreSQL, looking at
what drives profit and where the business loses money.

## Findings so far

1. **Discounts above 20% lose money** — average profit crosses zero between 20% and 30% discount,
   across every category. Recommendation: cap discounts at 20%.
2. **The Central region's low margin is a discounting problem** — Central runs a 7.9% margin (half
   the other regions) and is the only region whose *average* discount (24%) sits above the 20%
   break-even line.

Full write-up with tables and caveats in [FINDINGS.md](FINDINGS.md). *More findings in progress.*

## Repo layout

```
data/   Sample - Superstore.csv (Kaggle: vivek468/superstore-dataset-final)
sql/    01_schema.sql  02_load.sql  03_discount_vs_profit.sql  04_region_profitability.sql
```

## Reproduce

```bash
createdb superstore
psql -d superstore -f sql/01_schema.sql
psql -d superstore -f sql/02_load.sql   # \copy expects to run from the repo root
```

Then run the analysis scripts in `sql/`.

## Tools

PostgreSQL 18, pgAdmin.
