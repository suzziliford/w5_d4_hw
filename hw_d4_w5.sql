--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

select *
from film;


create or replace procedure add_film (
	title VARCHAR (255), 
	description text, 
	release_year year, 
	language_id INT2, 
	rental_duration INT2, 
	rental_rate numeric (4,2), 
	"length" int2, 
	replacement_cost numeric (5,2), 
	rating mpaa_rating)
language plpgsql
as $$
begin
	insert into film (film,
	title, 
	description, 
	release_year,
	language_id,
	rental_duration,
	rental_rate,
	"length",
	replacement_cost,
	rating)
	values
	(title,
	description, 
	release_year, 
	language_id, 
	rental_duration, 
	rental_rate, 
	"length", 
	replacement_cost, 
	rating);
end;
$$;

call add_film(
'Jumanji',
'A mysterious board game thrusts a family onto a wild adventure',
'1,994',
'6',
'7',
'4.99',
'100',
'12.99',
'pg-13');


create or replace procedure add_film (
	title VARCHAR (255), 
	description text, 
	release_year year, 
	language_id INT2, 
	rental_duration INT2, 
	rental_rate numeric (4,2), 
	"length" int2, 
	replacement_cost numeric (5,2), 
	rating mpaa_rating)
language plpgsql
as $$
begin
	insert into film(title); 
	description, 
	release_year, 
	language_id, 
	rental_duration, 
	rental_rate, 
	"length", 
	replacement_cost, 
	rating)
	values (
	title, 
	description, 
	release_year, 
	language_id, 
	rental_duration, 
	rental_rate, 
	"length", 
	replacement_cost, 
	rating
	);
end;
$$;

2. Create a Stored Function that will take in a category_id and return the number of
films in that category 



create or replace function return_genre_count (id integer)
returns integer
language plpgsql
as $$
	declare film_count integer;
begin 
	select count(*) into film_count
	from film_category fc
	where fc.category_id = id
	group by fc.category_id;
	return film_count;
end;
$$;

select return_genre_count (11);
select return_genre_count (16);






