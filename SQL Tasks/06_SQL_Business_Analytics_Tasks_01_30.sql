/*
============================================================
SQL BUSINESS ANALYTICS PRACTICE
Tasks: 1 - 30
SQL Dialect: T-SQL / Microsoft SQL Server
============================================================*/

/* ============================================================
   DATASET SETUP
   ============================================================ */

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
GO


/* ============================================================
   CUSTOMERS TABLE
   ============================================================ */

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
GO

INSERT INTO Customers (customer_id, customer_name, city)
VALUES
(101,'Aarav Shah','Ahmedabad'),
(102,'Riya Patel','Mumbai'),
(103,'Rahul Mehta','Delhi'),
(104,'Priya Sharma','Ahmedabad'),
(105,'Karan Desai','Pune'),
(106,'Neha Joshi','Mumbai'),
(107,'Arjun Patel','Bangalore'),
(108,'Sneha Shah','Delhi'),
(109,'Vivek Mehta','Ahmedabad'),
(110,'Anjali Desai','Surat'),
(111,'Rohan Shah','Pune'),
(112,'Meera Patel','Mumbai'),
(113,'Dhruv Shah','Ahmedabad'),
(114,'Kavya Mehta','Delhi'),
(115,'Yash Desai','Bangalore'),
(116,'Ishita Patel','Surat'),
(117,'Manav Shah','Pune'),
(118,'Pooja Joshi','Mumbai'),
(119,'Nikhil Mehta','Ahmedabad'),
(120,'Tanya Shah','Delhi');
GO


/* ============================================================
   ORDERS TABLE
   ============================================================ */

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    amount DECIMAL(10,2)
);
GO

INSERT INTO Orders (order_id, customer_id, product_name, quantity, amount)
VALUES
(1001,101,'Laptop',2,55000),
(1002,101,'Mouse',5,800),
(1003,101,'Keyboard',3,1500),
(1004,102,'Laptop',1,62000),
(1005,102,'Monitor',2,18000),
(1006,103,'Mobile Phone',2,35000),
(1007,103,'Headphones',4,4500),
(1008,104,'Laptop',1,58000),
(1009,104,'Printer',2,12500),
(1010,104,'Keyboard',5,1400),
(1011,105,'Office Chair',4,8500),
(1012,105,'Monitor',3,17000),
(1013,106,'Mobile Phone',3,32000),
(1014,106,'Headphones',5,4200),
(1015,107,'Laptop',2,60000),
(1016,107,'Mouse',10,750),
(1017,108,'Monitor',4,16000),
(1018,108,'Keyboard',6,1300),
(1019,109,'Laptop',2,57000),
(1020,109,'Printer',3,13500),
(1021,109,'Mouse',8,700),
(1022,110,'Mobile Phone',2,36000),
(1023,110,'Headphones',3,4800),
(1024,111,'Laptop',1,65000),
(1025,111,'Monitor',2,19000),
(1026,112,'Printer',4,12000),
(1027,112,'Keyboard',7,1200),
(1028,113,'Laptop',3,54000),
(1029,113,'Mouse',6,850),
(1030,113,'Headphones',4,5000),
(1031,114,'Mobile Phone',2,34000),
(1032,114,'Monitor',3,17500),
(1033,115,'Laptop',2,59000),
(1034,115,'Printer',2,14000),
(1035,116,'Office Chair',5,9000),
(1036,117,'Laptop',1,61000),
(1037,117,'Keyboard',8,1250),
(1038,118,'Mobile Phone',3,33000),
(1039,118,'Headphones',6,4300),
(1040,119,'Laptop',2,56000),
(1041,119,'Monitor',2,18500),
(1042,119,'Printer',1,15000),
(1043,121,'Laptop',1,60000),
(1044,122,'Monitor',2,17000);
GO


/* ============================================================
   PRODUCTS TABLE
   ============================================================ */

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
GO

