USE sakila;
-- 1a display actor first name and last names
SELECT actor.first_name, actor.last_name
FROM actor;
-- 1b display all actors first and last name in one column titled 'actor name'
SELECT UPPER(CONCAT(actor.first_name, actor.last_name)) AS 'Actor Name'
FROM actor;
-- 2a show all actors with the first name 'Joe'
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE (((actor.first_name) Like "Joe"));
-- 2b show actors that have 'GEN' in their last name --
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE (((actor.last_name) Like "%GEN%"));
-- 2c show actors with the last name containing 'LI' and sort last name then first name --
SELECT actor.actor_id, actor.last_name, actor.first_name
FROM actor
WHERE (((actor.last_name) Like "%LI%"))
ORDER BY actor.last_name, actor.first_name;
-- 2d show three specific countries --
SELECT country.country_id, country.country
FROM country
WHERE (((country.country) In ("Afghanistan","Bangladesh","China")));
-- 3a add a column titled middle name -- 
ALTER TABLE actor ADD COLUMN middle_name VARCHAR(30) DEFAULT 'ALLEN' after first_name;
-- 3b change the middle name column data type to blob -- 
ALTER TABLE actor MODIFY middle_name BLOB;
-- 3c Drop middle name column -- 
ALTER TABLE actor DROP middle_name;
-- 4a List all actors last names and their count
SELECT actor.last_name, Count(actor.last_name) AS CountOflast_name
FROM actor
GROUP BY actor.last_name;
-- 4b List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT actor.last_name, Count(actor.last_name) AS CountOflast_name
FROM actor
GROUP BY actor.last_name
HAVING (((Count(actor.last_name))>1));
-- 4c Oh, no! The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as `GROUCHO WILLIAMS`, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
UPDATE actor
SET first_name = 'HARPO'
WHERE (((actor.first_name)="GROUCHO") AND ((actor.last_name)="WILLIAMS"));
-- 4d Perhaps we were too hasty in changing `GROUCHO` to `HARPO`. It turns out that `GROUCHO` was the correct name after all! In a single query, if the first name of the actor is currently `HARPO`, change it to `GROUCHO`. Otherwise, change the first name to `MUCHO GROUCHO`, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO `MUCHO GROUCHO`, HOWEVER! (Hint: update the record using a unique identifier.)
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE first_name = 'HARPO';

SET SQL_SAFE_UPDATES = 0;

UPDATE actor
SET first_name = (
	CASE
		WHEN actor.first_name = "GROUCHO" THEN "MUCHO GROUCHO"
		WHEN actor.first_name = "HARPO" AND actor.actor_id = "172" THEN "GROUCHO"
		ELSE actor.first_name
	END)
WHERE actor.first_name = "GROUCHO" OR actor.first_name = "HARPO";

SELECT * FROM actor;
-- for fixing the data from the above CASE mistakes
UPDATE actor SET first_name = "GROUCHO" WHERE actor.first_name = "MUCHO GROUCHO"; 
-- for fixing the data from the above CASE mistakes
UPDATE actor SET first_name = "GROUCHO" WHERE actor.first_name = "0"; 

-- 5a