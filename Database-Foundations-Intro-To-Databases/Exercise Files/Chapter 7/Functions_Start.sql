-- Modify data with built-in functions
-- Exercise Files > Chapter 7 > Functions_Start.sql
SELECT Price
FROM products.products;

-- View statistical information about pricing
SELECT
    MAX(Price) AS "Maximum Price",
    MIN(Price) AS "Minimum Price",
    AVG(Price) AS "Average Price"
FROM products.products;