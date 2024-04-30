-- Filter groups with HAVING
-- Exercise Files > Chapter 7 > Having_Start.sql
SELECT categories.CategoryDescription,
    COUNT(products.SKU) AS "Number of SKUs"
FROM products.products
    JOIN products.categories
    ON products.CategoryID = categories.CategoryID
WHERE products.Price > 15
GROUP BY CategoryDescription
--HAVING CategoryDescription = 'Olive Oils'
--HAVING NOT CategoryDescription = 'Bath and Beauty'
HAVING COUNT(products.SKU) < 10
ORDER BY COUNT(products.SKU) DESC
;