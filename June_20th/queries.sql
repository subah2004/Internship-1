--Understanding queries 

CREATE DATABASE Employees;
USE Employees;

CREATE TABLE Employee(first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(25),department_id INT,salary INT,emp_id INT);
INSERT INTO Employee(first_name,last_name,email,department_id,salary,emp_id)VALUES
('John','Doe','john@example.com',1,2000,101),
('Alex','Doe','alex@example.com',2,4000,102),
('Bruce','Soe','bruce@example.com',3,5000,103),
('Johnson','Truce','johnson@example.com',4,3000,104);

INSERT INTO Employee(first_name,last_name,email,department_id,salary,emp_id)VALUES
('Harshad','Agrawal','harshadagr@example.com',2,9000,105),
('Atharva','Doe','atharva@example.com',1,4200,106),
('Ananya','Soe','ananya@example.com',4,5000,107),
('Anvita','V','anvita@example.com',3,3000,108);
SELECT * FROM Employee;

--Single Row Subquery returns only one row of results

--Find the employee with highest salary
SELECT first_name,last_name FROM Employee WHERE salary =(SELECT MAX(salary) FROM Employee);

--Multiple Row Sub query - returns mutiple rows.
--Used with IN ,ANY and ALL
SELECT first_name,last_name FROM Employee WHERE department_id IN (SELECT department_id FROM Employee WHERE emp_id =101);

--Correlated subquery that uses  values from outer query
--Find employees who earn more than the average salary in their department

SELECT first_name, last_name, salary FROM Employee e1 WHERE salary >(SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id =e2.department_id );

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'New York'),
(4, 'Sales', 'Chicago');

INSERT INTO employees (employee_id, employee_name, department_id, hire_date, salary) VALUES
(101, 'Alice', 1, '2023-01-15', 60000),
(102, 'Bob', 2, '2022-05-10', 80000),
(103, 'Charlie', 1, '2023-03-18', 65000),
(104, 'David', 3, '2023-02-20', 70000),
(105, 'Eve', 2, '2021-11-11', 75000),
(106, 'Frank', 4, '2023-06-25', 55000);

-- Join with subqueries

SELECT e.employee_id , e.employee_name, d.department_name FROM employees e
JOIN (SELECT department_id,department_name FROM departments WHERE location ="New York")d ON e.department_id = d.department_id;

--Join with Aggregate Functions
SELECT d.department_name, COUNT(e.employee_id) as employee_count
FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_name;

--Join with Date and Time Functions
SELECT e.employee_name , e.hire_date,d.department_name FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE YEAR(e.hire_date)=2023;

--RANK
SELECT employee_id, employee_name, salary, RANK() OVER(ORDER BY salary DESC) as salary_rank FROM employees;
--DENSE_RANK
SELECT employee_id , employee_name, salary,DENSE_RANK() OVER(ORDER BY salary DESC) as salary_dense_rank FROM employees;

--ROW number
SELECT employee_id, employee_name,salary, ROW_NUMBER() OVER(ORDER BY salary DESC) as row_num FROM employees;

--CUME_DIST
SELECT employee_id, employee_name,salary, CUME_DIST() OVER(ORDER BY salary DESC) as cume_dist FROM employees;

--LAG
--Retrieves the salary from the previous row ordered by hire data
SELECT employee_id, employee_name,salary, LAG(salary,1) OVER(ORDER BY hire_date) as prev_salary FROM employees;
