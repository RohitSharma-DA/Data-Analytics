-- ============================================================
-- SQL for Data Analytics - Practice Exercise
-- Topic: SQL Data Filtering & Modification
-- SQL Dialect: T-SQL (SQL Server)
-- ============================================================


-- ============================================================
-- Step 1. Create Students Table
-- ============================================================

DROP TABLE IF EXISTS Students;

CREATE TABLE Students
(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(30),
    marks INT
);


-- ============================================================
-- Step 2. Insert Sample Data
-- ============================================================

INSERT INTO Students (id, name, course, marks)
VALUES
    (1, 'Aman', 'BCA', 78),
    (2, 'Neha', 'MCA', 90),
    (3, 'Riya', 'BBA', 62),
    (4, 'Karan', 'BCA', 55),
    (5, 'Meena', 'MCA', 88);


-- ============================================================
-- Q1. Display Students with Marks Greater Than 70
-- ============================================================

SELECT *
FROM Students
WHERE marks > 70;


-- ============================================================
-- Q2. Display Names and Courses of BCA Students
-- ============================================================

SELECT
    name,
    course
FROM Students
WHERE course = 'BCA';


-- ============================================================
-- Q3. Display Students Whose Names Start with 'A'
-- ============================================================

SELECT *
FROM Students
WHERE name LIKE 'A%';


-- ============================================================
-- Q4. Display Students with Marks Between 60 and 90
-- ============================================================

SELECT *
FROM Students
WHERE marks BETWEEN 60 AND 90;


-- ============================================================
-- Q5. Display Students Except Those in BBA
-- ============================================================

SELECT *
FROM Students
WHERE course <> 'BBA';


-- ============================================================
-- Q6. Display Student Names and Marks
--      Sorted by Marks in Descending Order
-- ============================================================

SELECT
    name,
    marks
FROM Students
ORDER BY marks DESC;


-- ============================================================
-- Q7. Display Students Whose Course Ends with 'A'
-- ============================================================

SELECT *
FROM Students
WHERE course LIKE '%A';


-- ============================================================
-- Q8. Update Riya's Marks to 85
-- ============================================================

UPDATE Students
SET marks = 85
WHERE name = 'Riya';


-- Verify the updated record
SELECT *
FROM Students
WHERE name = 'Riya';


-- ============================================================
-- Q9. Delete Student with id = 5
-- ============================================================

DELETE FROM Students
WHERE id = 5;


-- Verify the deletion
SELECT *
FROM Students;


-- ============================================================
-- Q10. Students with Marks Greater Than 60
--      Ordered by Name (A-Z)
-- ============================================================

SELECT *
FROM Students
WHERE marks > 60
ORDER BY name ASC;