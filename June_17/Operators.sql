CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    active BOOLEAN,
    performance_score INT
);

INSERT INTO Employees (employee_id, first_name, last_name, department, salary, hire_date, active, performance_score)
VALUES
(1, 'John', 'Doe', 'Sales', 55000.00, '2015-03-01', TRUE, 85),
(2, 'Jane', 'Smith', 'Marketing', 62000.00, '2016-07-15', TRUE, 90),
(3, 'Emily', 'Jones', 'Sales', 58000.00, '2017-11-20', FALSE, 70),
(4, 'Michael', 'Brown', 'IT', 70000.00, '2018-06-30', TRUE, 95),
(5, 'Sarah', 'Davis', 'HR', 48000.00, '2019-01-25', TRUE, 88);


INSERT INTO Employees (employee_id, first_name, last_name, department, salary, hire_date, active, performance_score)
VALUES
(6, 'Mira', 'Admari', 'Sales', 55000.00, '2015-03-01', TRUE, 85),
(7, 'Suchita', 'Ambani', 'Marketing', 62000.00, '2016-07-15', TRUE, 90),
(8, 'Evelyn', 'Jones', 'Sales', 58000.00, '2017-11-20', FALSE, 70),
(9, 'Tanishka', 'Brown', 'IT', 70000.00, '2018-06-30', TRUE, 95),
(10, 'Tarrah', 'Davis', 'HR', 48000.00, '2019-01-25', TRUE, 88);

Select * from Employees;

--ARITHMETIC OPERATORS

--ADDITION
Select  first_name, last_name,salary as previous_salary, salary + 10000 as new_salary FROM Employees;

-- SUBTRACTION
SELECT first_name,last_name,salary as previous_salary, salary - 10000 as new_salary FROM Employees;

--MULTIPLICATION
SELECT first_name,last_name,salary as previous_salary, salary* 20 as increased_salary FROM Employees;

-- DIVISION
SELECT first_name,last_name,salary as previous_salary, salary / 12 as monthly_salary FROM Employees;

--MODULUS
SELECT employee_id, performance_score % 2 AS EVEN_OR_ODD FROM Employees;


--Comparison Operators

--Greater Than
SELECT * FROM Employees WHERE salary >59000;

--Equal to
SELECT * FROM Employees WHERE department = "IT";

--Not Equal
SELECT * FROM Employees WHERE department<> "Sales";

-- Less Than
SELECT * FROM Employees WHERE performance_score < 88;


--Logical Operators

--AND operators
SELECT * FROM Employees WHERE department = "Sales" AND active = TRUE;

--OR operator
SELECT * FROM Employees WHERE department = "Sales" OR department = "IT";

--NOT operators
SELECT * FROM Employees WHERE NOT active;