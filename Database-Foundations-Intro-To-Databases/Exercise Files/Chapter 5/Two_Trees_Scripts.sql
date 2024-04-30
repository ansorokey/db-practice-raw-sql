-- Remove existing database objects if they're present in the database
-- This resets the Two Trees database to an empty state
DROP TABLE IF EXISTS products.products;
DROP TABLE IF EXISTS products.categories;
DROP SCHEMA IF EXISTS products;

-- Create the products schema
GO -- comment this line out when running on PostgreSQL
CREATE SCHEMA products;
GO -- comment this line out when running on PostgreSQL

-- Create a table for the Two Trees product data
CREATE TABLE products.products (
    SKU CHAR(7) NOT NULL PRIMARY KEY,
    ProductName CHAR(50) NOT NULL,
    CategoryID INT,
    Size INT,
    Price DECIMAL(5,2) NOT NULL
);

-- Create a table for the Two Trees category data
CREATE TABLE products.categories (
    CategoryID INT PRIMARY KEY,
    CategoryDescription CHAR(50),
    ProductLine CHAR(25)
);

-- Add data to the products table
INSERT INTO products.products
    (SKU, ProductName, CategoryID, Size, Price)
VALUES
    ('FCP008', 'First Cold Press', 1, 8, 8.99),
    ('BI008', 'Basil-Infused EVO', 2, 8, 10.99),
    ('GI016', 'Garlic-Infused EVO', 2, 16, 15.99),
    ('OGEC004', 'Olive Glow Eye Cream', 3, 4, 18.99)
;

-- Add data to the categories table
INSERT INTO products.categories
    (CategoryID, CategoryDescription, ProductLine)
VALUES
    (1, 'Olive Oils', 'Gourmet Chef'),
    (2, 'Flavor Infused Oils', 'Gourmet Chef'),
    (3, 'Bath and Beauty', 'Cosmetics')
;

-- Review the data that's been entered
SELECT * FROM products.products;
SELECT * FROM products.categories;