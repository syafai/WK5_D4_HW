-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT first_name, last_name, address, district
FROM address
INNER JOIN customer 
ON address.address_id = customer.address_id
WHERE district = 'Texas';
--ANSWER: 5

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount, payment
FROM payment
INNER JOIN customer 
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99 ;
--ANSWER: 1406

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175.00
ORDER BY SUM(amount) DESC;
--ANSWER: 6

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, city.last_update, country, city, address.city_id, city.country_id, address
FROM country 
INNER JOIN city 
ON country.country_id = city.country_id
INNER JOIN address
ON address.city_id = city.city_id
INNER JOIN customer
on customer.address_id = address.address_id
WHERE country = 'Nepal';
--ANSWER: 1 PERSON NAMED KEVIN SCHULER

-- 5. Which staff member had the most
-- transactions?
SELECT staff.first_name, staff.last_name, payment.staff_id, COUNT(amount)
FROM staff
INNER JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name, payment.staff_id
ORDER BY COUNT(amount);
--ANSWER: "Jon"	"Stephens"	7304 TRANSACTIONS

-- 6. How many movies of each rating are
-- there?
SELECT COUNT(rating), rating
FROM film
GROUP BY rating;
-- ANSWER: 223	"PG-13"
-- 210	"NC-17"
-- 195	"R"
-- 178	"G"
-- 194	"PG"

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE amount > 6.99
  GROUP BY customer_id
  HAVING COUNT(*) = 1
);
--ANSWER: 130 CUSTOMERS

--8. How many free rentals did our stores give away?
SELECT amount
FROM payment
WHERE amount = 0.00;
--ANSWER: 24

