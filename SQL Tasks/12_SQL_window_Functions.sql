CREATE TABLE EmployeeSales (
    employee_id INT primary key,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    sales DECIMAL(12,2),
    sale_date DATE
);
GO
INSERT INTO EmployeeSales
(employee_id, employee_name, department, city, salary, sales, sale_date)
VALUES
(101, 'Amit',   'IT',      'Ahmedabad', 60000, 120000, '2026-01-10'),
(102, 'Priya',  'IT',      'Ahmedabad', 70000, 150000, '2026-01-15'),
(103, 'Rahul',  'IT',      'Mumbai',    65000, 150000, '2026-02-10'),
(104, 'Neha',   'HR',      'Delhi',     55000, 90000,  '2026-01-20'),
(105, 'Karan',  'HR',      'Mumbai',    58000, 110000, '2026-02-05'),
(106, 'Sneha',  'Finance', 'Delhi',     75000, 180000, '2026-01-25'),
(107, 'Vikas',  'Finance', 'Mumbai',    80000, 200000, '2026-02-15'),
(108, 'Riya',   'Finance', 'Delhi',     72000, 180000, '2026-03-01'),
(109, 'Arjun',  'IT',      'Pune',      62000, 130000, '2026-03-10'),
(110, 'Pooja',  'HR',      'Delhi',     56000, 110000, '2026-03-15');

-----------------------------------------------------------------
--------------------------Task 1---------------------------------
-----------------------------------------------------------------

select employee_name, department,salary, rank() over (order by salary desc) as rnk
from EmployeeSales;

-----------------------------------------------------------------
--------------------------Task 2---------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, dense_rank() over (order by salary desc) as Drnk
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task 3----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, row_number() over (order by salary desc) as Rnum
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task 4----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, rank() over (partition by department order by salary desc) as rnk
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task -5---------------------------------
-----------------------------------------------------------------
select employee_name, department, salary
from (select employee_name, department,salary, dense_rank() over (partition by department order by salary desc) as Drnk
from EmployeeSales) AS RANKEDeMPLOYEES
where Drnk < 4
order by department asc, salary desc;

-----------------------------------------------------------------
-------------------------Task 6----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, round(avg(salary) over (partition by department),2) as avgDepSalary
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task 7----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, round(salary - avg(salary) over (partition by department),2) as DiffEmpSalaryDep
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task 8----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, sum(salary) over (partition by department) as DepTotalSalary
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task 9----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, round(salary/sum(salary) over (partition by department)*100,2) as DepPercentPerEmployee
from EmployeeSales;

-----------------------------------------------------------------
-------------------------Task 10----------------------------------
-----------------------------------------------------------------
select employee_name, department,salary, Count(*) over (partition by department) as TotalEmployee
from EmployeeSales;

