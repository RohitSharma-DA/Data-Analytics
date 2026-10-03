-- ============================================================
-- SQL for Data Analytics - Practical Exercise
-- Topic: SQL Fundamentals - Database & Table Creation
-- SQL Dialect: T-SQL (SQL Server)
-- ============================================================


-- ============================================================
-- Task 1. Create SchoolDB Database
-- ============================================================

CREATE DATABASE SchoolDB;


-- ============================================================
-- Task 2. Use SchoolDB Database
-- ============================================================

USE SchoolDB;


-- ============================================================
-- Task 3. Create Students Table
-- ============================================================
DROP TABLE IF EXISTS Students;
CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    Course VARCHAR(100),
    Marks DECIMAL(5, 2)
);


-- ============================================================
-- Task 4. Insert Records into Students Table
-- ============================================================

INSERT INTO Students
    (StudentID, StudentName, Age, Course, Marks)
VALUES
    (1, 'Rahul', 21, 'Data Analytics', 85.50),
    (2, 'Priya', 22, 'Computer Science', 91.00),
    (3, 'Amit', 20, 'Data Science', 78.50),
    (4, 'Neha', 23, 'Information Technology', 88.00),
    (5, 'Rohit', 21, 'Data Analytics', 82.00);


-- ============================================================
-- Task 5. Display All Records from Students
-- ============================================================

SELECT *
FROM Students;


-- ============================================================
-- Task 6. Create Employees Table
-- ============================================================

-- Note:
-- SQL Server does not have a BOOLEAN data type.
-- BIT is used instead:
-- 1 = TRUE
-- 0 = FALSE
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2),
    JoiningDate DATE,
    IsActive BIT
);


-- ============================================================
-- Task 7. Insert and Display Employee Records
-- ============================================================

INSERT INTO Employees
    (EmployeeID, EmployeeName, Salary, JoiningDate, IsActive)
VALUES
    (101, 'Amit Sharma', 45000.00, '2024-01-15', 1),
    (102, 'Priya Patel', 55000.50, '2023-06-20', 1),
    (103, 'Rahul Mehta', 38000.75, '2025-02-10', 0);


-- Display all employee records
SELECT *
FROM Employees;