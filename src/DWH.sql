

create database if not exists DWH;

drop table if exists DWH.Product_Dim;
drop table if exists DWH.Customers_Dim;
drop table if exists DWH.Date_Dim;
drop table if exists DWH.Sales;

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
  Technical_key BIGINT
, version INT
, date_from DATETIME
, date_to DATETIME
, id BIGINT
, company VARCHAR(10)
, last_name VARCHAR(16)
, first_name VARCHAR(13)
, city VARCHAR(14)
, state_province VARCHAR(2)
, zip_postal_code BIGINT
, country_region VARCHAR(3)
)
;

CREATE TABLE DWH.Date_Dim
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
, DAY_DESC VARCHAR(63)
, WEEK_SK INT
, DAY_DATE DATETIME
, WEEK_NAME VARCHAR(32)
, WEEK_OF_MONTH_NUMBER INT
, WEEK_OF_MONTH_NAME VARCHAR(63)
, YEAR_SK INT
, MONTH_SK INT
, QUARTER_SK INT
, DAY_OF_WEEK_SORT_NAME VARCHAR(60)
, YEAR_SORT_NUMBER VARCHAR(4)
)
;