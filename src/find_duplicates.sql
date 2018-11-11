SELECT * FROM northwind.products;

-- count duplicates
SELECT COUNT(DISTINCT product_code), COUNT(DISTINCT id), COUNT(DISTINCT product_name), COUNT(DISTINCT id)
FROM northwind.products;

-- show duplicates by product code
SELECT product_name, product_code, COUNT(product_code) 
FROM northwind.products
GROUP BY product_code
HAVING COUNT(product_code) > 1;

-- show duplicates by product name
SELECT product_name, product_code, COUNT(product_name) 
FROM northwind.products
GROUP BY product_name
HAVING COUNT(product_name) > 1;

-- ok, it seems like there are two types of duplicates:
-- 1. duplicates in the product name, and
-- 2. duplicates in the product code
-- The two are not exactly the same. To avoid removing too many tuples, let's only 
-- remove the duplicates in the name and allow duplicates in the product code as it seems these are different products,
-- e.g. NWTJP-6 has a different name and different prices

SELECT *
FROM northwind.products
WHERE id IN
(
    SELECT MIN(id)
    FROM northwind.products
    GROUP BY product_name
);
