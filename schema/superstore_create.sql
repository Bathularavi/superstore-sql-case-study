-- ============================================================
-- Superstore SQL Case Study - Table Creation Script
-- Dataset: 9,994 orders | US Retail | Jan 2014 - Dec 2017
-- Author: Ravi Bathula
-- Part of the 90-Day Data Analyst Career System
-- ============================================================

CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
      Row_ID          INT PRIMARY KEY,
      Order_ID        VARCHAR(20),
      Order_Date      DATE,
      Ship_Date       DATE,
      Ship_Mode       VARCHAR(30),
      Customer_ID     VARCHAR(20),
      Customer_Name   VARCHAR(100),
      Segment         VARCHAR(20),
      Country         VARCHAR(50),
      City            VARCHAR(100),
      State           VARCHAR(50),
      Postal_Code     VARCHAR(10),
      Region          VARCHAR(20),
      Product_ID      VARCHAR(20),
      Category        VARCHAR(30),
      Sub_Category    VARCHAR(30),
      Product_Name    VARCHAR(200),
      Sales           DECIMAL(10,4),
      Quantity        INT,
      Discount        DECIMAL(5,4),
      Profit          DECIMAL(10,4)
  );

-- Verify the structure
DESCRIBE orders;

-- After importing CSV data, verify row count:
-- SELECT COUNT(*) FROM orders;  -- Should return 9,994
