/*
============================================================
SQL PRACTICAL ASSIGNMENT — DATA ANALYTICS
Topic: Customer Sales
SQL Dialect: T-SQL / Microsoft SQL Server

Topics Covered:
- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- WHERE
- ORDER BY
- AND
- OR
- NOT

Tasks: 1 - 20
============================================================

NOTE:
This script is designed to be rerunnable.
It recreates SalesAnalyticsDB if it already exists.

IMPORTANT:
The DROP DATABASE section is destructive. It deletes the
existing SalesAnalyticsDB database and its contents.
============================================================
*/


/* ============================================================
   DATABASE SETUP
   ============================================================ */

USE master;
GO

IF DB_ID('SalesAnalyticsDB') IS NOT NULL
BEGIN
    ALTER DATABASE SalesAnalyticsDB
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE SalesAnalyticsDB;
END;
GO

CREATE DATABASE SalesAnalyticsDB;
GO

USE SalesAnalyticsDB;
GO


/* ============================================================
   TASK 1 — CREATE THE ANALYTICS DATABASE
   ============================================================ */

-- Verify that we are working inside SalesAnalyticsDB.
SELECT DB_NAME() AS current_database;
GO


/* ============================================================
   TASK 2 — CREATE THE CUSTOMER TABLE
   ============================================================ */

DROP TABLE IF EXISTS customers;
GO

CREATE TABLE customers (
    id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INT,
    country VARCHAR(50),
    amount_spend INT
);
GO


/* ============================================================
   TASK 3 — LOAD CUSTOMER DATA
   ============================================================ */

INSERT INTO customers
    (id, user_name, age, country, amount_spend)
VALUES
    (1,  'Aarav Shah',     28, 'India',        65000),
    (2,  'Riya Patel',     24, 'India',        18000),
    (3,  'Rahul Mehta',    35, 'India',        48000),
    (4,  'Priya Sharma',   31, 'USA',          72000),
    (5,  'Karan Desai',    27, 'Canada',       25000),
    (6,  'Neha Joshi',     42, 'India',        55000),
    (7,  'Arjun Patel',    29, 'USA',          45000),
    (8,  'Sneha Shah',     38, 'UK',           82000),
    (9,  'Vivek Mehta',    45, 'Australia',    35000),
    (10, 'Anjali Desai',   26, 'India',        42000),
    (11, 'Rohan Shah',     33, 'USA',          58000),
    (12, 'Meera Patel',    22, 'Canada',       15000),
    (13, 'Dhruv Shah',     39, 'India',        76000),
    (14, 'Kavya Mehta',    30, 'UK',           47000),
    (15, 'Yash Desai',     41, 'USA',          91000),
    (16, 'Ishita Patel',   25, 'India',        29000),
    (17, 'Manav Shah',     36, 'Australia',    63000),
    (18, 'Pooja Joshi',    29, 'India',        52000),
    (19, 'Nikhil Mehta',   34, 'Canada',       68000),
    (20, 'Tanya Shah',     23, 'USA',          12000);
GO


/* ============================================================
   DATA EXPLORATION
   ============================================================ */


/* ============================================================
   TASK 4 — VIEW THE COMPLETE DATASET
   ============================================================ */

SELECT
    *
FROM customers;
GO


/* ============================================================
   TASK 5 — CUSTOMER INFORMATION
   ============================================================ */

SELECT
    user_name,
    age,
    country
FROM customers;
GO


/* ============================================================
   TASK 6 — CUSTOMER SPENDING ANALYSIS
   ============================================================ */

SELECT
    user_name,
    country,
    amount_spend
FROM customers;
GO


/* ============================================================
   FILTERING DATA USING WHERE
   ============================================================ */


/* ============================================================
   TASK 7 — HIGH-VALUE CUSTOMERS
   ============================================================ */

SELECT
    *
FROM customers
WHERE amount_spend > 50000;
GO


/* ============================================================
   TASK 8 — YOUNG CUSTOMERS
   ============================================================ */

SELECT
    *
FROM customers
WHERE age < 30;
GO


/* ============================================================
   TASK 9 — CUSTOMERS FROM INDIA
   ============================================================ */

SELECT
    *
FROM customers
WHERE country = 'India';
GO


/* ============================================================
   TASK 10 — LOW-SPENDING CUSTOMERS
   ============================================================ */

SELECT
    *
FROM customers
WHERE amount_spend < 20000;
GO


/* ============================================================
   LOGICAL OPERATORS
   ============================================================ */


/* ============================================================
   TASK 11 — HIGH-SPENDING YOUNG CUSTOMERS
   ============================================================ */

SELECT
    *
FROM customers
WHERE age < 30
  AND amount_spend > 30000;
GO


/* ============================================================
   TASK 12 — INDIAN HIGH-VALUE CUSTOMERS
   ============================================================ */

SELECT
    *
FROM customers
WHERE country = 'India'
  AND amount_spend > 40000;
GO


/* ============================================================
   TASK 13 — CUSTOMERS FROM SELECTED COUNTRIES
   ============================================================ */

SELECT
    *
FROM customers
WHERE country = 'India'
   OR country = 'USA';
GO


/* ============================================================
   TASK 14 — HIGH SPENDERS FROM SELECTED COUNTRIES
   ============================================================ */

SELECT
    *
FROM customers
WHERE (country = 'India' OR country = 'USA')
  AND amount_spend > 50000;
GO


/* ============================================================
   TASK 15 — EXCLUDE A COUNTRY
   ============================================================ */

SELECT
    *
FROM customers
WHERE NOT country = 'India';
GO


/* ============================================================
   SORTING DATA
   ============================================================ */


/* ============================================================
   TASK 16 — SORT CUSTOMERS BY SPENDING
   ============================================================ */

SELECT
    *
FROM customers
ORDER BY
    amount_spend ASC;
GO


/* ============================================================
   TASK 17 — IDENTIFY TOP SPENDERS
   ============================================================ */

SELECT
    *
FROM customers
ORDER BY
    amount_spend DESC;
GO


/* ============================================================
   TASK 18 — SORT BY AGE
   ============================================================ */

SELECT
    user_name,
    age,
    country,
    amount_spend
FROM customers
ORDER BY
    age ASC;
GO


/* ============================================================
   ANALYST-LEVEL FILTERING
   ============================================================ */


/* ============================================================
   TASK 19 — TARGET CUSTOMER SEGMENT
   ============================================================ */

SELECT
    *
FROM customers
WHERE age BETWEEN 25 AND 40
  AND (country = 'India' OR country = 'USA')
  AND amount_spend > 30000
ORDER BY
    amount_spend DESC;
GO


/* ============================================================
   TASK 20 — BUSINESS ANALYST CHALLENGE
   ============================================================ */

SELECT
    *
FROM customers
WHERE age >= 30
  AND amount_spend > 40000
  AND NOT country = 'India'
ORDER BY
    amount_spend DESC;
GO


/* ============================================================
   OPTIONAL DATA VERIFICATION
   ============================================================ */

-- Number of customers in the dataset
SELECT
    COUNT(*) AS total_customers
FROM customers;
GO

-- Number of different countries
SELECT
    COUNT(DISTINCT country) AS total_countries
FROM customers;
GO

-- Minimum and maximum spending
SELECT
    MIN(amount_spend) AS minimum_spend,
    MAX(amount_spend) AS maximum_spend
FROM customers;
GO


/* ============================================================
   END OF SQL PRACTICAL ASSIGNMENT
   ============================================================ */
