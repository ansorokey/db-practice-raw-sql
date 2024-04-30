-- Group data based on common attribute values
-- Exercise Files > Chapter 7 > GroupBy_Start.sql
SELECT
    categories.CategoryDescription,
    products.SKU
FROM products.products
    JOIN products.categories
    ON products.CategoryID = categories.CategoryID
;