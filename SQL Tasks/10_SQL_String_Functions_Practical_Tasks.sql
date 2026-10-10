/*
SQL STRING FUNCTIONS - PRACTICAL WORKBOOK (T-SQL / SQL Server)

WARNING: This script DROPS SQL_String_Functions if it already exists.
All data inside that database will be deleted. Run only for practice.
*/

USE master;
GO
IF DB_ID(N'SQL_String_Functions') IS NOT NULL
BEGIN
    ALTER DATABASE SQL_String_Functions SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SQL_String_Functions;
END;
GO
CREATE DATABASE SQL_String_Functions;
GO
USE SQL_String_Functions;
GO

/* Task 1 - Create the Employees table */
DROP TABLE IF EXISTS dbo.Employees;
GO
CREATE TABLE dbo.Employees
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);
GO

/* Task 2 - Insert the 20 employee records */
INSERT INTO dbo.Employees (employee_id, employee_name, email, department, city)
VALUES
(101,'Rahul Sharma','rahul.sharma@gmail.com','IT','Ahmedabad'),
(102,'Priya Patel','priya.patel@gmail.com','HR','Mumbai'),
(103,'Amit Shah','amit.shah@gmail.com','Finance','Ahmedabad'),
(104,'Neha Mehta','neha.mehta@gmail.com','IT','Pune'),
(105,'Rohan Desai','rohan.desai@gmail.com','Sales','Delhi'),
(106,'  Karan Joshi  ','karan.joshi@gmail.com','IT','Surat'),
(107,'SIMRAN KAUR','simran.kaur@gmail.com','HR','Chandigarh'),
(108,'vijay kumar','vijay.kumar@yahoo.com','Finance','Jaipur'),
(109,'Anjali Verma','anjali.verma@company.com','Marketing','Ahmedabad'),
(110,'Suresh Reddy','suresh.reddy@gmail.com','IT','Hyderabad'),
(111,'Pooja Nair','pooja.nair@yahoo.com','Sales','Kochi'),
(112,'  Arjun Singh','arjun.singh@company.com','Finance','Delhi'),
(113,'MEERA IYER','meera.iyer@gmail.com','HR','Chennai'),
(114,'Nikhil Gupta','nikhil.gupta@company.com','IT','Noida'),
(115,'Sneha Kapoor','sneha.kapoor@yahoo.com','Marketing','Mumbai'),
(116,'Ravi Kumar','ravi.kumar@gmail.com','Sales','Bangalore'),
(117,'  Divya Shah  ','divya.shah@company.com','IT','Ahmedabad'),
(118,'AARAV MALHOTRA','aarav.malhotra@gmail.com','Finance','Delhi'),
(119,'Isha Patel','isha.patel@yahoo.com','HR','Surat'),
(120,'Manish Tiwari','manish.tiwari@company.com','Marketing','Lucknow');
GO

/* Task 3 - Verify the dataset; expected count = 20 */
SELECT * FROM dbo.Employees ORDER BY employee_id;
GO
SELECT COUNT(*) AS Total_Employees FROM dbo.Employees;
GO

