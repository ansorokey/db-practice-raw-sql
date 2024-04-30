-- Renaming columns in the result set with the AS keyword
-- Exercise Files > Chapter 7 > AS_Start.sql
SELECT p.ProductName "Product Name",
    p.Size "Size (Ounces)",
    p.SKU "Product SKU",
    p.Price "Price (US Dollars)",
    c.CategoryDescription "Category Description",
    c.ProductLine "Product Line"
FROM products.products p
    JOIN products.categories c
        ON p.CategoryID = c.CategoryID
;