

create database DWH;


drop table DWH.customers;
drop table DWH.order_details;
drop table DWH.orders;
drop table DWH.products;
drop table DHW.order_details_clean;


-- ADD CREATE TABLE Statements hereorder_details

-- orders 

CREATE TABLE DWH.orders
(
  id BIGINT
, employee_id BIGINT
, customer_id BIGINT
, order_date VARCHAR(29)
, shipped_date VARCHAR(29)
, shipper_id BIGINT
, ship_name VARCHAR(22)
, ship_address VARCHAR(15)
, ship_city VARCHAR(14)
, ship_state_province VARCHAR(2)
, ship_zip_postal_code BIGINT
, ship_country_region VARCHAR(3)
, shipping_fee DOUBLE
, taxes DOUBLE
, payment_type VARCHAR(11)
, paid_date VARCHAR(29)
, notes BOOLEAN
, tax_rate BIGINT
, tax_status_id BOOLEAN
, status_id BIGINT
)
;

-- costumers

CREATE TABLE DWH.customers
(
  id BIGINT
, company VARCHAR(10)
, last_name VARCHAR(16)
, first_name VARCHAR(13)
, email_address BOOLEAN
, job_title VARCHAR(25)
, business_phone VARCHAR(13)
, home_phone BOOLEAN
, mobile_phone BOOLEAN
, fax_number VARCHAR(13)
, address VARCHAR(15)
, city VARCHAR(14)
, state_province VARCHAR(2)
, zip_postal_code BIGINT
, country_region VARCHAR(3)
, web_page BOOLEAN
, notes BOOLEAN
, attachments BOOLEAN
)
;

