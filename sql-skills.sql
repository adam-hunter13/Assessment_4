-- Artist Table Quesiton 1
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)

INSERT INTO artist
(name)
VALUES
('Linkin Park'), ('Toto'), ('Journey');

-- Artist Table Question 2
-- Select 5 artists in alphabetical order.

SELECT name
FROM artist
ORDER BY name ASC
LIMIT 5;

-- Employee Table Question 1
-- List all employee first and last names only that live in Calgary.

SELECT * FROM employee
WHERE city = 'Calgary';

-- Employee Table Question 2
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards

SELECT * FROM employee
WHERE reports_to = 2;


-- Employee Table Question 3
-- Count how many people live in Lethbridge.

SELECT COUNT(city)
FROM employee
WHERE city IN ('Lethbridge');

-- Invoice Table Question 1
-- Count how many orders were made from the USA.

SELECT COUNT(billing_country)
FROM invoice
WHERE billing_country IN ('USA');


-- Invoice Table Question 2
-- Find the largest order total amount.

SELECT total FROM invoice
WHERE total = (SELECT MAX(total) FROM invoice);


-- Invoice Table Question 3
-- Find the smallest order total amount.

SELECT total FROM invoice
WHERE total = (SELECT MIN(total) FROM invoice);

-- Invoice Table Question 4
-- Find all orders bigger than $5.

SELECT * FROM invoice
WHERE total > 5;


-- Invoice Table Question 5
-- Count how many orders were smaller than $5.

SELECT * FROM invoice
WHERE total < 5;

-- Invoice Table Question 6
-- Get the total sum of the orders.

SELECT SUM(total) FROM invoice;

-- JOIN Queries Quesiton 1
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT invoice.invoice_id, invoice_line.unit_price
FROM invoice
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > 0.99;


-- JOIN Queries Quesiton 2
-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total
FROM invoice
JOIN customer ON invoice.customer_id = customer.customer_id;


-- JOIN Queries Quesiton 3
-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
FROM customer
JOIN employee ON customer.support_rep_id = employee.employee_id;


-- JOIN Queries Quesiton 4
-- Get the album title and the artist name from all albums.

SELECT album.title, artist.name
FROM album
JOIN artist ON album.artist_id = artist.artist_id;


-- EXTRA CREDIT