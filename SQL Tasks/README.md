# SQL Data Analytics Practice

A structured **SQL Server / T-SQL practice repository** covering SQL fundamentals, filtering, aggregation, data modification, joins, business analytics, advanced filtering, and CRUD operations.

The exercises are designed to progress from basic SQL syntax toward practical **Data Analyst / Business Analytics** queries.

---

## Repository Structure

```text
SQL/
│
├── 01_database_and_tables.sql
├── 02_where_like_between_top.sql
├── 03_aggregation_and_filtering.sql
├── 04_filtering_update_delete.sql
├── 05_join_customer_order_analysis.sql
├── 06_SQL_Business_Analytics_Tasks_01_30.sql
├── 07_SQL_Practical_Assignment_Customer_Sales.sql
├── 08_SQL_Level_3_Advanced_Filtering_Business_Analysis.sql
└── 09_SQL_Level_4_Aggregation_GroupBy_Having_CRUD.sql
```

---

# SQL Learning Progression

| # | File | Main Focus |
|---|---|---|
| 01 | `01_database_and_tables.sql` | Database and table creation |
| 02 | `02_where_like_between_top.sql` | Filtering and sorting |
| 03 | `03_aggregation_and_filtering.sql` | Aggregations and `HAVING` |
| 04 | `04_filtering_update_delete.sql` | Filtering, `UPDATE`, `DELETE` |
| 05 | `05_join_customer_order_analysis.sql` | SQL joins and customer/order analysis |
| 06 | `06_SQL_Business_Analytics_Tasks_01_30.sql` | Business analytics and advanced joins |
| 07 | `07_SQL_Practical_Assignment_Customer_Sales.sql` | Practical customer sales analysis |
| 08 | `08_SQL_Level_3_Advanced_Filtering_Business_Analysis.sql` | Advanced filtering and business conditions |
| 09 | `09_SQL_Level_4_Aggregation_GroupBy_Having_CRUD.sql` | Aggregation, `GROUP BY`, `HAVING`, and CRUD |

---

# 01 — Database and Tables

### File

```text
01_database_and_tables.sql
```

### Topics

- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- Data types
- Primary keys
- `INSERT`
- `SELECT`

### Practice

The first file establishes the basic SQL Server workflow:

```text
Create Database
      ↓
Switch Database
      ↓
Create Tables
      ↓
Insert Data
      ↓
Read Data
```

This forms the foundation for all later exercises.

---

# 02 — WHERE, LIKE, BETWEEN & TOP

### File

```text
02_where_like_between_top.sql
```

### Topics

- `SELECT`
- `WHERE`
- `LIKE`
- `BETWEEN`
- `TOP`
- `ORDER BY`
- Comparison operators
- `AND`
- `NOT`

### Examples of filtering

```sql
WHERE salary > 40000
```

```sql
WHERE age BETWEEN 25 AND 30
```

```sql
WHERE name LIKE 'S%'
```

```sql
SELECT TOP 3 *
FROM Employees
ORDER BY salary DESC;
```

This stage introduces **row-level filtering**.

---

# 03 — Aggregation and Filtering

### File

```text
03_aggregation_and_filtering.sql
```

### Topics

- `COUNT()`
- `MAX()`
- `MIN()`
- `SUM()`
- `AVG()`
- `COUNT(DISTINCT ...)`
- `GROUP BY`
- `HAVING`
- `IN`
- `BETWEEN`
- `LIKE`
- `ORDER BY`

### Important distinction

```text
WHERE
  ↓
Filters rows BEFORE grouping

GROUP BY
  ↓
Creates groups

HAVING
  ↓
Filters groups AFTER aggregation
```

Example:

```sql
SELECT
    course,
    AVG(marks) AS average_marks
FROM Students
GROUP BY course
HAVING AVG(marks) > 80;
```

---

# 04 — Filtering, UPDATE & DELETE

### File

```text
04_filtering_update_delete.sql
```

### Topics

- `SELECT`
- `WHERE`
- `LIKE`
- `BETWEEN`
- `ORDER BY`
- `UPDATE`
- `SET`
- `DELETE`

### Data modification

```sql
UPDATE Students
SET marks = 85
WHERE id = 3;
```

