-- Load the Superstore CSV into the superstore table.
-- Run from psql (\copy is a client-side command). Adjust the path to your checkout.
-- The source CSV is WIN1252-encoded (has non-UTF8 characters), hence ENCODING 'WIN1252'.

\copy superstore FROM 'data/Sample - Superstore.csv' WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252');

-- Expect: COPY 9994
