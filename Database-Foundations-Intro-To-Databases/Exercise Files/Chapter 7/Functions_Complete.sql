-- Modify data with built-in functions
-- Exercise Files > Chapter 7 > Functions_Start.sql
SELECT Price
FROM products.products;

-- View statistical information about pricing
SELECT
    MAX(Price) AS "Maximum Price",
    MIN(Price) AS "Minimum Price",
    ROUND(AVG(Price), 2) AS "Average Price"
FROM products.products;

-- Find the products with the highest price
SELECT MAX(Price)
FROM products.products;

SELECT ProductName, Size, Price
FROM products.products
WHERE Price = 
    (SELECT MAX(Price)
     FROM products.products
    )
;