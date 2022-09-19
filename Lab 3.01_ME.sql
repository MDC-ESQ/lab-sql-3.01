-- Lab | SQL - Lab 3.01

-- Activity 1
		
        
		
            
		

USE sakila;

-- Drop column picture from staff.

ALTER TABLE sakila.staff
DROP COLUMN picture;

SELECT * FROM sakila.staff;


-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.


INSERT INTO sakila.staff (first_name, last_name, address_id, email, store_id, active, username)
SELECT first_name, last_name, address_id, email, store_id, active, first_name
FROM sakila.customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';

SELECT * FROM sakila.staff;


-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
			
            -- Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
        
			-- select customer_id from sakila.customer
			-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
            
            -- Use similar method to get inventory_id, film_id, and staff_id.
            
SELECT * FROM sakila.rental;
SELECT film_id FROM sakila.film
WHERE title = 'Academy Dinosaur';


-- 

INSERT INTO sakila.rental (rental_date,inventory_id, customer_id, return_date, staff_id)
SELECT CURDATE() AS 'rental_date',i.inventory_id, c.customer_id, CURDATE() + f.rental_duration AS 'return_date', s.staff_id
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN staff s ON s.store_id = s.store_id
INNER JOIN customer c ON c.store_id = s.store_id
WHERE title = 'Academy Dinosaur' AND c.first_name = 'CHARLOTTE' and c.last_name = 'HUNTER'
LIMIT 1; 

SELECT * FROM sakila.rental
ORDER BY rental_id DESC
LIMIT 1;


-- Activity 2

-- Use dbdiagram.io or draw.io to propose a new structure for the Sakila database. Define primary keys and foreign keys for the new database.


-- Added store_id to the rental table
-- Removed film_category and payment tables
-- Added foreign keys
-- Merged payment and rental tables
-- 
