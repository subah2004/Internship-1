

-- Create the convenience store database
CREATE DATABASE ConvenienceStore;

-- Use the database
USE ConvenienceStore;

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT
);

-- Create the Sales table
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create the AuditLog table
CREATE TABLE AuditLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    event VARCHAR(50),
    description VARCHAR(255),
    event_date DATETIME
);

--TCL stands for Transaction control language which used to
--manage transactions in database. They are used to commit or roolback transactions



BEGIN TRANSACTION;

INSERT INTO Products (product_id, product_name, price, stock) VALUES (1, 'Soda', 1.50, 100);

-- Update the stock after a sale
UPDATE Products SET stock = stock - 1 WHERE product_id = 1;

-- If everything is fine, commit the transaction
COMMIT;

-- if there is an issue then roll back the transaction
-- ROLLBACK;

-- Create a trigger for after insert on the Sales table
DELIMITER //
CREATE TRIGGER trg_after_insert_sale
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (event, description, event_date)
    VALUES ('INSERT', CONCAT('Sale made for product ID: ', NEW.product_id, ', Quantity: ', NEW.quantity), NOW());
END;
//
DELIMITER ;

-- Create a view for sales details with product names
CREATE VIEW SalesDetails AS
SELECT 
    s.sale_id,
    p.product_name,
    s.quantity,
    s.sale_date
FROM 
    Sales s
JOIN 
    Products p ON s.product_id = p.product_id;


--Testing the trigger

INSERT INTO Sales (product_id, quantity, sale_date) VALUES (1, 2, NOW());

-- Check the AuditLog to see if the trigger worked
SELECT * FROM AuditLog;

-- Use the view to see the sales details
SELECT * FROM SalesDetails;



CREATE DATABASE Bookstore;


USE Bookstore;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT
);


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    quantity INT,
    order_date DATETIME,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


CREATE TABLE OrderLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    event VARCHAR(50),
    description VARCHAR(255),
    event_date DATETIME
);


BEGIN TRANSACTION;


INSERT INTO Books (book_id, title, author, price, stock) VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 10.99, 50);

-- Update the stock after an order
UPDATE Books SET stock = stock - 1 WHERE book_id = 1;

COMMIT;

-- If there is any issue then use Rollback
-- ROLLBACK;

-- Create a trigger for after insert on the Orders table
DELIMITER //
CREATE TRIGGER trg_after_insert_order
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO OrderLog (event, description, event_date)
    VALUES ('INSERT', CONCAT('Order placed for book ID: ', NEW.book_id, ', Quantity: ', NEW.quantity), NOW());
END;
//
DELIMITER ;

-- Create a view for order details with book titles
CREATE VIEW OrderDetails AS
SELECT 
    o.order_id,
    b.title,
    o.quantity,
    o.order_date
FROM 
    Orders o
JOIN 
    Books b ON o.book_id = b.book_id;

-- Insert an order
INSERT INTO Orders (book_id, quantity, order_date) VALUES (1, 2, NOW());

-- Checking if trigger works or not.
SELECT * FROM OrderLog;

-- Use the view to see the order details
SELECT * FROM OrderDetails;