--------------------------------------------------------------------

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);
GO
INSERT INTO Employee
(emp_id, emp_name, department, city, salary, joining_date)
VALUES
(101, 'Aarav Sharma', 'IT', 'Ahmedabad', 72000, '2021-01-15'),
(102, 'Priya Patel', 'IT', 'Mumbai', 85000, '2020-06-10'),
(103, 'Rahul Mehta', 'IT', 'Ahmedabad', 78000, '2022-03-20'),
(104, 'Neha Shah', 'HR', 'Pune', 65000, '2021-08-12'),
(105, 'Vikram Singh', 'HR', 'Delhi', 72000, '2019-04-18'),
(106, 'Ananya Desai', 'HR', 'Mumbai', 68000, '2022-01-25'),
(107, 'Rohan Gupta', 'Sales', 'Delhi', 55000, '2023-02-14'),
(108, 'Sneha Joshi', 'Sales', 'Ahmedabad', 62000, '2021-11-05'),
(109, 'Karan Shah', 'Sales', 'Mumbai', 58000, '2022-07-19'),
(110, 'Meera Patel', 'Finance', 'Pune', 82000, '2020-09-21'),
(111, 'Arjun Mehta', 'Finance', 'Delhi', 90000, '2018-05-16'),
(112, 'Kavya Shah', 'Finance', 'Ahmedabad', 85000, '2021-12-01'),
(113, 'Dev Kumar', 'IT', 'Bangalore', 78000, '2023-06-11'),
(114, 'Isha Patel', 'IT', 'Mumbai', 92000, '2019-10-28'),
(115, 'Manav Joshi', 'Sales', 'Pune', 61000, '2020-02-17'),
(116, 'Pooja Mehta', 'HR', 'Ahmedabad', 75000, '2018-11-30'),
(117, 'Aditya Shah', 'Finance', 'Mumbai', 88000, '2022-04-09'),
(118, 'Nisha Gupta', 'Sales', 'Delhi', 59000, '2023-09-13'),
(119, 'Harsh Patel', 'IT', 'Pune', 88000, '2021-03-22'),
(120, 'Riya Singh', 'Finance', 'Ahmedabad', 76000, '2023-01-18');
GO

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    sale_date DATE,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(12,2),

    FOREIGN KEY (employee_id)
    REFERENCES Employee(emp_id)
);
Go
INSERT INTO Sales
(sale_id, employee_id, sale_date, product, category, quantity, amount)
VALUES
(1,101,'2025-01-03','Laptop','Electronics',2,140000),
(2,102,'2025-01-04','Monitor','Electronics',3,75000),
(3,103,'2025-01-05','Keyboard','Accessories',5,25000),
(4,107,'2025-01-06','Laptop','Electronics',1,70000),
(5,108,'2025-01-07','Mouse','Accessories',10,15000),
(6,110,'2025-01-08','Printer','Electronics',2,50000),
(7,111,'2025-01-09','Laptop','Electronics',2,145000),
(8,102,'2025-01-10','Keyboard','Accessories',8,40000),
(9,109,'2025-01-11','Monitor','Electronics',2,52000),
(10,112,'2025-01-12','Printer','Electronics',3,72000),
(11,101,'2025-01-13','Mouse','Accessories',15,22500),
(12,103,'2025-01-14','Laptop','Electronics',1,72000),
(13,114,'2025-01-15','Monitor','Electronics',4,108000),
(14,115,'2025-01-16','Keyboard','Accessories',12,60000),
(15,108,'2025-01-17','Laptop','Electronics',2,150000),
(16,116,'2025-01-18','Printer','Electronics',1,26000),
(17,117,'2025-01-19','Monitor','Electronics',3,81000),
(18,118,'2025-01-20','Mouse','Accessories',20,30000),
(19,119,'2025-01-21','Laptop','Electronics',3,225000),
(20,120,'2025-01-22','Keyboard','Accessories',10,50000),
(21,101,'2025-01-23','Monitor','Electronics',2,54000),
(22,102,'2025-01-24','Laptop','Electronics',1,76000),
(23,103,'2025-01-25','Mouse','Accessories',12,18000),
(24,107,'2025-01-26','Printer','Electronics',2,52000),
(25,108,'2025-01-27','Monitor','Electronics',2,50000),
(26,110,'2025-01-28','Laptop','Electronics',1,73000),
(27,111,'2025-01-29','Keyboard','Accessories',15,75000),
(28,112,'2025-01-30','Mouse','Accessories',25,37500),
(29,114,'2025-02-01','Laptop','Electronics',2,155000),
(30,115,'2025-02-02','Monitor','Electronics',3,78000),
(31,116,'2025-02-03','Keyboard','Accessories',10,50000),
(32,117,'2025-02-04','Laptop','Electronics',1,74000),
(33,118,'2025-02-05','Printer','Electronics',2,51000),
(34,119,'2025-02-06','Monitor','Electronics',4,104000),
(35,120,'2025-02-07','Mouse','Accessories',18,27000),
(36,101,'2025-02-08','Laptop','Electronics',2,148000),
(37,102,'2025-02-09','Printer','Electronics',1,25000),
(38,103,'2025-02-10','Monitor','Electronics',3,79000),
(39,107,'2025-02-11','Mouse','Accessories',20,30000),
(40,108,'2025-02-12','Keyboard','Accessories',14,70000),
(41,109,'2025-02-13','Laptop','Electronics',2,152000),
(42,110,'2025-02-14','Monitor','Electronics',2,53000),
(43,111,'2025-02-15','Printer','Electronics',3,78000),
(44,112,'2025-02-16','Laptop','Electronics',2,146000),
(45,114,'2025-02-17','Keyboard','Accessories',10,50000),
(46,115,'2025-02-18','Mouse','Accessories',15,22500),
(47,116,'2025-02-19','Laptop','Electronics',1,71000),
(48,117,'2025-02-20','Monitor','Electronics',3,81000),
(49,118,'2025-02-21','Keyboard','Accessories',12,60000),
(50,119,'2025-02-22','Laptop','Electronics',2,149000),
(51,120,'2025-02-23','Printer','Electronics',2,50000),
(52,101,'2025-02-24','Mouse','Accessories',22,33000),
(53,102,'2025-02-25','Monitor','Electronics',2,51000),
(54,103,'2025-02-26','Laptop','Electronics',1,75000),
(55,107,'2025-02-27','Keyboard','Accessories',16,80000),
(56,108,'2025-02-28','Printer','Electronics',2,49000),
(57,109,'2025-03-01','Mouse','Accessories',25,37500),
(58,110,'2025-03-02','Laptop','Electronics',2,150000),
(59,111,'2025-03-03','Monitor','Electronics',4,106000),
(60,112,'2025-03-04','Keyboard','Accessories',18,90000);


-----------------------------------------------------------------
-------------------------Task 11----------------------------------
-----------------------------------------------------------------
select *,SUM(amount) OVER(ORDER BY sale_date rows between unbounded preceding and current row) runningTotal
from Sales;

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
-------------------------Task 12----------------------------------
-----------------------------------------------------------------