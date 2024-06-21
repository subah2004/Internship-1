USE Employees;

SELECT * FROM departments;
SELECT * FROM employees;
--PROCEDURE is a an sql code that you can save and reuse.

-- Example
    /* This is a stored procedure which accepts a department ID 
    as input andreturns the employess details along with some
    aggregate statistics such as the average salary and the 
    toal number of employees in that department
    */
DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT e.employee_id, e.employee_name,e.salary, d.department_name,
            (SELECT AVG(salary)
            FROM employees
            WHERE department_id = dept_id) AS avg_salary,
            (SELECT COUNT (employee_id) FROM employees
            WHERE department_id = dept_id) AS total_employees
    FROM employees e 
    JOIN departments d ON e.department_id = d.department_id
    WHERE e.department_id =dept_id;
END //

call GetEmployeesByDepartment(1);

--DROP PROCEDURE

DROP PROCEDURE  GetEmployeesByDepartment;

DELIMITER ;
--FUNCTIONS
    
    -- CALCULATE ANNUAL BONUS

DELIMITER $$

CREATE FUNCTION CalculateAnnualBonus(salary DECIMAL(10, 2)) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END $$

DELIMITER ;


    --Calculate years of service

DELIMITER $$

CREATE FUNCTION CalculateYearsOfService(hire_date DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE years INT;
    SET years = YEAR(CURDATE()) - YEAR(hire_date);
    IF MONTH(CURDATE()) < MONTH(hire_date) OR (MONTH(CURDATE()) = MONTH(hire_date) AND DAY(CURDATE()) < DAY(hire_date)) THEN
        SET years = years - 1;
    END IF;
    RETURN years;
END $$

DELIMITER ;

SELECT employee_id, employee_name, salary, 
       CalculateAnnualBonus(salary) AS annual_bonus,
       hire_date, 
       CalculateYearsOfService(hire_date) AS years_of_service
FROM employees;


--CURSOR

/* Procedue uses cursors to iterate over emploees and perform
some operations. Below , I have created a procedure that iterates
through all employees and calculates their annual bonus
using cursor*/

DELIMITER $$

CREATE PROCEDURE CalculateBonuses()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(50);
    DECLARE emp_salary DECIMAL(10, 2);
    DECLARE emp_bonus DECIMAL(10, 2);
    
    -- Declare the cursor
    DECLARE emp_cursor CURSOR FOR
    SELECT employee_id, employee_name, salary FROM employees;
    
    -- Declare the handler for the end of the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor
    OPEN emp_cursor;
    
    -- Loop through all rows in the cursor
    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_name, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET emp_bonus = emp_salary * 0.10;
        
    
        SELECT emp_id, emp_name, emp_salary, emp_bonus;
    END LOOP;
    
    CLOSE emp_cursor;
END $$

DELIMITER ;

CALL CalculateBonuses();

