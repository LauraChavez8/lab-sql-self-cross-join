USE sakila;

SELECT DISTINCT a1.actor_id, a2.actor_id, a1.film_id
FROM sakila.film_actor a1
JOIN sakila.film_actor a2 
WHERE a1.actor_id <> a2.actor_id
ORDER BY a1.film_id;

CREATE TEMPORARY TABLE rentclient1
SELECT r.customer_id, r.inventory_id, film_id
FROM sakila.rental r
JOIN sakila.inventory i ON r.inventory_id = i.inventory_id;

CREATE TEMPORARY TABLE rentclient2
SELECT r.customer_id, r.inventory_id, film_id
FROM sakila.rental r
JOIN sakila.inventory i ON r.inventory_id = i.inventory_id;

SELECT r1.customer_id, r2.customer_id, COUNT(*) FROM rentclient1 r1
JOIN rentclient2 r2 ON r1.film_id = r2.film_id
WHERE r1.customer_id <> r2.customer_id
GROUP BY r1.customer_id, r2.customer_id
HAVING COUNT(*) > 3;

SELECT actor_id, title
FROM sakila.actor
CROSS JOIN sakila.film;