INSERT INTO Products (product_id, product_name, category, price)
VALUES
(201,'Laptop','Electronics',60000),
(202,'Mobile Phone','Electronics',35000),
(203,'Monitor','Electronics',18000),
(204,'Printer','Electronics',14000),
(205,'Keyboard','Accessories',1500),
(206,'Mouse','Accessories',800),
(207,'Headphones','Accessories',4500),
(208,'Office Chair','Furniture',9000),
(209,'Webcam','Accessories',3500),
(210,'Tablet','Electronics',28000),
(211,'Desk','Furniture',15000),
(212,'USB Hub','Accessories',1200);
GO


/* ============================================================
   DEPARTMENTS TABLE
   ============================================================ */

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
GO

INSERT INTO Departments (department_id, department_name)
VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance'),
(4,'Human Resources'),
(5,'IT'),
(6,'Operations'),
(7,'Customer Support');
GO


/* ============================================================
   EMPLOYEES TABLE
   ============================================================ */

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    designation VARCHAR(100),
    salary DECIMAL(10,2)
);
GO

INSERT INTO Employees (employee_id, employee_name, department_id, designation, salary)
VALUES
(301,'Amit Shah',1,'Sales Executive',45000),
(302,'Bhavna Patel',1,'Sales Executive',48000),
(303,'Chirag Mehta',1,'Sales Manager',75000),
(304,'Disha Sharma',2,'Marketing Executive',50000),
(305,'Esha Desai',2,'Marketing Manager',78000),
(306,'Farhan Khan',3,'Financial Analyst',65000),
(307,'Gauri Joshi',3,'Finance Manager',90000),
(308,'Harsh Patel',4,'HR Executive',48000),
(309,'Isha Shah',5,'Software Engineer',70000),
(310,'Jay Mehta',5,'System Administrator',68000),
(311,'Kriti Desai',6,'Operations Executive',52000),
(312,'Lalit Shah',NULL,'Sales Executive',46000);
GO


/* ============================================================
   TASK 1. CUSTOMER REVENUE PERFORMANCE
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_purchase_value,
    AVG(o.amount) AS average_order_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) >= 3
    AND SUM(o.amount) > 75000
ORDER BY
    total_purchase_value DESC;
GO


/* ============================================================
   TASK 2. REGIONAL SALES PERFORMANCE
   ============================================================ */
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS number_of_customers,
    COUNT(o.order_id) AS number_of_orders,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_sales,
    AVG(o.amount) AS average_order_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.city
HAVING
    SUM(o.amount) > 100000
ORDER BY
    total_sales DESC;
GO


/* ============================================================
   TASK 3. HIGH-VALUE CUSTOMER
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount) AS total_purchase,
    MAX(o.amount) AS highest_transaction
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    MAX(o.amount) > 25000
    AND SUM(o.amount) > 50000;
GO


/* ============================================================
   TASK 4. CUSTOMERS WITH MORE THAN 4 ORDERS
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_purchase_value,
    AVG(o.amount) AS average_order_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) > 4
ORDER BY
    order_count DESC,
    total_purchase_value DESC;
GO


/* ============================================================
   TASK 5. PRODUCT REVENUE PERFORMANCE
   ============================================================ */
SELECT
    o.product_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS revenue,
    AVG(o.amount) AS average_order_amount,
    MAX(o.amount) AS max_order_amount
FROM Orders AS o
GROUP BY
    o.product_name
HAVING
    COUNT(o.order_id) >= 3
ORDER BY
    revenue DESC;
GO


/* ============================================================
   TASK 6. HIGH-VOLUME PRODUCTS
   ============================================================ */
SELECT
    o.product_name,
    SUM(o.quantity) AS total_quantity,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount) AS total_revenue
FROM Orders AS o
GROUP BY
    o.product_name
HAVING
    SUM(o.quantity) > 100
    AND COUNT(o.order_id) > 5;
