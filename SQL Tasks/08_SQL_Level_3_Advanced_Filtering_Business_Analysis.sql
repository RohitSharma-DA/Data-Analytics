/*
====================================================================
SQL PRACTICAL ASSIGNMENT — DATA ANALYTICS
Level 3 — Advanced Filtering & Business Analysis
SQL Dialect: T-SQL / Microsoft SQL Server

Topics:
- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- WHERE
- ORDER BY
- AND / OR / NOT
- BETWEEN
- Complex business conditions

Tasks: 1 - 20
====================================================================

IMPORTANT:
1. This script recreates SalesTransactionsDB if it already exists.
2. The DROP DATABASE section is destructive.
3. The dataset and task wording are based on the supplied assignment.
4. Task 9 says "other than a selected salesperson". The variable
   @ExcludedSalesperson below is provided so the selected salesperson
   can be changed easily.
5. Task 16 says "Appliance" while the supplied dataset category is
   "Appliances". The query uses "Appliances" to match the actual
   dataset value.
6. No revenue calculation is introduced because the assignment
   asks for filtering/sorting based on the supplied columns.
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
   TASK 1 / DATASET SETUP
   CREATE sales_transactions TABLE
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
   INSERT 30 REALISTIC SALES TRANSACTIONS
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
(1001, 'Aarav Mehta',    'Laptop Pro 15',             'Electronics', 2,  75000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1002, 'Priya Shah',     'Office Chair',              'Furniture',   5,  12000,  8, 'Mumbai',    'Card',   'Neha',  'Regular'),
(1003, 'Rohan Patel',    'Smartphone X',              'Electronics', 3,  45000, 12, 'Ahmedabad', 'UPI',    'Amit',  'Premium'),
(1004, 'Sneha Verma',    'Refrigerator',              'Appliances',  1,  68000, 15, 'Delhi',     'Card',   'Priya', 'VIP'),
(1005, 'Karan Joshi',    'Dining Table',              'Furniture',   4,  18000,  5, 'Pune',      'Cash',   'Rahul', 'Regular'),
(1006, 'Ananya Rao',     'Laptop Air 14',             'Electronics', 1,  62000,  7, 'Bangalore', 'Online', 'Neha',  'Premium'),
(1007, 'Vikram Singh',   'Washing Machine',           'Appliances',  2,  42000, 18, 'Jaipur',    'UPI',    'Amit',  'Regular'),
(1008, 'Meera Kapoor',   'Smartphone Pro',            'Electronics', 4,  55000, 20, 'Mumbai',    'Card',   'Priya', 'VIP'),
(1009, 'Aditya Shah',    'Sofa Set',                  'Furniture',   3,  35000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1010, 'Ishita Patel',   'Air Conditioner',           'Appliances',  2,  58000, 12, 'Surat',     'UPI',    'Neha',  'Premium'),
(1011, 'Raj Malhotra',   'Gaming Laptop',             'Electronics', 2,  95000, 15, 'Delhi',     'Card',   'Amit',  'VIP'),
(1012, 'Kavya Desai',    'Bookshelf',                 'Furniture',   6,   9000,  5, 'Pune',      'Cash',   'Priya', 'Regular'),
(1013, 'Arjun Mehta',    'Smart TV 55',               'Electronics', 2,  72000, 18, 'Bangalore', 'Online', 'Rahul', 'Premium'),
(1014, 'Nisha Sharma',   'Microwave Oven',            'Appliances',  3,  22000,  8, 'Ahmedabad', 'UPI',    'Neha',  'Regular'),
(1015, 'Yash Patel',     'Refrigerator Pro',          'Appliances',  1,  82000, 20, 'Mumbai',    'Card',   'Amit',  'VIP'),
(1016, 'Simran Kaur',    'Office Desk',               'Furniture',   5,  16000, 12, 'Delhi',     'Online', 'Priya', 'Regular'),
(1017, 'Dev Kumar',      'Smartphone Ultra',          'Electronics', 3,  68000, 10, 'Jaipur',    'UPI',    'Rahul', 'Premium'),
(1018, 'Riya Shah',      'Washing Machine Pro',       'Appliances',  4,  48000, 22, 'Surat',     'Card',   'Neha',  'Premium'),
(1019, 'Manav Joshi',    'Premium Sofa',              'Furniture',   2,  65000, 15, 'Ahmedabad', 'Online', 'Amit',  'VIP'),
(1020, 'Pooja Mehta',    'Tablet Pro',                'Electronics', 5,  32000,  8, 'Pune',      'UPI',    'Priya', 'Regular'),
(1021, 'Harsh Verma',    'Laptop Ultra',              'Electronics', 3,  88000, 25, 'Mumbai',    'Card',   'Rahul', 'VIP'),
(1022, 'Neel Shah',      'Air Conditioner Pro',      'Appliances',  2,  76000, 10, 'Delhi',     'Online', 'Neha',  'Premium'),
(1023, 'Tanvi Rao',      'Dining Set',                'Furniture',   4,  28000, 18, 'Bangalore', 'Cash',   'Amit',  'Regular'),
(1024, 'Siddharth Patel','Smart TV Pro',              'Electronics', 6,  60000, 12, 'Surat',     'UPI',    'Priya', 'Premium'),
(1025, 'Aisha Khan',     'Double Door Refrigerator',  'Appliances',  2,  92000, 20, 'Ahmedabad', 'Card',   'Rahul', 'VIP'),
(1026, 'Mohit Singh',    'Executive Chair',           'Furniture',   7,  14000, 10, 'Jaipur',    'Online', 'Neha',  'Regular'),
(1027, 'Diya Mehta',     'Gaming Monitor',             'Electronics', 3,  52000, 15, 'Delhi',     'UPI',    'Amit',  'Premium'),
(1028, 'Varun Shah',     'Washing Machine',            'Appliances',  5,  38000, 28, 'Mumbai',    'Cash',   'Priya', 'Regular'),
(1029, 'Isha Patel',     'Luxury Sofa',               'Furniture',   3,  78000, 12, 'Pune',      'Card',   'Rahul', 'VIP'),
(1030, 'Dhruv Sharma',   'Business Laptop',           'Electronics', 2, 110000, 18, 'Bangalore', 'Online', 'Neha',  'VIP');
GO


/* ================================================================
   TASK 1 — COMPLETE TRANSACTION ANALYSIS
   ================================================================ */

