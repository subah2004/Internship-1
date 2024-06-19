CREATE DATABASE Emp;
USE Emp;

-- Create the country table
CREATE TABLE country (
    city_id INT PRIMARY KEY,
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Create the address table
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    address VARCHAR(255),
    city_id INT,
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    FOREIGN KEY (city_id) REFERENCES country(city_id)
);

-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Create the payment table
CREATE TABLE payment (
    customer_id INT,
    amount DECIMAL(10, 2),
    mode VARCHAR(50),
    Payment_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Insert data into country table
INSERT INTO country (city_id, city, country) VALUES
(1, 'New York', 'USA'),
(2, 'Los Angeles', 'USA'),
(3, 'London', 'UK');

-- Insert data into address table
INSERT INTO address (address_id, address, city_id, postal_code, phone) VALUES
(1, '123 Main St', 1, '10001', '123-456-7890'),
(2, '456 Elm St', 2, '90001', '234-567-8901'),
(3, '789 Oak St', 3, 'EC1A 1BB', '345-678-9012');

-- Insert data into customer table
INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Alice', 'Johnson', 3);

-- Insert data into payment table
INSERT INTO payment (customer_id, amount, mode, Payment_date) VALUES
(1, 100.50, 'Credit Card', '2023-01-15'),
(2, 200.75, 'Debit Card', '2023-02-20'),
(3, 150.00, 'Cash', '2023-03-25');

SELECT* FROM country;
SELECT* FROM customer;

SELECT* FROM payment;
SELECT* FROM address;

--INNER JOIN
SELECT * FROM customer INNER JOIN payment as p ON customer.customer_id = p.customer_id;

--OUTER JOIN
SELECT * FROM customer LEFT JOIN payment as p ON customer.customer_id = p.customer_id;

--RIGHT JOIN
SELECT * FROM customer RIGHT JOIN payment as p ON customer.customer_id = p.customer_id;
--FULL OUTER JOIN
SELECT * FROM customer FULL OUTER JOIN payment as p ON customer.customer_id = p.customer_id;


USE Library;

select * from books;
select* from authors;



--INNER JOIN
select * from books b INNER JOIN authors a ON a.author_id = b.author_id;

--LEFT OUTER JOIN
select * from authors a LEFT JOIN books b ON b.author_id = a.author_id;

--RIGHT OUTER JOIN
select * from authors a LEFT JOIN books b ON b.author_id = a.author_id;

-- FULL OUTER JOIN

select * from authors a FULL OUTER JOIN books b ON b.author_id = a.author_id;

