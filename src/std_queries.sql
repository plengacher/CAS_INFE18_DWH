-- which products were sold the most by units
SELECT prod.product_name AS Name,
       prod.product_code AS Code,
       SUM(sales.quantity) AS UnitsSold
FROM dwh.product_dim AS prod,
     dwh.sales_facts AS sales
WHERE prod.id = sales.product_id
GROUP BY prod.product_name
ORDER BY SUM(sales.quantity) DESC LIMIT 10;

-- which products generate the highest revenue
SELECT prod.product_name AS Name,
       prod.product_code AS Code,
       SUM(sales.quantity*sales.unit_price) AS Revenue
FROM dwh.product_dim AS prod,
     dwh.sales_facts AS sales
WHERE prod.id = sales.product_id
GROUP BY prod.product_name
ORDER BY SUM(sales.quantity*sales.unit_price) DESC LIMIT 10;

-- which products have the highest margine
SELECT prod.product_name AS Name,
       prod.product_code AS Code,
       SUM(sales.unit_price - prod.standard_cost) AS Margine
FROM dwh.product_dim AS prod,
     dwh.sales_facts AS sales
WHERE prod.id = sales.product_id
GROUP BY prod.product_name
ORDER BY SUM(sales.unit_price - prod.standard_cost) DESC LIMIT 10;

-- to which customer did we sell the most products (by units)
SELECT cust.company AS Company,
       SUM(sales.quantity) AS UnitsSold
FROM dwh.sales_facts AS sales,
     dwh.customers_dim AS cust
WHERE cust.id = sales.customer_id
GROUP BY cust.id
ORDER BY SUM(sales.quantity) DESC LIMIT 10;

-- to which customer did we sell the most products (by price)
SELECT cust.company AS Company,
       SUM(sales.quantity*sales.unit_price) AS Revenue
FROM dwh.sales_facts AS sales,
     dwh.customers_dim AS cust
WHERE cust.id = sales.customer_id
GROUP BY cust.id
ORDER BY SUM(sales.quantity*sales.unit_price) DESC LIMIT 10;

-- where do the customers come from that generate the highest revenue
SELECT cust.company AS Company,
       SUM(sales.unit_price - prod.standard_cost) AS Margine
FROM dwh.sales_facts AS sales,
     dwh.customers_dim AS cust,
     dwh.product_dim AS prod
WHERE cust.id = sales.customer_id AND
	  prod.id = sales.product_id
GROUP BY cust.id
ORDER BY SUM(sales.unit_price - prod.standard_cost) DESC;

-- in which quarter did we generate the biggest revenue
SELECT date.quarter_number AS Quarter,
       date.year_sk AS Year,
       SUM(sales.quantity*sales.unit_price) AS Revenue
FROM dwh.sales_facts AS sales,
     dwh.date_dim AS date
WHERE date.date_sk = sales.date_id
GROUP BY date.year_quarter_name
ORDER BY SUM(sales.quantity*sales.unit_price) DESC LIMIT 10;

-- in which state did we generate the most revenue, by quarter
SELECT date.quarter_number AS Quarter,
       date.year_sk AS Year,
       loc.state_province AS State,
       SUM(sales.quantity*sales.unit_price) AS Revenue
FROM dwh.sales_facts AS sales,
     dwh.date_dim AS date,
     dwh.customers_dim AS cust,
     dwh.location_dim AS loc
WHERE date.date_sk = sales.date_id AND
	  cust.id = sales.customer_id AND
      loc.city = cust.city
GROUP BY date.year_quarter_name, loc.state_province
ORDER BY SUM(sales.quantity*sales.unit_price) DESC LIMIT 10;

use DWH;
SELECT customers.id, customers.city, location_dim.*, sales.* FROM sales_facts
left join customers on sales_facts.customer_id = customers.id
left join location_dim on location_dim.city = customers.city;