GO


/* ============================================================
   TASK 7. CITY REVENUE CONTRIBUTION
   ============================================================ */
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount) AS total_revenue
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.city
HAVING
    COUNT(DISTINCT c.customer_id) >= 3
    AND COUNT(o.order_id) >= 5
    AND SUM(o.amount) > 200000;
GO


/* ============================================================
   TASK 8. CUSTOMER ORDER VALUE ANALYSIS
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    MIN(o.amount) AS minimum_order_value,
    MAX(o.amount) AS maximum_order_value,
    AVG(o.amount) AS average_order_value,
    SUM(o.amount) AS total_purchase_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) >= 3;
GO


/* ============================================================
   TASK 9. CUSTOMERS WITH AT LEAST 5 ORDERS
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_purchase_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) >= 5
ORDER BY
    order_count DESC;
GO


/* ============================================================
   TASK 10. CUSTOMERS WITH ONLY 1 OR 2 ORDERS
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount) AS total_purchase_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) BETWEEN 1 AND 2
ORDER BY
    total_purchase_value DESC;
GO


/* ============================================================
   TASK 11. ADVANCED LEFT JOIN COVERAGE
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.quantity), 0) AS total_quantity,
    COALESCE(SUM(o.amount), 0) AS total_purchase_value
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY
    c.customer_id;
GO


/* ============================================================
   TASK 12. CUSTOMERS WITH ZERO ORDER ACTIVITY
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL;
GO


/* ============================================================
   TASK 13. EVERY CUSTOMER WITH ORDER SUMMARY
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.amount), 0) AS total_purchase
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY
    c.customer_id;
GO


/* ============================================================
   TASK 14. PRODUCTS IN CATALOG WITH ZERO SALES
   ============================================================ */
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM Products AS p
LEFT JOIN Orders AS o
    ON p.product_name = o.product_name
WHERE
    o.order_id IS NULL;
GO


/* ============================================================
   TASK 15. FULL / RIGHT JOIN RECONCILIATION
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.quantity,
    o.amount
FROM Customers AS c
FULL OUTER JOIN Orders AS o
    ON c.customer_id = o.customer_id
ORDER BY
    COALESCE(c.customer_id, o.customer_id),
    o.order_id;
GO


/* ============================================================
   TASK 16. IDENTIFY NONMATCHING CUSTOMER / ORDER RECORDS
   ============================================================ */
SELECT
    c.customer_id AS customer_table_id,
    c.customer_name,
    o.order_id,
    o.customer_id AS order_table_customer_id,
    o.product_name,
    o.amount
FROM Customers AS c
FULL OUTER JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE
    c.customer_id IS NULL
    OR o.customer_id IS NULL;
GO


/* ============================================================
   TASK 17. COMPLETE RECONCILIATION WITH TRANSACTION VALUE
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.quantity,
    o.amount,
    CASE
        WHEN c.customer_id IS NULL THEN 'Order Without Customer'
        WHEN o.customer_id IS NULL THEN 'Customer Without Order'
        ELSE 'Matched'
    END AS reconciliation_status,
    CASE
        WHEN o.order_id IS NOT NULL
        THEN o.quantity * o.amount
        ELSE 0
    END AS transaction_value
FROM Customers AS c
FULL OUTER JOIN Orders AS o
    ON c.customer_id = o.customer_id
ORDER BY
    COALESCE(c.customer_id, o.customer_id),
    o.order_id;
GO


/* ============================================================
   TASK 18. CUSTOMERS WITH NO COMMERCIAL ACTIVITY
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE
    o.customer_id IS NULL;
GO


/* ============================================================
   TASK 19. PRODUCTS WITH NO SALES
   ============================================================ */
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM Products AS p
LEFT JOIN Orders AS o
    ON p.product_name = o.product_name
WHERE
    o.product_name IS NULL;
GO


