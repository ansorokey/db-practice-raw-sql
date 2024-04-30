-- Filter groups with HAVING
-- Exercise Files > Chapter 7 > Having_Start.sql
SELECT categories.CategoryDescription,
    COUNT(products.SKU) AS "Number of SKUs"
FROM products.products
    JOIN products.categories
    ON products.CategoryID = categories.CategoryID
GROUP BY CategoryDescription
ORDER BY COUNT(products.SKU) DESC
;