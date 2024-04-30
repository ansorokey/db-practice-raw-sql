-- Group data based on common attribute values
-- Exercise Files > Chapter 7 > GroupBy_Start.sql
SELECT
    categories.CategoryDescription,
    COUNT(products.SKU) AS "Number of SKUs",
    MAX(products.Price) AS "Maximum Price",
    MIN(products.Price) AS "Minimum Price",
    AVG(products.Price) AS "Average Price"
FROM products.products
    JOIN products.categories
    ON products.CategoryID = categories.CategoryID
GROUP BY CategoryDescription
ORDER BY COUNT(products.SKU) DESC
;