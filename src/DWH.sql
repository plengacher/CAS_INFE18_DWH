

create database if not exists DWH;

drop table if exists DWH.Product_Dim;
drop table if exists DWH.Customers_Dim;
drop table if exists DWH.Date_Dim;
drop table if exists DWH.Sales_Facts;
drop table if exists DWH.Location_dim;

CREATE TABLE DWH.Product_Dim
(
  Technical_key BIGINT
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
;

CREATE TABLE DWH.Customers_Dim
(
  id BIGINT
, company VARCHAR(10)
, last_name VARCHAR(16)
, first_name VARCHAR(13)
, city VARCHAR(14)
)
;

CREATE TABLE DWH.Date_Dim
(
  DATE_SK INT
, YEAR_NUMBER INT
, MONTH_NUMBER INT
, WEEK_OF_YEAR_NUMBER INT
, QUARTER_NUMBER INT
, QUARTER_NAME VARCHAR(2)
, YEAR_QUARTER_NAME VARCHAR(32)
, DAY_DATE DATETIME
)
;

CREATE TABLE DWH.Sales_facts
(
  id BIGINT
, quantity DOUBLE
, unit_price DOUBLE
, date_id INT
, customer_id BIGINT
, product_id BIGINT
, turnover DOUBLE
, profit DOUBLE
)
;

CREATE TABLE DWH.Location_dim
(
  technical_key BIGINT
, version INT
, date_from DATETIME
, date_to DATETIME
, city VARCHAR(14)
, state_province VARCHAR(2)
, country_region VARCHAR(3)
, zip_postal_code BIGINT
)
;
