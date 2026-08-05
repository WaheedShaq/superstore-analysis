-- Superstore schema
-- One row per order line item (~9,994 rows).
-- postal_code is TEXT to preserve leading zeros; money columns are NUMERIC; dates are DATE.

DROP TABLE IF EXISTS superstore;

CREATE TABLE superstore (
    row_id        INTEGER,
    order_id      TEXT,
    order_date    DATE,
    ship_date     DATE,
    ship_mode     TEXT,
    customer_id   TEXT,
    customer_name TEXT,
    segment       TEXT,
    country       TEXT,
    city          TEXT,
    state         TEXT,
    postal_code   TEXT,
    region        TEXT,
    product_id    TEXT,
    category      TEXT,
    sub_category  TEXT,
    product_name  TEXT,
    sales         NUMERIC,
    quantity      INTEGER,
    discount      NUMERIC,
    profit        NUMERIC
);
