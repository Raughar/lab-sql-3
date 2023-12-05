-- Selecting the database to use.
use sakila;

-- Checking how many distinct actors last names are present:
select count(distinct last_name) as Num_Of_Distinct_Last_Names
from actor;

-- Checking in how many languages where the movies originally produced:
select count(distinct language_id) as Unique_Languages
from language;

-- Checking how many movies where produced under the PG-13 rating:
select count(film_id) from film
where rating = "PG-13";

-- Getting the longest movies from 2006:
select film_id, title, length 
from film
where release_year="2006"
order by length desc
limit 10;

-- Checking how many days has the company been operating:
select datediff(max(rental_date), min(rental_date)) as Days_Operating from rental;

-- Showing the rental info adding the month and weekday columns:
select *, month(rental_date) as Month, weekday(rental_date) as Weekday
from rental
limit 20;

-- Doing the same as above, but adding the values weekend or workday depending on the rental day:
select 
*,
month(rental_date) as Month,
weekday(rental_date) as Weekday,
case
	when weekday(rental_date) in (0, 6) then 'Weekend'
    else 'Workday'
end as Type_Of_Day
from rental;

-- Getting how many rentals have been done in the last month:
	-- Checking the last month.
		select max(rental_date)
		from rental;

	-- Getting the data.
		select rental_date
		from rental
		where month(rental_date) = 2;