/* Task 1 - Uppercase and lowercase names */
SELECT employee_id, employee_name,
       UPPER(employee_name) AS Uppercase_Name,
       LOWER(employee_name) AS Lowercase_Name
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 2 - LEN ignores trailing spaces; DATALENGTH counts stored bytes */
SELECT employee_name, LEN(employee_name) AS Character_Count,
       DATALENGTH(employee_name) AS Byte_Count
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 3 - Format: 101 | RAHUL SHARMA | IT | AHMEDABAD */
SELECT CONCAT(employee_id, ' | ', UPPER(TRIM(employee_name)), ' | ',
              UPPER(department), ' | ', UPPER(city)) AS Employee_Information
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 4 - Format: Rahul Sharma - IT - Ahmedabad */
SELECT CONCAT_WS(' - ', TRIM(employee_name), department, city) AS Employee_Profile
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 5 - First three characters of trimmed name */
SELECT employee_name, LEFT(TRIM(employee_name), 3) AS Employee_Initials
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 6 - Last five characters of trimmed name */
SELECT employee_name, RIGHT(TRIM(employee_name), 5) AS Last_Five_Characters
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 7 - Extract first name */
SELECT employee_name,
       CASE WHEN CHARINDEX(' ', TRIM(employee_name)) > 0
            THEN LEFT(TRIM(employee_name), CHARINDEX(' ', TRIM(employee_name)) - 1)
            ELSE TRIM(employee_name) END AS First_Name
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 8 - Last name (final word) */
SELECT employee_name,
       CASE WHEN CHARINDEX(' ', TRIM(employee_name)) > 0
            THEN RIGHT(TRIM(employee_name), CHARINDEX(' ', REVERSE(TRIM(employee_name))) - 1)
            ELSE TRIM(employee_name) END AS Last_Name
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 9 - Position of first space after trimming outer spaces */
SELECT employee_name, CHARINDEX(' ', TRIM(employee_name)) AS Space_Position
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 10 - Names containing 'ah'; show its position */
SELECT employee_id, employee_name,
       CHARINDEX('ah', LOWER(TRIM(employee_name))) AS Position_Of_ah
FROM dbo.Employees
WHERE PATINDEX('%ah%', LOWER(TRIM(employee_name))) > 0
ORDER BY employee_id;
GO

/* Task 11 - Email username */
SELECT employee_id, email,
       LEFT(email, CHARINDEX('@', email) - 1) AS Email_Username
FROM dbo.Employees
WHERE CHARINDEX('@', email) > 0 ORDER BY employee_id;
GO

/* Task 12 - Email domain */
SELECT employee_id, email,
       SUBSTRING(email, CHARINDEX('@', email) + 1,
                 LEN(email) - CHARINDEX('@', email)) AS Email_Domain
FROM dbo.Employees
WHERE CHARINDEX('@', email) > 0 ORDER BY employee_id;
GO

/* Task 13 - Generate cleaned lowercase usernames */
SELECT employee_id,
       LOWER(REPLACE(TRIM(employee_name), ' ', '.')) AS Username
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 14 - First character uppercase, all remaining characters lowercase */
SELECT employee_id, employee_name,
       CONCAT(UPPER(LEFT(TRIM(employee_name), 1)),
              LOWER(SUBSTRING(TRIM(employee_name), 2, LEN(TRIM(employee_name)))))
              AS Standardized_Name
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 15 - Replace gmail.com with company.com */
SELECT employee_id, email AS Original_Email,
       REPLACE(email, 'gmail.com', 'company.com') AS Updated_Email
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 16 - Format: EMP-101-IT */
SELECT employee_id,
       CONCAT('EMP-', employee_id, '-', UPPER(department)) AS Employee_Code
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 17 - Reverse names */
SELECT employee_name AS Original_Name, REVERSE(employee_name) AS Reversed_Name
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 18 - Append exactly 10 asterisks */
SELECT employee_name,
       CONCAT(TRIM(employee_name), REPLICATE('*', 10)) AS Formatted_Name
FROM dbo.Employees ORDER BY employee_id;
GO

/* Task 19 - Department count and comma-separated employee names */
SELECT department AS Department, COUNT(*) AS Employee_Count,
       STRING_AGG(TRIM(employee_name), ', ')
           WITHIN GROUP (ORDER BY employee_id) AS Employees
FROM dbo.Employees
GROUP BY department ORDER BY department;
GO

