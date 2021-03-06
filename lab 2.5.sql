USE sakila;

-- 1 Select all the actors with the first name ‘Scarlett’.
SELECT * 
FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2 How many films movies are available for rent and how many films have been rented?.
SELECT COUNT(rental_id)
FROM sakila.rental;
SELECT COUNT(distinct(inventory_id))
FROM sakila.rental;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT title, MAX(length) AS max_duration, min(length) AS min_duration
FROM sakila.film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?
SELECT floor(AVG(film.length)/60) as hours, floor(AVG(film.length)%60) as minutes 
FROM sakila.film ;

-- 5 How many distinct (different) actors' last names are there?
SELECT COUNT(distinct(last_name))
FROM sakila.actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)?
SELECT datediff(max(rental_date), min(rental_date))
FROM sakila.rental;

-- 7 Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date, '%M') AS 'rental_month', date_format(rental_date, '%W') AS 'rental_week'
FROM sakila.rental
LIMIT 20;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
-- SELECT *, date_format(rental_date, '%W') AS 'rental_week'
-- WHERE (date_format(rental_date, '%W') <> 'Saturday','Sunday') FROM sakila.rental;

SELECT *, date_format(rental_date, '%M') AS 'month', date_format(rental_date, '%W') AS 'day',
 CASE
 WHEN date_format(rental_date, '%W') = 'Monday' THEN 'Workday'
 WHEN date_format(rental_date, '%W') = 'Tuesday' THEN 'Workday'
 WHEN date_format(rental_date, '%W') = 'Wednesday' THEN 'Workday'
 WHEN date_format(rental_date, '%W') = 'Thursday' THEN 'Workday'
 WHEN date_format(rental_date, '%W') = 'Friday' THEN 'Workday'
ELSE 'Weekend'
 END AS 'day_type'
 FROM sakila.rental;

-- 9 Get release years.
SELECT release_year
FROM sakila.film;

-- 10 Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11 Get all films which title ends with APOLLO.
SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12 Get 10 the longest films.
SELECT *
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13 How many films include Behind the Scenes content?
SELECT *
FROM sakila.film
WHERE special_features LIKE 'Behind%';