```sql
DELETE FROM Students
WHERE id = 5;
```

This introduces the basic **CRUD** concept:

```text
CREATE → INSERT
READ   → SELECT
UPDATE → UPDATE
DELETE → DELETE
```

---

# 05 — JOIN: Customer & Order Analysis

### File

```text
05_join_customer_order_analysis.sql
```

### Topics

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- `IS NULL`
- `COALESCE`
- Aggregations with joins
- Customer/order analysis

### Business analysis covered

- Customer order details
- Customers with orders
- Customers without orders
- Orders without matching customers
- Total customer spending
- Order counts
- Average order values
- Highest and lowest orders
- Customer purchase summaries
- Reconciliation between datasets

This stage moves from basic SQL syntax toward **relational data analysis**.

---

# 06 — Business Analytics: 30 Tasks

### File

```text
06_SQL_Business_Analytics_Tasks_01_30.sql
```

### Main focus

**Customer, product, order, and city-level business analysis.**

### Topics

- Aggregations
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- `CROSS JOIN`
- `COALESCE`
- Customer analysis
- Product analysis
- City analysis
- Revenue analysis
- Dataset reconciliation

### Business questions include

- Customer revenue performance
- Regional sales performance
- High-value customers
- Customer purchase concentration
- Product revenue performance
- High-volume products
- City revenue contribution
- Customer order value
- Customers with high order activity
- Products with zero sales
- Customer/order reconciliation
- Customer × product combinations
- Sales leaderboards
- Product business reviews
- Market performance
- Executive sales reports

This is the first major **business analytics SQL** exercise in the repository.

---

# 07 — Practical Assignment: Customer Sales

### File

```text
07_SQL_Practical_Assignment_Customer_Sales.sql
```

### Dataset

```text
customers
```

### Topics

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `AND`
- `OR`
- `NOT`

### Analysis progression

The assignment starts with basic data exploration:

```text
View complete dataset
        ↓
Select specific columns
        ↓
Filter customers
        ↓
Apply logical operators
        ↓
Sort results
        ↓
Build analyst-level segments
```

### Business analysis includes

- High-value customers
- Young customers
- Indian customers
- Low-spending customers
- High-spending young customers
- Indian high-value customers
- Selected-country analysis
- Excluding a country
- Spending-based sorting
- Target customer segmentation
- Premium campaign targeting

---

# 08 — Level 3: Advanced Filtering & Business Analysis

### File

```text
08_SQL_Level_3_Advanced_Filtering_Business_Analysis.sql
```

### Dataset

```text
sales_transactions
```

### Main topics

- `SELECT`
- `WHERE`
- `AND`
- `OR`
- `NOT`
- `BETWEEN`
- `ORDER BY`
- Complex logical conditions

### Dataset fields

```text
transaction_id
customer_name
product_name
category
quantity
unit_price
discount_percent
city
payment_mode
salesperson
customer_type
```

### Business analysis includes

- Complete transaction analysis
- High-value transactions
- Premium customer transactions
- Discount analysis
- City-level analysis
- Payment behaviour
- Category analysis
- Customer segment analysis
- Salesperson analysis
- High quantity vs high price
- International city analysis
- Premium electronics
- Furniture analysis
- Payment/customer-type combinations
- Discounted high-value sales
- Multiple business conditions
- Customer purchase priority
- Sales risk analysis
- Management sales report
- Final data analyst challenge

This level focuses on turning business rules into **precise SQL filtering logic**.

---

# 09 — Level 4: Aggregation, GROUP BY, HAVING & CRUD

### File

```text
09_SQL_Level_4_Aggregation_GroupBy_Having_CRUD.sql
```

### Main topics

- `SELECT`
- `INSERT`
- `UPDATE`
- `DELETE`
- `WHERE`
- `AND`
- `OR`
- `NOT`
- `IN`
- `BETWEEN`
- `LIKE`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `HAVING`
- `ORDER BY`

### Restrictions

This exercise deliberately does **not** use:

```text
JOIN
Subqueries
CTEs
Window Functions
```

The focus is on mastering **single-table aggregation and business analysis** before moving into more advanced SQL techniques.

### Sales value

For this dataset:

```sql
quantity * unit_price
```

