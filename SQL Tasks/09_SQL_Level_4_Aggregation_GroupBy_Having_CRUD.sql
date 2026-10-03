/*
====================================================================
SQL DATA ANALYTICS — LEVEL 4
Aggregation, GROUP BY, HAVING & CRUD
SQL Dialect: T-SQL / Microsoft SQL Server

Dataset:
    sales_transactions
    Same 30-record dataset from Level 3

Tasks:
    1 - 20
    Additional CRUD Challenge

Restrictions:
    DO NOT USE:
    - JOIN
    - Subqueries
    - CTEs
    - Window Functions

Main concepts:
    SELECT
    INSERT
    UPDATE
    DELETE
    WHERE
    AND / OR / NOT
    IN
    BETWEEN
    LIKE
    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()
    GROUP BY
    HAVING
    ORDER BY
====================================================================

IMPORTANT:
- This script recreates SalesTransactionsDB if it already exists.
- The DROP DATABASE section is destructive.
- Sales value is calculated as:
      quantity * unit_price
- Discount percentage is displayed/filtered but is NOT deducted
  from sales value because the assignment defines sales value using
  quantity × unit_price.
====================================================================
*/


/* ================================================================
   DATABASE SETUP
   ================================================================ */

USE master;
GO

IF DB_ID('SalesTransactionsDB') IS NOT NULL
BEGIN
    ALTER DATABASE SalesTransactionsDB
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE SalesTransactionsDB;
END;
GO

CREATE DATABASE SalesTransactionsDB;
GO

USE SalesTransactionsDB;
GO


/* ================================================================
   CREATE TABLE
   ================================================================ */

DROP TABLE IF EXISTS sales_transactions;
GO

CREATE TABLE sales_transactions (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    unit_price INT,
    discount_percent INT,
    city VARCHAR(50),
    payment_mode VARCHAR(30),
    salesperson VARCHAR(50),
    customer_type VARCHAR(30)
);
GO


/* ================================================================
   LOAD THE SAME 30-RECORD LEVEL 3 DATASET
   ================================================================ */

INSERT INTO sales_transactions
(
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount_percent,
    city,
    payment_mode,
    salesperson,
    customer_type
)
VALUES
(1001, 'Aarav Mehta',     'Laptop Pro 15',            'Electronics', 2,  75000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1002, 'Priya Shah',      'Office Chair',             'Furniture',   5,  12000,  8, 'Mumbai',    'Card',   'Neha',  'Regular'),
(1003, 'Rohan Patel',     'Smartphone X',             'Electronics', 3,  45000, 12, 'Ahmedabad', 'UPI',    'Amit',  'Premium'),
(1004, 'Sneha Verma',     'Refrigerator',             'Appliances',  1,  68000, 15, 'Delhi',     'Card',   'Priya', 'VIP'),
(1005, 'Karan Joshi',     'Dining Table',             'Furniture',   4,  18000,  5, 'Pune',      'Cash',   'Rahul', 'Regular'),
(1006, 'Ananya Rao',      'Laptop Air 14',            'Electronics', 1,  62000,  7, 'Bangalore', 'Online', 'Neha',  'Premium'),
(1007, 'Vikram Singh',    'Washing Machine',          'Appliances',  2,  42000, 18, 'Jaipur',    'UPI',    'Amit',  'Regular'),
(1008, 'Meera Kapoor',    'Smartphone Pro',           'Electronics', 4,  55000, 20, 'Mumbai',    'Card',   'Priya', 'VIP'),
(1009, 'Aditya Shah',     'Sofa Set',                 'Furniture',   3,  35000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1010, 'Ishita Patel',    'Air Conditioner',          'Appliances',  2,  58000, 12, 'Surat',     'UPI',    'Neha',  'Premium'),
(1011, 'Raj Malhotra',    'Gaming Laptop',            'Electronics', 2,  95000, 15, 'Delhi',     'Card',   'Amit',  'VIP'),
(1012, 'Kavya Desai',     'Bookshelf',                'Furniture',   6,   9000,  5, 'Pune',      'Cash',   'Priya', 'Regular'),
(1013, 'Arjun Mehta',     'Smart TV 55',              'Electronics', 2,  72000, 18, 'Bangalore', 'Online', 'Rahul', 'Premium'),
(1014, 'Nisha Sharma',    'Microwave Oven',            'Appliances',  3,  22000,  8, 'Ahmedabad', 'UPI',    'Neha',  'Regular'),
(1015, 'Yash Patel',      'Refrigerator Pro',         'Appliances',  1,  82000, 20, 'Mumbai',    'Card',   'Amit',  'VIP'),
(1016, 'Simran Kaur',     'Office Desk',              'Furniture',   5,  16000, 12, 'Delhi',     'Online', 'Priya', 'Regular'),
(1017, 'Dev Kumar',       'Smartphone Ultra',         'Electronics', 3,  68000, 10, 'Jaipur',    'UPI',    'Rahul', 'Premium'),
(1018, 'Riya Shah',       'Washing Machine Pro',      'Appliances',  4,  48000, 22, 'Surat',     'Card',   'Neha',  'Premium'),
(1019, 'Manav Joshi',     'Premium Sofa',             'Furniture',   2,  65000, 15, 'Ahmedabad', 'Online', 'Amit',  'VIP'),
(1020, 'Pooja Mehta',     'Tablet Pro',               'Electronics', 5,  32000,  8, 'Pune',      'UPI',    'Priya', 'Regular'),
(1021, 'Harsh Verma',     'Laptop Ultra',             'Electronics', 3,  88000, 25, 'Mumbai',    'Card',   'Rahul', 'VIP'),
(1022, 'Neel Shah',       'Air Conditioner Pro',     'Appliances',  2,  76000, 10, 'Delhi',     'Online', 'Neha',  'Premium'),
(1023, 'Tanvi Rao',       'Dining Set',               'Furniture',   4,  28000, 18, 'Bangalore', 'Cash',   'Amit',  'Regular'),
(1024, 'Siddharth Patel', 'Smart TV Pro',             'Electronics', 6,  60000, 12, 'Surat',     'UPI',    'Priya', 'Premium'),
(1025, 'Aisha Khan',      'Double Door Refrigerator', 'Appliances',  2,  92000, 20, 'Ahmedabad', 'Card',   'Rahul', 'VIP'),
(1026, 'Mohit Singh',     'Executive Chair',          'Furniture',   7,  14000, 10, 'Jaipur',    'Online', 'Neha',  'Regular'),
(1027, 'Diya Mehta',      'Gaming Monitor',            'Electronics', 3,  52000, 15, 'Delhi',     'UPI',    'Amit',  'Premium'),
(1028, 'Varun Shah',      'Washing Machine',           'Appliances',  5,  38000, 28, 'Mumbai',    'Cash',   'Priya', 'Regular'),
(1029, 'Isha Patel',      'Luxury Sofa',              'Furniture',   3,  78000, 12, 'Pune',      'Card',   'Rahul', 'VIP'),
(1030, 'Dhruv Sharma',    'Business Laptop',          'Electronics', 2, 110000, 18, 'Bangalore', 'Online', 'Neha',  'VIP');
GO


