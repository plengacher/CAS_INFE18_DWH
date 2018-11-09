create database staging;

drop table customers;
drop table order_details;
drop table orders;
drop table products;


-- ADD CREATE TABLE Statements here

-- order details

CREATE TABLE staging.order_details
(
  id BIGINT
, order_id BIGINT
, product_id BIGINT
, quantity DOUBLE
, unit_price DOUBLE
, discount BIGINT
, status_id BIGINT
, date_allocated BOOLEAN
, purchase_order_id BIGINT
, inventory_id BIGINT
)
;