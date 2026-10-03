-- ============================================================
-- SQL for Data Analytics - Practice Exercise
-- Topic: SQL Joins & Customer Order Analysis
-- SQL Dialect: T-SQL (SQL Server)
-- ============================================================


-- ============================================================
-- CREATE TABLES
-- ============================================================

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customer;


-- ============================================================
-- Create Customer Table
-- ============================================================

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);


-- ============================================================
-- Insert Customers
-- ============================================================

INSERT INTO Customer
    (customer_id, customer_name, city, country)
VALUES
    (1, 'Rahul Sharma', 'Ahmedabad', 'India'),
    (2, 'Priya Patel', 'Mumbai', 'India'),
    (3, 'Amit Shah', 'Delhi', 'India'),
    (4, 'Neha Mehta', 'Pune', 'India'),
    (5, 'Rohan Desai', 'Surat', 'India'),
    (6, 'Karan Joshi', 'Jaipur', 'India'),
    (7, 'Sneha Patel', 'Bangalore', 'India'),
    (8, 'Vikas Shah', 'Vadodara', 'India'),
    (9, 'Anjali Singh', 'Delhi', 'India'),
    (10, 'Raj Malhotra', 'Chennai', 'India');


-- ============================================================
-- Create Orders Table
-- ============================================================

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    quantity INT,
    amount DECIMAL(10, 2)
);


-- ============================================================
-- Insert Orders
-- ============================================================

INSERT INTO Orders
    (order_id, customer_id, product_name, quantity, amount)
VALUES
    (101, 1, 'Laptop', 1, 55000.00),
    (102, 2, 'Mobile', 2, 30000.00),
    (103, 3, 'Keyboard', 3, 4500.00),
    (104, 4, 'Monitor', 1, 18000.00),
    (105, 5, 'Mouse', 5, 2500.00),
    (106, 6, 'Printer', 1, 12000.00),
    (107, 7, 'Laptop Bag', 2, 3000.00),
    (108, 11, 'Tablet', 1, 25000.00),
    (109, 12, 'Headphones', 2, 6000.00),
    (110, 13, 'Smart Watch', 1, 8000.00);


-- ============================================================
-- TASK 1. Customer Order Details
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- TASK 2. Customers With Orders
-- ============================================================

SELECT
    c.customer_name,
    c.city,
    o.product_name,
    o.amount AS order_amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- TASK 3. All Customers
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- TASK 4. Customers Without Orders
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- ============================================================
-- TASK 5. All Orders
-- ============================================================

SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.product_name,
    o.amount
FROM Customer AS c
RIGHT JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- TASK 6. Orders Without Customers
-- ============================================================

SELECT
    o.order_id,
    o.customer_id,
    o.product_name,
    o.amount
FROM Customer AS c
RIGHT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;


-- ============================================================
-- TASK 7. Full Customer and Order Analysis
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
FULL OUTER JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- TASK 8. Orders Above 10,000
-- ============================================================

SELECT
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.amount > 10000;


-- ============================================================
-- TASK 9. Customers From Delhi
-- ============================================================

SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE c.city = 'Delhi';


-- ============================================================
-- TASK 10. Orders With Quantity Greater Than 2
-- ============================================================

SELECT
    c.customer_name,
    o.product_name,
    o.quantity,
    o.amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.quantity > 2
ORDER BY o.quantity DESC;


-- ============================================================
-- TASK 11. Total Amount Spent by Each Customer
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(SUM(o.amount), 0) AS total_amount
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- ============================================================
-- TASK 12. Number of Orders Per Customer
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- ============================================================
-- TASK 13. Average Order Amount
-- ============================================================

SELECT
    c.customer_name,
    AVG(o.amount) AS average_order_amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- ============================================================
-- TASK 14. Highest Order Amount
-- ============================================================

SELECT TOP 1
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;


-- ============================================================
-- TASK 15. Lowest Order Amount
-- ============================================================

SELECT TOP 1
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
ORDER BY o.amount ASC;


-- ============================================================
-- TASK 16. Customer Order Summary
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders,
    COALESCE(SUM(o.quantity), 0) AS total_quantity,
    COALESCE(SUM(o.amount), 0) AS total_amount
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- ============================================================
-- TASK 17. Customers With Total Spending Greater Than 20,000
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.amount) AS total_spending
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(o.amount) > 20000;


-- ============================================================
-- TASK 18. Customers With More Than One Order
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(o.order_id) > 1;


-- ============================================================
-- TASK 19. Compare Matching and Unmatched Records
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.customer_id AS order_customer_id,
    o.product_name,
    o.amount,
    CASE
        WHEN c.customer_id IS NOT NULL
             AND o.order_id IS NOT NULL
            THEN 'Customer With Order'

        WHEN c.customer_id IS NOT NULL
             AND o.order_id IS NULL
            THEN 'Customer Without Order'

        WHEN c.customer_id IS NULL
             AND o.order_id IS NOT NULL
            THEN 'Order Without Customer'
    END AS record_status
FROM Customer AS c
FULL OUTER JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- TASK 20. Business Order Report
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.quantity,
    o.amount,
    o.quantity * o.amount AS total_value
FROM Customer AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id;