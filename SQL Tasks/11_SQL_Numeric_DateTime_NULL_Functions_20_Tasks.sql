CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    SalesAmount DECIMAL(12,2),
    Discount DECIMAL(5,2),
    Quantity INT,
    JoinDate DATE,
    SaleDate DATETIME,
    BirthDate DATE,
    Bonus DECIMAL(10,2),
    Commission DECIMAL(10,2)
);

INSERT INTO EmployeeSales VALUES
(1, 'Aarav', 'Sales', 45000.75, 12500.567, 5.50, 10, '2021-03-15', '2026-01-05 10:30:00', '1995-06-12', 2500, 750),
(2, 'Priya', 'IT', 65000.40, 18750.255, NULL, 5, '2019-07-22', '2026-01-10 14:45:00', '1992-11-25', 5000, NULL),
(3, 'Rohan', 'Finance', 55000.99, 9200.899, 10.00, 8, '2022-01-10', '2026-02-15 09:15:00', '1998-03-18', NULL, 450),
(4, 'Neha', 'Sales', 48000.25, 15400.333, 7.25, 12, '2020-11-05', '2026-02-20 16:20:00', '1996-08-30', 3000, 900),
(5, 'Vikram', 'IT', 72000.80, 22500.789, NULL, 7, '2018-05-18', '2026-03-12 11:10:00', '1990-01-14', 6000, 1200),
(6, 'Ananya', 'HR', 42000.60, 6800.456, 3.00, 4, '2023-06-01', '2026-03-18 13:35:00', '2000-04-22', NULL, NULL),
(7, 'Karan', 'Finance', 58000.35, 11200.678, 8.50, 9, '2021-09-12', '2026-04-02 08:50:00', '1994-12-05', 3500, 650),
(8, 'Meera', 'Sales', 51000.90, 19800.444, 6.00, 15, '2017-02-28', '2026-04-15 17:40:00', '1989-07-19', 4000, NULL),
(9, 'Arjun', 'IT', 68000.55, 16750.123, 4.50, 6, '2020-08-17', '2026-05-05 12:25:00', '1993-09-09', NULL, 1100),
(10, 'Isha', 'HR', 44000.20, 7350.987, NULL, 3, '2024-01-15', '2026-05-20 15:05:00', '2001-02-28', 1500, 300),
(11, 'Dev', 'Finance', 60000.00, 14300.555, 9.00, 11, '2019-12-10', '2026-06-08 10:00:00', '1991-05-16', 4500, 800),
(12, 'Simran', 'Sales', 49500.45, 17800.222, NULL, 14, '2022-04-25', '2026-06-18 18:15:00', '1997-10-11', NULL, 950),
(13, 'Kabir', 'IT', 75000.95, 24900.888, 12.00, 13, '2016-10-03', '2026-07-04 09:40:00', '1988-03-07', 7000, 1500),
(14, 'Tanya', 'HR', 46000.70, 8900.333, 5.00, 6, '2023-02-14', '2026-07-22 14:10:00', '1999-06-29', NULL, NULL),
(15, 'Rahul', 'Finance', 62000.15, 16200.777, 7.00, 10, '2018-09-20', '2026-08-11 11:55:00', '1990-12-17', 5500, 1000),
(16, 'Pooja', 'Sales', 53000.85, 21500.666, NULL, 16, '2020-04-06', '2026-08-25 16:45:00', '1994-04-03', 4200, 1250),
(17, 'Aditya', 'IT', 71000.30, 20500.999, 6.50, 8, '2017-06-19', '2026-09-02 08:30:00', '1992-08-21', NULL, 1350),
(18, 'Nisha', 'HR', 43000.95, 5600.111, 2.50, 5, '2024-03-11', '2026-09-10 13:20:00', '2002-01-08', 1000, NULL),
(19, 'Manish', 'Finance', 59000.65, 13100.444, NULL, 12, '2021-12-01', '2026-09-18 10:50:00', '1995-11-13', 3800, 700),
(20, 'Diya', 'Sales', 47000.50, 14600.888, 4.00, 9, '2022-08-08', '2026-09-25 17:25:00', '1998-05-27', NULL, 600);

------------------------------------------------------
----------------------Section A-----------------------
------------------------------------------------------

----------------------Task 1--------------------------

select e.employeeName,e.Salary, ROUND(e.SalesAmount,2) SalesAmount
from EmployeeSales e