SELECT
    *
FROM sales_transactions
ORDER BY
    unit_price DESC,
    quantity DESC;
GO


/* ================================================================
   TASK 2 — HIGH-VALUE TRANSACTIONS
   ================================================================ */

SELECT
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    city
FROM sales_transactions
WHERE unit_price > 50000
  AND quantity > 1;
GO


/* ================================================================
   TASK 3 — PREMIUM CUSTOMER TRANSACTIONS
   ================================================================ */

SELECT
    *
FROM sales_transactions
WHERE customer_type = 'Premium'
  AND unit_price > 25000
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 4 — DISCOUNT ANALYSIS
   ================================================================ */

SELECT
    *
FROM sales_transactions
WHERE discount_percent > 15
  AND quantity >= 3
ORDER BY
    discount_percent DESC;
GO


/* ================================================================
   TASK 5 — CITY-LEVEL SALES ANALYSIS
   ================================================================ */

SELECT
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    city
FROM sales_transactions
WHERE (city = 'Ahmedabad'
    OR city = 'Mumbai'
    OR city = 'Delhi')
  AND unit_price > 20000
ORDER BY
    city ASC,
    unit_price DESC;
GO


/* ================================================================
   TASK 6 — PAYMENT BEHAVIOUR ANALYSIS
   ================================================================ */

SELECT
    customer_name,
    product_name,
    quantity,
    unit_price,
    payment_mode
FROM sales_transactions
WHERE (payment_mode = 'Online'
    OR payment_mode = 'Card')
  AND quantity > 2
  AND unit_price > 15000
ORDER BY
    quantity DESC;
GO


/* ================================================================
   TASK 7 — CATEGORY ANALYSIS
   ================================================================ */

SELECT
    *
FROM sales_transactions
WHERE (category = 'Electronics'
    OR category = 'Furniture'
    OR category = 'Appliances')
  AND discount_percent < 10
ORDER BY
    discount_percent ASC;
GO


/* ================================================================
   TASK 8 — CUSTOMER SEGMENT ANALYSIS
   ================================================================ */

SELECT
    customer_name,
    customer_type,
    product_name,
    quantity,
    unit_price
FROM sales_transactions
WHERE (customer_type = 'Premium'
    OR customer_type = 'Regular')
  AND unit_price > 30000
  AND quantity > 1
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 9 — SALESPERSON TRANSACTION ANALYSIS
   ================================================================ */

-- Change this value to select a different salesperson.
DECLARE @ExcludedSalesperson VARCHAR(50) = 'Rahul';

SELECT
    *
FROM sales_transactions
WHERE salesperson <> @ExcludedSalesperson
  AND quantity > 4
  AND discount_percent < 20
ORDER BY
    quantity DESC;
GO


/* ================================================================
   TASK 10 — HIGH QUANTITY VS HIGH PRICE
   ================================================================ */

SELECT
    transaction_id,
    customer_name,
    product_name,
    quantity,
    unit_price,
    category
FROM sales_transactions
WHERE
    (
        quantity > 5
        AND unit_price > 10000
    )
    OR
    (
        quantity BETWEEN 2 AND 5
        AND unit_price > 50000
    )
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 11 — INTERNATIONAL CITY ANALYSIS
   ================================================================ */

SELECT
    *
