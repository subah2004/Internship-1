USE  MOVIE_RENTAL;

DROP TABLE Rental;

--Group BY

--Find the number of rentals for each customer.
SELECT customer_id, SUM(cost) AS total_rental_cost FROM Rental GROUP BY customer_id;

--Find the number of rentals for each customer and order the results by the number of rentals in descending order.
--Order By
SELECT customer_id, COUNT(rental_id) AS rental_count FROM Rental GROUP BY customer_id

CREATE TABLE Orders (order_id INT PRIMARY KEY,customer_id INT, order_date DATE,total_amount DECIMAL(10, 2));

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) 
VALUES 
(1, 1, '2023-06-01', 120.50),
(2, 1, '2023-06-05', 75.20),
(3, 2, '2023-06-02', 210.00),
(4, 3, '2023-06-03', 150.75),
(5, 2, '2023-06-08', 180.90);

--Q1. Find the total amount spent by each customer.
SELECT customer_id, SUM(total_amount) as Total_spending FROM Orders GROUP BY customer_id;

--Q2. List customers ordered by the total amount spent, in descending order.
SELECT customer_id, SUM(total_amount) as Total_spending FROM Orders GROUP BY customer_id ORDER BY Total_spending DESC;

--Q3. Find customers who have spent more than $200 in total.
SELECT customer_id, SUM(total_amount) as Total_spending FROM Orders GROUP BY customer_id HAVING Total_spending > 200;

--Q4 Find customers who have placed more than 1 order, and list them ordered by the total amount spent, in descending order.
SELECT customer_id, COUNT(order_id) as total_orders,SUM(total_amount) as total_spending FROM Orders GROUP BY customer_id HAVING total_orders >1 ORDER BY total_orders DESC;



INSERT INTO Movies (movie_id, title, genre, release_year, rating) VALUES 
    (3, 'The Shawshank Redemption', 'Drama', 1994, 'R'),
    (4, 'Inception', 'Science Fiction', 2010, 'PG-13'),
    (5, 'Pulp Fiction', 'Crime Drama', 1994, 'R'),
    (6, 'The Dark Knight', 'Action Crime Drama', 2008, 'PG-13');

INSERT INTO Movies (movie_id, title, genre, release_year, rating) VALUES 
    (7, 'The Shawshank Redemption', 'Drama', 1994, 'R'),
    (8, 'ABC', 'Science Fiction', 2010, 'PG-13'),
    (9, 'ayz Fiction', 'Crime Drama', 1994, 'R'),
    (10, 'The Dark fACTOR', 'Action Crime Drama', 2008, 'PG-13');

-- A) SELECT With DISTINCT Clause

SELECT DISTINCT rating FROM Movies; 

SELECT DISTINCT genre FROM Movies;

-- B) SELECT all columns(*)
SELECT * FROM Movies;

--C) SELECT by column name
SELECT release_year FROM Movies;

-- D) SELECT with LIKE(%)
SELECT * FROM Movies WHERE genre LIKE "%Co%"; 

--E) SELECT with CASE or IF

SELECT order_id,total_amount, CASE WHEN total_amount >= 120 THEN "PASS" ELSE "FAIL" END AS "Result" FROM Orders;

SELECT order_id,
total_amount,
IF(total_amount>=120 ,'PASS' ,'FAIL') AS "Result" FROM Orders;

-- F) SELECT with a LIMIT Clause
SELECT * FROM Customers ORDER BY customer_id LIMIT 2;