----------------------Task 2--------------------------

select e.EmployeeName, ROUND(e.SalesAmount,0) SalesAmount
from EmployeeSales e

---------------------Task 3---------------------------

select e.EmployeeName, CEILING(e.SalesAmount) CeilingAmount, FLOOR(e.SalesAmount) FloorAmount
from EmployeeSales e

---------------------Task 4---------------------------

select e.EmployeeName, ABS(e.Salary - 50000) absSalary
from EmployeeSales e

---------------------Task 5---------------------------

select e.EmployeeName, SQUARE(e.Quantity) squaredQuantity
from EmployeeSales e

---------------------Task 6---------------------------

select e.EmployeeName, ROUND(SQRT(e.Quantity),2) sqrtAmount
from EmployeeSales e

---------------------Task 7---------------------------

select e.EmployeeName, ROUND(e.SalesAmount/nullif(e.Quantity,0),2) avgSellingAmount
from EmployeeSales e

------------------------------------------------------
-------------------Section B--------------------------
------------------------------------------------------

---------------------Task 8---------------------------

select e.EmployeeName, e.JoinDate,YEAR(e.JoinDate) joinYear, MONTH(e.JoinDate) joinMonth, DAY(e.JoinDate) joinDay
from EmployeeSales e

---------------------Task 9---------------------------

select e.EmployeeName, e.SaleDate,YEAR(e.SaleDate) saleYear, MONTH(e.SaleDate) saleMonth, DAY(e.SaleDate) saleDay
from EmployeeSales e

---------------------Task 10--------------------------

select e.EmployeeName, DATEDIFF(YEAR, e.JoinDate,e.SaleDate) workedYear
from EmployeeSales e

---------------------Task 11--------------------------

select e.EmployeeName, DATEDIFF(DAY, e.JoinDate,e.SaleDate) workedDay
from EmployeeSales e

----------------------Task 12-------------------------

select e.EmployeeName, e.SaleDate, DATEADD(DAY,e.SaleDate, 30) [30DayWorkDate]
from EmployeeSales e

----------------------Task 13-------------------------

select e.EmployeeName, DATENAME(WEEKDAY, e.SaleDate) [weekDay]
from EmployeeSales e

----------------------Task 14-------------------------

select e.EmployeeName, e.SaleDate, EOMONTH(e.SaleDate) monthEndDate
from EmployeeSales e

------------------------------------------------------
--------------------Section C-------------------------
------------------------------------------------------

---------------------Task 15--------------------------

select e.EmployeeName,e.Bonus,ISNULL(e.Bonus, 0) calculatedBonus
from EmployeeSales e

---------------------Task 16--------------------------

select e.EmployeeName,e.Commission,ISNULL(e.Commission, 0) calculatedCommission
from EmployeeSales e;

---------------------Task 17--------------------------
SELECT EmployeeName, ISNULL(e.Bonus, 0) AS Bonus,   
    ISNULL(e.Commission, 0) AS Commission,
    ISNULL(e.Bonus, 0) + ISNULL(e.Commission, 0) AS TotalIncentive
FROM EmployeeSales e;

---------------------Task 18--------------------------

select e.EmployeeName,e.Discount,ISNULL(TRY_CONVERT(varchar(50),e.Discount), 'Not Provided') discountStatus
from EmployeeSales e;

----------------------Task 19-------------------------

SELECT EmployeeName, ISNULL(e.Bonus, 0) AS Bonus,   
    ISNULL(e.Commission, 0) AS Commission,
    COALESCE(e.Bonus,e.Commission, 0) AS availableIncentive
FROM EmployeeSales e;

----------------------Task 20-------------------------

select e.EmployeeName, ROUND(ISNULL(e.SalesAmount/NULLIF(e.Quantity,0),0),2) UnitSalesAmount
from EmployeeSales e;

--------------------Bonus Challenge-------------------

SELECT
    EmployeeName,
    e.JoinDate,
    DATEDIFF(YEAR, e.JoinDate, GETDATE())
    - CASE
        WHEN DATEADD(
            YEAR,
            DATEDIFF(YEAR, e.JoinDate, GETDATE()),
            e.JoinDate
        ) > GETDATE()
        THEN 1
        ELSE 0
      END AS CompletedYearsOfService
FROM EmployeeSales e;

