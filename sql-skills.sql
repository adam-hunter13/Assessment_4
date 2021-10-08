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
-- Artist Table Question 1
-- Select 10 artists in reverse alphabetical order.

SELECT name
FROM artist
ORDER BY name DESC
LIMIT 10;


-- Artist Table Question 2
-- Select all artists that start with the word ‘Black’.

SELECT * FROM artist
WHERE name LIKE 'Black%';


-- Artist Table Question 3
-- Select all artists that contain the word ‘Black’.

SELECT * FROM artist
WHERE name LIKE '%black%';

-- Employee Table Question 1
-- Find the birthdate for the youngest employee.

SELECT last_name, first_name, birth_date FROM employee
WHERE birth_date = (SELECT MAX(birth_date) FROM employee);

-- Employee Table Question 2
-- Find the birthdate for the oldest employee.

SELECT last_name, first_name, birth_date FROM employee
WHERE birth_date = (SELECT MIN(birth_date) FROM employee);

-- Invoice Table Question 1
-- Count how many orders were in CA, TX, or AZ (use IN).

SELECT COUNT(billing_state)
FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ');

-- Invoice Table Question 2
-- Get the average total of the orders.

SELECT AVG(total) FROM invoice

-- More Join Queries Qestion 1
-- Get all playlist_track track_ids where the playlist name is Music.

SELECT playlist_track.track_id
FROM playlist_track
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music';

-- More Join Queries Qestion 2
-- Get all track names for playlist_id 5.

SELECT *
FROM track
WHERE track_id IN ( 
  SELECT track_id
  FROM playlist_track
  WHERE playlist_id = '5' 
);

-- More Join Queries Qestion 3
-- Get all track names and the playlist name that they’re on ( 2 joins ).

SELECT track.name, playlist.name
FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id;

-- More Join Queries Qestion 4
-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).

SELECT track.name, album.title
FROM track
JOIN album ON track.album_id =  album.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Alternative & Punk';
