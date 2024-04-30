-- Add columns that calculate values
-- Exercise Files > Chapter 7 > Math_Start.sql
SELECT SKU,
    ProductName,
    CategoryID,
    Size,
    Price,
    '8.5%' AS TaxRate,
    Price * 0.085 AS SalesTax,
    Price + (Price * 0.085) AS TotalPrice
FROM products.products;