/* ================================================================
   TASK 1 — SALES TRANSACTION SUMMARY
   ================================================================ */

SELECT
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price,
    MAX(unit_price) AS highest_unit_price,
    MIN(unit_price) AS lowest_unit_price
FROM sales_transactions;
GO


/* ================================================================
   TASK 2 — CATEGORY PERFORMANCE ANALYSIS
   ================================================================ */

SELECT
    category,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    category
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 3 — SALESPERSON PERFORMANCE REPORT
   ================================================================ */

SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    salesperson
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 4 — CITY-WISE SALES ANALYSIS
   ================================================================ */

SELECT
    city,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    city
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 5 — CUSTOMER TYPE ANALYSIS
   ================================================================ */

SELECT
    customer_type,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_purchased,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    customer_type
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 6 — PAYMENT MODE ANALYSIS
   ================================================================ */

SELECT
    payment_mode,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    payment_mode
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 7 — HIGH-PERFORMING CATEGORIES
   ================================================================ */

SELECT
    category,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    category
HAVING
    SUM(quantity * unit_price) > 300000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 8 — HIGH-PERFORMING SALESPEOPLE
   ================================================================ */

SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value
FROM sales_transactions
GROUP BY
    salesperson
HAVING
    SUM(quantity * unit_price) > 500000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 9 — HIGH-VOLUME PRODUCTS
   ================================================================ */

SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    product_name
HAVING
    SUM(quantity) > 5
ORDER BY
    total_quantity_sold DESC;
GO


/* ================================================================
   TASK 10 — PREMIUM CUSTOMER ANALYSIS
   ================================================================ */

SELECT
    category,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
WHERE customer_type = 'Premium'
GROUP BY
    category
HAVING
    SUM(quantity * unit_price) > 200000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 11 — VIP CUSTOMER ANALYSIS
   ================================================================ */

SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value
FROM sales_transactions
WHERE customer_type = 'VIP'
GROUP BY
    salesperson
HAVING
    SUM(quantity * unit_price) > 300000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 12 — CITY AND PAYMENT ANALYSIS
   ================================================================ */

SELECT
    city,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value
FROM sales_transactions
WHERE payment_mode IN ('Online', 'Card')
GROUP BY
    city
HAVING
    SUM(quantity * unit_price) > 300000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 13 — DISCOUNT PERFORMANCE ANALYSIS
   ================================================================ */

