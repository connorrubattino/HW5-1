--1. How many actors are there with the last name ‘Wahlberg’?
SELECT count(*)
FROM actor a 
WHERE last_name = 'Wahlberg';
--	Answer = 2


--2. How many payments were made between $3.99 and $5.99?
SELECT count(*)
FROM payment p 
WHERE amount BETWEEN 3.99 AND 4.99;
--	Answer = 4,412

--3. What films have exactly 7 copies? (search in inventory)
SELECT film_id 
FROM inventory
GROUP BY film_id
HAVING count(inventory_id) = 7;
--	Answer = see table

--4. How many customers have the first name ‘Willie’?
SELECT COUNT(*)
FROM customer c 
WHERE c.first_name ='Willie';
--	Answer = 2

--5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, count(*)
FROM rental r 
GROUP BY staff_id 
ORDER BY staff_id ASC 
LIMIT 1;
--	Answer = id 1 with 8,040 rentals

--6. How many unique district names are there?
SELECT count(DISTINCT district)
FROM address
--	Answer =378

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(DISTINCT actor_id)
FROM film_actor fa 
GROUP BY film_id 
ORDER BY count(DISTINCT actor_id) DESC 
LIMIT 1
--	Answer = id 508 with 15 actors

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*)
FROM customer c 
WHERE store_id = 1 AND last_name LIKE '%es'
--	Answer =13

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT amount
FROM payment p 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING count(*) > 250 
--	Answer = 3 payment amounts

SELECT DISTINCT amount FROM payment p 

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT rating, count(rating)
FROM film
GROUP BY rating
ORDER BY rating DESC 
--	Answer = 5 rating categories and NC-17 has the most with 210