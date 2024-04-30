-- Renaming columns in the result set with the AS keyword
-- Exercise Files > Chapter 7 > AS_Start.sql
SELECT products.ProductName,
    products.Size,
    products.SKU,
    products.Price,
    categories.CategoryDescription,
    categories.ProductLine
FROM products.products
    JOIN products.categories
        ON products.CategoryID = categories.CategoryID
;