SELECT
    discount_percent,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
GROUP BY
    discount_percent
HAVING
    COUNT(*) >= 2
ORDER BY
    discount_percent ASC;
GO


/* ================================================================
   TASK 14 — ELECTRONICS BUSINESS ANALYSIS
   ================================================================ */

SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price,
    MAX(unit_price) AS highest_unit_price
FROM sales_transactions
WHERE category = 'Electronics'
GROUP BY
    salesperson
HAVING
    SUM(quantity * unit_price) > 250000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 15 — FURNITURE BUSINESS ANALYSIS
   ================================================================ */

SELECT
    city,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
WHERE category = 'Furniture'
  AND quantity > 2
GROUP BY
    city
HAVING
    SUM(quantity * unit_price) > 50000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 16 — APPLIANCE SALES ANALYSIS
   ================================================================ */

SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price
FROM sales_transactions
WHERE category = 'Appliances'
  AND payment_mode <> 'Cash'
  AND discount_percent < 20
GROUP BY
    salesperson
HAVING
    SUM(quantity * unit_price) > 100000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 17 — PREMIUM VS VIP PERFORMANCE
   ================================================================ */

SELECT
    customer_type,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price,
    MAX(unit_price) AS maximum_unit_price
FROM sales_transactions
WHERE customer_type IN ('Premium', 'VIP')
GROUP BY
    customer_type
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 18 — SALESPERSON DISCOUNT ANALYSIS
   ================================================================ */

SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(discount_percent AS DECIMAL(18,2))) AS average_discount_percentage
FROM sales_transactions
WHERE discount_percent > 15
GROUP BY
    salesperson
HAVING
    COUNT(*) >= 2
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   TASK 19 — INSERT AND VERIFY NEW TRANSACTION
   ================================================================ */

INSERT INTO sales_transactions
(
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount_percent,
    city,
    payment_mode,
    salesperson,
    customer_type
)
VALUES
(
    1031,
    'Raj Mehta',
    'MacBook Pro',
    'Electronics',
    2,
    125000,
    10,
    'Mumbai',
    'Online',
    'Rahul',
    'Premium'
);
GO

-- Verify that transaction 1031 was inserted.
SELECT
    *
FROM sales_transactions
WHERE transaction_id = 1031;
GO


/* ================================================================
   TASK 20 — FINAL BUSINESS INTELLIGENCE CHALLENGE
   ================================================================ */

SELECT
    salesperson,
    category,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(CAST(unit_price AS DECIMAL(18,2))) AS average_unit_price,
    MIN(unit_price) AS minimum_unit_price,
    MAX(unit_price) AS maximum_unit_price,
    AVG(CAST(discount_percent AS DECIMAL(18,2))) AS average_discount_percentage
FROM sales_transactions
WHERE customer_type IN ('Premium', 'VIP')
  AND payment_mode <> 'Cash'
  AND quantity > 1
  AND discount_percent < 20
GROUP BY
    salesperson,
    category
HAVING
    SUM(quantity * unit_price) > 200000
ORDER BY
    total_sales_value DESC;
GO


/* ================================================================
   ADDITIONAL CRUD CHALLENGE
   ================================================================ */


/* ================================================================
   CRUD — CREATE
   Insert transaction 1031
   ================================================================ */

-- Transaction 1031 already exists because Task 19 inserted it.
-- The following verification confirms the CREATE operation.

SELECT
    *
FROM sales_transactions
WHERE transaction_id = 1031;
GO


/* ================================================================
   CRUD — READ
   Retrieve the inserted transaction
   ================================================================ */

SELECT
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount_percent,
    city,
    payment_mode,
    salesperson,
    customer_type
FROM sales_transactions
WHERE transaction_id = 1031;
GO


/* ================================================================
   CRUD — UPDATE
   Change discount from 10 to 12
   ================================================================ */

UPDATE sales_transactions
SET discount_percent = 12
WHERE transaction_id = 1031;
GO

-- Verify UPDATE
SELECT
    transaction_id,
    customer_name,
    product_name,
    discount_percent
FROM sales_transactions
WHERE transaction_id = 1031;
GO


/* ================================================================
   CRUD — DELETE
   Delete transaction 1031
   ================================================================ */

DELETE FROM sales_transactions
WHERE transaction_id = 1031;
GO

-- Verify DELETE
-- This query should return zero rows.
SELECT
    *
FROM sales_transactions
WHERE transaction_id = 1031;
GO


/* ================================================================
   FINAL TABLE CHECK
   ================================================================ */

SELECT
    COUNT(*) AS transactions_remaining
FROM sales_transactions;
GO


/* ================================================================
   END OF SQL DATA ANALYTICS ASSIGNMENT
   ================================================================ */
