-- ============================================================
-- SQL for Data Analytics - Practice Exercise
-- Topic: SQL Aggregations & Filtering
-- SQL Dialect: T-SQL (SQL Server)
-- ============================================================


-- ============================================================
-- Practice Table
-- ============================================================

DROP TABLE IF EXISTS Students;


CREATE TABLE Students
(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(20),
    marks INT
);


-- ============================================================
-- Insert Practice Data
-- ============================================================

INSERT INTO Students (id, name, course, marks)
VALUES
    (1, 'Aman', 'BCA', 75),
    (2, 'Neha', 'MCA', 90),
    (3, 'Karan', 'BCA', 65),
    (4, 'Riya', 'BBA', 80),
    (5, 'Meena', 'MCA', 88);


-- ============================================================
-- Q1. Count Total Number of Students
-- ============================================================

SELECT COUNT(*) AS total_students
FROM Students;


-- ============================================================
-- Q2. Display Highest and Lowest Marks
-- ============================================================

SELECT
    MAX(marks) AS highest_marks,
    MIN(marks) AS lowest_marks
FROM Students;


-- ============================================================
-- Q3. Total Marks by Course
-- ============================================================

SELECT
    course,
    SUM(marks) AS total_marks
FROM Students
GROUP BY course;


-- ============================================================
-- Q4. Average Marks per Course
-- ============================================================

SELECT
    course,
    AVG(marks) AS average_marks
FROM Students
GROUP BY course;


-- ============================================================
-- Q5. Courses with Average Marks Greater Than 80
-- ============================================================

SELECT
    course,
    AVG(marks) AS average_marks
FROM Students
GROUP BY course
HAVING AVG(marks) > 80;


-- ============================================================
-- Q6. Top 2 Scoring Students
-- ============================================================

SELECT TOP 2
    id,
    name,
    course,
    marks
FROM Students
ORDER BY marks DESC;


-- ============================================================
-- Q7. Students with Marks Between 60 and 90
-- ============================================================

SELECT *
FROM Students
WHERE marks BETWEEN 60 AND 90;


-- ============================================================
-- Q8. Students Enrolled in BCA or MCA
-- ============================================================

SELECT *
FROM Students
WHERE course IN ('BCA', 'MCA');


-- ============================================================
-- Q9. Count Unique Courses
-- ============================================================

SELECT COUNT(DISTINCT course) AS unique_courses
FROM Students;


-- ============================================================
-- Q10. Students Whose Names Start with 'N'
-- ============================================================

SELECT name
FROM Students
WHERE name LIKE 'N%';