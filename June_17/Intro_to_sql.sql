CREATE DATABASE MOVIE_RENTAL;

USE MOVIE_RENTAL;

CREATE TABLE Customers(customer_id INT PRIMARY KEY,first_name VARCHAR(45),last_name VARCHAR(45),email VARCHAR(100),date_of_birth DATE,membership_date DATE);
CREATE TABLE Movies(movie_id INT PRIMARY KEY,title VARCHAR(100),genre VARCHAR(50),release_year INT,rating VARCHAR(10) )

CREATE TABLE Rental(rental_id INT PRIMARY KEY,customer_id int ,movie_id INT,rental_date DATE,return_date DATE,FOREIGN KEY(customer_id) REFERENCES Customers(customer_id) ,FOREIGN KEY(movie_id) REFERENCES Movies(movie_id) );

CREATE TABLE Staff (staff_id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(100),position VARCHAR(50));

/*INSERT VALUES*/
INSERT INTO Customers (customer_id, first_name, last_name, email, date_of_birth, membership_date) VALUES (1, 'Alice', 'Wonderland', 'alice.@example.com', '2004-05-12', '2023-01-01');

INSERT INTO Customers (customer_id, first_name, last_name, email, date_of_birth, membership_date) VALUES (2, 'Alina', 'Thomas', 'alina.@example.com', '2000-05-09', '2024-01-01');

INSERT INTO Movies (movie_id, title, genre, release_year, rating) VALUES (1, 'Chennai Express', 'Comedy Romance', 2013 , 'R');

INSERT INTO Movies (movie_id, title, genre, release_year, rating) VALUES (2, 'DUNKI', 'Comedy Adventure', 2023 , 'R');

CREATE TABLE Inventory (inventory_id INT PRIMARY KEY,movie_id INT,store_id INT,available BOOLEAN,FOREIGN KEY (movie_id) REFERENCES Movies(movie_id));

INSERT INTO Inventory (inventory_id, movie_id, store_id, available) VALUES (1, 1, 101, TRUE);

/*Show tables*/

SELECT * FROM Customers;

SELECT * FROM Movies;

SELECT * FROM Rental;

/*Drop Table*/

drop table Staff;

/*Truncate table*/
TRUNCATE TABLE Inventory;

ALTER TABLE Movies
MODIFY COLUMN title VARCHAR(50);

ALTER TABLE Movies
MODIFY COLUMN Duration INT;


UPDATE Movies
SET Duration = 136
WHERE movie_id = 1;


UPDATE Movies
SET Duration = 120
WHERE movie_id = 2;