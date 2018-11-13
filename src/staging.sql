create database if not exists staging;

drop table if exists staging.customers;
drop table if exists staging.Customers_dim;
drop table if exists staging.order_details;
drop table if exists staging.order_details_clean;
drop table if exists staging.orders;
drop table if exists staging.products;
drop table if exists staging.Products_dim;
drop table if exists staging.Date_dim;
drop table if exists staging.location_dim;


-- ADD CREATE TABLE Statements here

-- order details
CREATE TABLE staging.customers
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

CREATE TABLE staging.customers_dim
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
, web_page BOOLEAN
, notes BOOLEAN
, attachments BOOLEAN
)
;

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

CREATE TABLE staging.order_details_clean
(
  id BIGINT
, order_id BIGINT
, product_id BIGINT
, quantity DOUBLE
, unit_price DOUBLE
, discount INT
, status_id BIGINT
, date_allocated BOOLEAN
, purchase_order_id BIGINT
, inventory_id BIGINT
)
;

CREATE TABLE staging.orders
(
  id BIGINT
, employee_id BIGINT
, customer_id BIGINT
, order_date DATETIME
, shipped_date DATETIME
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

CREATE TABLE staging.products
(
  supplier_ids VARCHAR(3)
, id BIGINT
, product_code VARCHAR(9)
, product_name VARCHAR(40)
, description BOOLEAN
, standard_cost DOUBLE
, list_price DOUBLE
, reorder_level BIGINT
, target_level BIGINT
, quantity_per_unit VARCHAR(20)
, discontinued BOOLEAN
, minimum_reorder_quantity BIGINT
, category VARCHAR(25)
, attachments BOOLEAN
)
;

CREATE TABLE staging.Products_dim
(
  Technical_key BIGINT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, id BIGINT
, product_code VARCHAR(9)
, product_name VARCHAR(40)
, description BOOLEAN
, standard_cost DOUBLE
, list_price DOUBLE
, quantity_per_unit VARCHAR(20)
, category VARCHAR(25)
)
;CREATE INDEX idx_Products_dim_lookup ON staging.Products_dim(id)
;
CREATE INDEX idx_Products_dim_tk ON staging.Products_dim(Technical_key)
;

CREATE TABLE staging.Date_dim
(
  DATE_SK INT
, YEAR_NUMBER INT
, MONTH_NUMBER INT
, DAY_OF_YEAR_NUMBER INT
, DAY_OF_MONTH_NUMBER INT
, DAY_OF_WEEK_NUMBER INT
, WEEK_OF_YEAR_NUMBER INT
, DAY_NAME VARCHAR(30)
, MONTH_NAME VARCHAR(30)
, QUARTER_NUMBER INT
, QUARTER_NAME VARCHAR(2)
, YEAR_QUARTER_NAME VARCHAR(32)
, WEEKEND_IND CHAR(1)
, DAYS_IN_MONTH_QTY INT
, DAY_DESC TINYTEXT
, WEEK_SK INT
, DAY_DATE DATETIME
, WEEK_NAME VARCHAR(32)
, WEEK_OF_MONTH_NUMBER INT
, WEEK_OF_MONTH_NAME TINYTEXT
, YEAR_SK INT
, MONTH_SK INT
, QUARTER_SK INT
, DAY_OF_WEEK_SORT_NAME VARCHAR(60)
, YEAR_SORT_NUMBER VARCHAR(4)
)
;CREATE INDEX idx_Date_dim_lookup ON staging.Date_dim(DATE_SK)
;

CREATE TABLE staging.location_dim
(
  technical_key BIGINT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, city VARCHAR(14)
, state_province VARCHAR(2)
, country_region VARCHAR(3)
, zip_postal_code BIGINT
)
;CREATE INDEX idx_location_dim_lookup ON staging.location_dim(city, state_province, country_region, zip_postal_code)
;
CREATE INDEX idx_location_dim_tk ON staging.location_dim(technical_key)
;
