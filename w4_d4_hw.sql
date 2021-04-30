-- 1. List all customers who live in Texas (70000 postal codes ) 
65
SELECT customer.address_id, first_name,last_name,postal_code
From customer
Join address
ON customer.address_id=address.address_id
ORDER BY postal_code ASC;

-- Get all payments above $6.99 with the Customer's Full
-- Name

SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	Where amount > 6.99
)
ORDER BY customer_id ASC;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >= 175
	ORDER BY SUM(amount)	
);

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT *
FROM customer
FULL JOIN address
ON customer.address_id=address.address_id
FULL JOIN city
ON address.city_id=city.city_id
WHERE city.city='Nepal';

5. Which staff member had the most
transactions?
Jon Stephens

SELECT count(staff.staff_id),first_name,last_name
FROM staff
FULL JOIN payment 
ON staff.staff_id =payment.staff_id
GROUP BY staff.staff_id;

6. How many movies of each rating are
there?
SELECT rating,COUNT(rating )
FROM film
GROUP BY rating;

7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)

SELECT * 
FROM customer 
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING count(amount)=1
);


-- SELECT customer_id,count(amount)
-- FROM payment
-- WHERE amount > 6.99
-- GROUP BY customer_id
-- ORDER BY count(amount) ASC

-- 8 How many free rentals did our store give away
SELECT store.store_id,count(amount)
From store
Join inventory
ON store.store_id=inventory.store_id
Join rental
ON inventory.inventory_id=rental.inventory_id
Join payment 
ON rental.rental_id=payment.rental_id
GROUP BY store.store_id,amount
HAVING amount = 0





