/* ============================================================
   TASK 20. CUSTOMER ACQUISITION GAP
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE
    o.customer_id IS NULL;
GO


/* ============================================================
   TASK 21. UNSOLD PRODUCTS SORTED BY PRICE
   ============================================================ */
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM Products AS p
LEFT JOIN Orders AS o
    ON p.product_name = o.product_name
WHERE
    o.order_id IS NULL
ORDER BY
    p.price DESC;
GO


/* ============================================================
   TASK 22. CROSS JOIN CUSTOMER × PRODUCT COMBINATIONS
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM Customers AS c
CROSS JOIN Products AS p
ORDER BY
    c.customer_id,
    p.product_id;
GO


/* ============================================================
   TASK 23. COUNT CUSTOMER × PRODUCT COMBINATIONS
   ============================================================ */
SELECT
    COUNT(*) AS total_customer_product_combinations
FROM Customers AS c
CROSS JOIN Products AS p;
GO


/* ============================================================
   TASK 24. EVERY CITY × PRODUCT COMBINATION
   ============================================================ */
SELECT
    c.city,
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM
    (SELECT DISTINCT city FROM Customers) AS c
CROSS JOIN Products AS p
ORDER BY
    c.city,
    p.product_id;
GO


/* ============================================================
   TASK 25. CUSTOMER SALES LEADERBOARD DATASET
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount) AS revenue,
    AVG(o.amount) AS average_order_value,
    SUM(o.quantity) AS total_quantity
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) >= 3
ORDER BY
    revenue DESC,
    order_count DESC,
    average_order_value DESC;
GO


/* ============================================================
   TASK 26. PRODUCT BUSINESS REVIEW
   ============================================================ */
SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS revenue,
    AVG(o.amount) AS average_order_value
FROM Products AS p
INNER JOIN Orders AS o
    ON p.product_name = o.product_name
GROUP BY
    p.product_id,
    p.product_name,
    p.category
HAVING
    COUNT(o.order_id) >= 5
    AND SUM(o.amount) > 200000
ORDER BY
    revenue DESC;
GO


/* ============================================================
   TASK 27. MARKET PERFORMANCE
   ============================================================ */
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS revenue,
    AVG(o.amount) AS average_order_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.city
HAVING
    COUNT(DISTINCT c.customer_id) >= 5
    AND COUNT(o.order_id) > 10
    AND SUM(o.amount) > 500000
ORDER BY
    revenue DESC;
GO


/* ============================================================
   TASK 28. CUSTOMERS WITH AT LEAST 2 HIGH-VALUE ORDERS
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(CASE
        WHEN o.amount > 25000 THEN 1
    END) AS qualifying_order_count,
    SUM(CASE
        WHEN o.amount > 25000 THEN o.amount
        ELSE 0
    END) AS qualifying_total_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(CASE
        WHEN o.amount > 25000 THEN 1
    END) >= 2
ORDER BY
    qualifying_total_value DESC;
GO


/* ============================================================
   TASK 29. HIGH-PERFORMING PRODUCTS
   ============================================================ */
SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS revenue
FROM Products AS p
INNER JOIN Orders AS o
    ON p.product_name = o.product_name
GROUP BY
    p.product_id,
    p.product_name,
    p.category
HAVING
    SUM(o.quantity) > 100
    AND COUNT(o.order_id) >= 5
    AND SUM(o.amount) > 100000
ORDER BY
    revenue DESC;
GO


/* ============================================================
   TASK 30. EXECUTIVE SALES PERFORMANCE REPORT
   ============================================================ */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_purchase_value,
    AVG(o.amount) AS average_order_value,
    MIN(o.amount) AS minimum_order_value,
    MAX(o.amount) AS maximum_order_value
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) >= 3
    AND SUM(o.amount) > 100000
ORDER BY
    total_purchase_value DESC;
GO


/* ============================================================
   END OF PRACTICE FILE
   ============================================================ */