/* Task 20 - Complete transformation report; no additional tables */
SELECT
    employee_id,
    employee_name AS Original_Name,
    UPPER(TRIM(employee_name)) AS Clean_Name,
    CASE WHEN CHARINDEX(' ', TRIM(employee_name)) > 0
         THEN LEFT(UPPER(TRIM(employee_name)),
                   CHARINDEX(' ', TRIM(employee_name)) - 1)
         ELSE UPPER(TRIM(employee_name)) END AS First_Name,
    CASE WHEN CHARINDEX(' ', TRIM(employee_name)) > 0
         THEN RIGHT(UPPER(TRIM(employee_name)),
                    CHARINDEX(' ', REVERSE(TRIM(employee_name))) - 1)
         ELSE UPPER(TRIM(employee_name)) END AS Last_Name,
    LOWER(REPLACE(TRIM(employee_name), ' ', '.')) AS Username,
    CASE WHEN CHARINDEX('@', email) > 0
         THEN LEFT(email, CHARINDEX('@', email) - 1) END AS Email_Username,
    CASE WHEN CHARINDEX('@', email) > 0
         THEN SUBSTRING(email, CHARINDEX('@', email) + 1,
                        LEN(email) - CHARINDEX('@', email)) END AS Email_Domain,
    LEN(UPPER(TRIM(employee_name))) AS Name_Length,
    CASE
        WHEN LEN(TRIM(employee_name)) > 12 THEN 'Long Name'
        WHEN LEN(TRIM(employee_name)) BETWEEN 8 AND 12 THEN 'Medium Name'
        ELSE 'Short Name'
    END AS Name_Category
FROM dbo.Employees ORDER BY employee_id;
GO

/* PART 3 - ADDITIONAL CHALLENGES */

/* Challenge 1 - Employees whose email domain is gmail.com */
SELECT employee_id, employee_name, email
FROM dbo.Employees
WHERE CHARINDEX('@', email) > 0
  AND LOWER(SUBSTRING(email, CHARINDEX('@', email) + 1,
                      LEN(email) - CHARINDEX('@', email))) = 'gmail.com'
ORDER BY employee_id;
GO

/* Challenge 2 - Employee count by city */
SELECT city, COUNT(*) AS Employee_Count
FROM dbo.Employees GROUP BY city
ORDER BY Employee_Count DESC, city;
GO

/* Challenge 3 - Unique departments in uppercase */
SELECT DISTINCT UPPER(department) AS Department
FROM dbo.Employees ORDER BY Department;
GO

/* Challenge 4 - Cleaned names longer than 10 characters */
SELECT employee_id, employee_name, LEN(TRIM(employee_name)) AS Clean_Name_Length
FROM dbo.Employees
WHERE LEN(TRIM(employee_name)) > 10
ORDER BY Clean_Name_Length DESC, employee_id;
GO

/* Challenge 5 - Names with leading or trailing spaces */
SELECT employee_id, employee_name,
       CONCAT('[', employee_name, ']') AS Name_Between_Brackets
FROM dbo.Employees
WHERE DATALENGTH(employee_name) <> DATALENGTH(TRIM(employee_name))
ORDER BY employee_id;
GO

/* Challenge 6 - Department-wise employee list using STRING_AGG */
SELECT department,
       STRING_AGG(TRIM(employee_name), ', ')
           WITHIN GROUP (ORDER BY employee_id) AS Employee_List
FROM dbo.Employees
GROUP BY department ORDER BY department;
GO

/* Challenge 7 - Cleaned names beginning with A */
SELECT employee_id, employee_name, UPPER(TRIM(employee_name)) AS Clean_Name
FROM dbo.Employees
WHERE UPPER(LEFT(TRIM(employee_name), 1)) = 'A'
ORDER BY employee_id;
GO

/* Challenge 8 - Padded employee code using CONCAT and REPLICATE; e.g. EMP-000101 */
SELECT employee_id,
       CONCAT('EMP-',
              REPLICATE('0', CASE
                  WHEN LEN(CONVERT(VARCHAR(10), employee_id)) < 6
                  THEN 6 - LEN(CONVERT(VARCHAR(10), employee_id))
                  ELSE 0
              END),
              employee_id) AS Unique_Employee_Code
FROM dbo.Employees ORDER BY employee_id;
GO

/* FINAL VALIDATION */
SELECT COUNT(*) AS Total_Employees,
       COUNT(DISTINCT employee_id) AS Unique_Employee_IDs,
       COUNT(DISTINCT department) AS Department_Count,
       COUNT(DISTINCT city) AS City_Count
FROM dbo.Employees;
GO