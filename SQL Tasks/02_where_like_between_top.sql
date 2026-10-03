-- ============================================================
-- SQL for Data Analytics - Practice Exercise
-- Topic: SQL Filtering & Sorting
-- SQL Dialect: T-SQL (SQL Server)
-- ============================================================


-- ============================================================
-- Practice Table
-- ============================================================
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    age INT
);


-- Insert Practice Data

INSERT INTO Employees (id, name, department, salary, age)
VALUES
    (1, 'Amit', 'IT', 60000, 28),
    (2, 'Sneha', 'HR', 45000, 25),
    (3, 'Raj', 'Finance', 70000, 32),
    (4, 'Simran', 'IT', 52000, 27),
    (5, 'Karan', 'Marketing', 40000, 24);


-- ============================================================
-- Q1. Salary Greater Than 40000
-- ============================================================

SELECT *
FROM Employees
WHERE salary > 40000;


-- ============================================================
-- Q2. Employees from IT Department
-- ============================================================

SELECT *
FROM Employees
WHERE department = 'IT';


-- ============================================================
-- Q3. Age Between 25 and 30
-- ============================================================

SELECT *
FROM Employees
WHERE age BETWEEN 25 AND 30;


-- ============================================================
-- Q4. Name Starts with S
-- ============================================================

SELECT *
FROM Employees
WHERE name LIKE 'S%';


-- ============================================================
-- Q5. Top 3 Salaries
-- ============================================================

SELECT TOP 3 *
FROM Employees
ORDER BY salary DESC;


-- ============================================================
-- Q6. Employees NOT in HR Department
-- ============================================================

SELECT *
FROM Employees
WHERE department <> 'HR';