FROM sales_transactions
WHERE city <> 'Ahmedabad'
  AND quantity > 2
  AND unit_price > 20000
  AND payment_mode <> 'Cash'
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 12 — PREMIUM ELECTRONICS ANALYSIS
   ================================================================ */

SELECT
    customer_name,
    product_name,
    quantity,
    unit_price,
    discount_percent,
    customer_type
FROM sales_transactions
WHERE category = 'Electronics'
  AND unit_price > 40000
  AND quantity > 1
  AND discount_percent < 15
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 13 — FURNITURE SALES ANALYSIS
   ================================================================ */

SELECT
    customer_name,
    product_name,
    quantity,
    unit_price,
    discount_percent,
    city
FROM sales_transactions
WHERE category = 'Furniture'
  AND (
        quantity > 3
        OR unit_price > 25000
      )
ORDER BY
    quantity DESC;
GO


/* ================================================================
   TASK 14 — CUSTOMER TYPE & PAYMENT ANALYSIS
   ================================================================ */

SELECT
    *
FROM sales_transactions
WHERE customer_type = 'Premium'
  AND payment_mode <> 'Cash'
  AND quantity > 1
  AND unit_price > 20000
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 15 — DISCOUNTED HIGH-VALUE SALES
   ================================================================ */

SELECT
    customer_name,
    product_name,
    category,
    unit_price,
    discount_percent,
    payment_mode
FROM sales_transactions
WHERE unit_price > 50000
  AND discount_percent > 10
  AND payment_mode <> 'Cash'
ORDER BY
    discount_percent DESC;
GO


/* ================================================================
   TASK 16 — MULTIPLE BUSINESS CONDITIONS
   ================================================================ */

-- The supplied assignment says "Appliance"; the dataset uses
-- the category value "Appliances", so "Appliances" is used here.

SELECT
    *
FROM sales_transactions
WHERE
    (
        category = 'Electronics'
        AND quantity > 2
        AND discount_percent < 15
    )
    OR
    (
        category = 'Furniture'
        AND quantity > 3
        AND unit_price > 20000
    )
    OR
    (
        category = 'Appliances'
        AND unit_price > 40000
    )
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 17 — CUSTOMER PURCHASE PRIORITY
   ================================================================ */

SELECT
    customer_name,
    customer_type,
    product_name,
    quantity,
    unit_price,
    city,
    payment_mode
FROM sales_transactions
WHERE (customer_type = 'Premium'
    OR customer_type = 'VIP')
  AND city <> 'Ahmedabad'
  AND (
        quantity > 3
        OR unit_price > 60000
      )
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 18 — SALES RISK ANALYSIS
   ================================================================ */

SELECT
    *
FROM sales_transactions
WHERE discount_percent > 20
  AND quantity > 2
  AND unit_price < 50000
  AND payment_mode <> 'Cash'
  AND city <> 'Mumbai'
ORDER BY
    discount_percent DESC;
GO


/* ================================================================
   TASK 19 — MANAGEMENT SALES REPORT
   ================================================================ */

SELECT
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount_percent,
    customer_type,
    payment_mode,
    city,
    salesperson
FROM sales_transactions
WHERE
    (
        customer_type = 'Premium'
        AND category = 'Electronics'
        AND unit_price > 40000
    )
    OR
    (
        customer_type = 'VIP'
        AND unit_price > 50000
    )
    OR
    (
        customer_type = 'Regular'
        AND quantity > 5
        AND unit_price > 10000
    )
    AND payment_mode <> 'Cash'
ORDER BY
    unit_price DESC;
GO


/* ================================================================
   TASK 20 — FINAL DATA ANALYST CHALLENGE
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
WHERE
    (
        (
            customer_type = 'Premium'
            AND category = 'Electronics'
            AND unit_price > 35000
        )
        OR
        (
            customer_type = 'VIP'
            AND category = 'Furniture'
            AND quantity > 2
        )
        OR
        (
            customer_type = 'Regular'
            AND unit_price > 75000
        )
    )
    AND discount_percent <= 25
    AND payment_mode <> 'Cash'
    AND city <> 'Ahmedabad'
ORDER BY
    unit_price DESC,
    quantity DESC,
    discount_percent DESC;
GO


/* ================================================================
   OPTIONAL DATA VERIFICATION
   ================================================================ */

-- Total number of transactions
SELECT
    COUNT(*) AS total_transactions
FROM sales_transactions;
GO

-- Number of distinct cities
SELECT
    COUNT(DISTINCT city) AS total_cities
FROM sales_transactions;
GO

-- Number of distinct products
SELECT
    COUNT(DISTINCT product_name) AS total_products
FROM sales_transactions;
GO

-- Customer type distribution
SELECT
    customer_type,
    COUNT(*) AS transaction_count
FROM sales_transactions
GROUP BY
    customer_type
ORDER BY
    transaction_count DESC;
GO


/* ================================================================
   END OF SQL PRACTICAL ASSIGNMENT
   ================================================================ */
