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

-- 5a You cannot locate the schema of the `address` table. Which query would you use to re-create it?
DESCRIBE address;
--  6a. Use `JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address`:
SELECT staff.first_name, staff.last_name, address.address
FROM staff INNER JOIN address ON (staff.address_id = address.address_id);
-- 6b. Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`. 
SELECT staff.first_name, staff.last_name, Sum(payment.amount) AS total_amount_rung_up
FROM staff INNER JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name;
-- 6c. List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join.
SELECT film.title, Count(film_actor.actor_id) AS CountOfactor_id
FROM film INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title;
-- 6d. How many copies of the film `Hunchback Impossible` exist in the inventory system?
SELECT film.title, Count(inventory.inventory_id) AS total_copies
FROM inventory INNER JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
HAVING (((film.title)="Hunchback Impossible"));
-- 6e. Using the tables `payment` and `customer` and the `JOIN` command, list the total paid by each customer. List the customers alphabetically by last name:
SELECT customer.last_name, Sum(payment.amount) AS total_paid
FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.last_name
ORDER BY customer.last_name;
-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters `K` and `Q` have also soared in popularity. Use subqueries to display the titles of movies starting with the letters `K` and `Q` whose language is English. 
SELECT title 
FROM film
WHERE ((film.title Like "K%") OR (film.title Like "Q%")) AND film.language_id IN (
SELECT language.language_id
FROM language
WHERE (((language.name)="English"))
);
-- 7b. Use subqueries to display all actors who appear in the film `Alone Trip`.
SELECT first_name, last_name FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor
    WHERE film_id IN (
		SELECT film_id FROM film
        WHERE title = "Alone Trip"
	)
);
-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
SELECT customer.first_name, customer.last_name, customer.email
FROM customer INNER JOIN customer_list ON customer.customer_id = customer_list.ID
WHERE customer_list.country = "CANADA";
-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
SELECT film.title
FROM (film INNER JOIN film_category ON film.film_id = film_category.film_id) INNER JOIN category ON film_category.category_id = category.category_id
WHERE (((category.name)="Family"));
-- 7e. Display the most frequently rented movies in descending order.
SELECT film.title, Count(rental.rental_id) AS times_rented
FROM film INNER JOIN (rental INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id) ON film.film_id = inventory.film_id
GROUP BY film.title
ORDER BY Count(rental.rental_id) DESC;
-- 7f. Write a query to display how much business, in dollars, each store brought in.
SELECT sales_by_store.store, Sum(sales_by_store.total_sales) AS total_sales
FROM sales_by_store
GROUP BY sales_by_store.store;
-- 7g. Write a query to display for each store its store ID, city, and country.
SELECT store.store_id, city.city, country.country
FROM (store INNER JOIN address ON store.address_id = address.address_id) INNER JOIN (country INNER JOIN city ON country.country_id = city.country_id) ON address.city_id = city.city_id;
-- 7h. List the top five genres in gross revenue in descending order.
SELECT category.name, Sum(payment.amount) AS gross_revenue
FROM (inventory INNER JOIN (payment INNER JOIN rental ON payment.rental_id = rental.rental_id) ON inventory.inventory_id = rental.inventory_id) INNER JOIN (film_category INNER JOIN category ON film_category.category_id = category.category_id) ON inventory.film_id = film_category.film_id
GROUP BY category.name
ORDER BY Sum(payment.amount) DESC
LIMIT 5;
-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
CREATE VIEW top_five_genres AS
SELECT category.name, Sum(payment.amount) AS gross_revenue
FROM (inventory INNER JOIN (payment INNER JOIN rental ON payment.rental_id = rental.rental_id) ON inventory.inventory_id = rental.inventory_id) INNER JOIN (film_category INNER JOIN category ON film_category.category_id = category.category_id) ON inventory.film_id = film_category.film_id
GROUP BY category.name
ORDER BY Sum(payment.amount) DESC
LIMIT 5;
-- 8b. How would you display the view that you created in 8a?
Select * from top_five_genres;
-- 8c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.
drop view top_five_genres;