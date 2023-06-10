-- list all actors with each title they appear in
SELECT 
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name,
    film.title AS film_title
FROM 
    actor
        INNER JOIN
    film_actor ON film_actor.actor_id = actor.actor_id
        INNER JOIN
    film ON film.film_id = film_actor.film_id