is used as the transaction sales value.

### Business analysis includes

- Overall sales summary
- Category performance
- Salesperson performance
- City-wise sales
- Customer type analysis
- Payment mode analysis
- High-performing categories
- High-performing salespersons
- High-volume products
- Premium customer analysis
- VIP customer analysis
- City/payment analysis
- Discount performance
- Electronics analysis
- Furniture analysis
- Appliances analysis
- Premium vs VIP performance
- Salesperson discount analysis
- Insert and verify a transaction
- Final business intelligence report

### CRUD challenge

The final section demonstrates:

```text
CREATE
  ↓
INSERT transaction 1031

READ
  ↓
SELECT transaction 1031

UPDATE
  ↓
Change discount 10 → 12

DELETE
  ↓
Remove transaction 1031

VERIFY
  ↓
Confirm transaction no longer exists
```

---

# Current SQL Skill Coverage

At this point, the repository covers the following core SQL concepts:

## Database & Table Management

- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- Primary keys
- Data types
- `INSERT`

## Data Retrieval

- `SELECT`
- Selecting specific columns
- `SELECT *`

## Filtering

- `WHERE`
- `AND`
- `OR`
- `NOT`
- `IN`
- `BETWEEN`
- `LIKE`
- Comparison operators

## Sorting

- `ORDER BY`
- `ASC`
- `DESC`
- Multi-column sorting
- `TOP`

## Aggregation

- `COUNT`
- `COUNT(DISTINCT)`
- `SUM`
- `AVG`
- `MIN`
- `MAX`

## Grouping

- `GROUP BY`
- `HAVING`

## Data Modification

- `INSERT`
- `UPDATE`
- `DELETE`

## Joins

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- `CROSS JOIN`

## Additional SQL Techniques

- `IS NULL`
- `COALESCE`
- Conditional aggregation
- Dataset reconciliation
- Business-rule filtering

---

# Learning Progression

```text
01
Database & Tables
        ↓
02
WHERE / LIKE / BETWEEN / TOP
        ↓
03
Aggregations & GROUP BY
        ↓
04
UPDATE / DELETE
        ↓
05
JOINS
        ↓
06
Business Analytics
        ↓
07
Practical Customer Analysis
        ↓
08
Advanced Filtering
        ↓
09
Advanced Aggregation + CRUD
```

The repository is progressing from **SQL syntax → data manipulation → aggregation → relationships → business analysis**.

---

# SQL Analyst Mindset

For each business question, follow this process:

```text
1. What information is required?
          ↓
2. Which table contains it?
          ↓
3. Which columns are required?
          ↓
4. Do I need to filter rows?
          ↓
5. Do I need AND / OR / NOT / IN / BETWEEN / LIKE?
          ↓
6. Do I need aggregation?
          ↓
7. Do I need GROUP BY?
          ↓
8. Do I need HAVING?
          ↓
9. Do I need JOINs?
          ↓
10. Do I need to sort the result?
          ↓
11. Does the result answer the business question?
```

---

# Current Repository Goal

The objective is not only to memorize SQL syntax.

The exercises progressively develop the ability to translate a **business requirement into a SQL query**.

For example:

```text
"Find high-value customers"
        ↓
Identify spending column
        ↓
Define spending threshold
        ↓
Apply WHERE / HAVING
        ↓
Return required customer information
        ↓
Sort if required
```

This approach is intended to build practical SQL skills for **Data Analytics and Business Intelligence**.

---

## Files Completed So Far

```text
01_database_and_tables.sql
02_where_like_between_top.sql
03_aggregation_and_filtering.sql
04_filtering_update_delete.sql
05_join_customer_order_analysis.sql
06_SQL_Business_Analytics_Tasks_01_30.sql
07_SQL_Practical_Assignment_Customer_Sales.sql
08_SQL_Level_3_Advanced_Filtering_Business_Analysis.sql
09_SQL_Level_4_Aggregation_GroupBy_Having_CRUD.sql
```

---

## Status

**SQL Practice Progress: 01 → 09**

The repository currently progresses through:

**Fundamentals → Filtering → Aggregation → CRUD → Joins → Business Analytics → Advanced Filtering → Advanced Aggregation & CRUD**
