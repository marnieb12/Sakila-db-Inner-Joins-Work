use sakila;

/***Exercises***/
     
    
/* 1- Use `INNER JOIN` to display the first and last names, as well as the address, of each staff member. 
Use the tables `staff` and `address` */
select concat(s.first_name,' ',s.Last_Name) as Employee, concat_ws(a.address, a.address2, a.district, a.postal_code) as Address 
from staff as s
 inner join address as a 
 on s.address_id = a.address_id;


select * from address;
select * from staff;


  
  
  
/* 2- Use `INNER JOIN` to display first name, last name and the amount for each staff member. 
Use tables `staff` and `payment*/
select concat(s.first_name,' ',s.Last_Name) as Employee, sum(p.amount) as amount
from staff as s
inner join payment as p
on s.staff_id = p.staff_id
Group by Employee;






/* 3- Use `INNER JOIN` to display first name, last name,  payment date and 
the amount for each staff member in  August of 2005. Use tables `staff` and `payment*/
select concat(s.first_name,' ',s.Last_Name) as Employee, p.payment_date, sum(p.amount) as amount
from staff as s
inner join payment as p 
on s.staff_id = p.staff_id
group by employee, payment_date
having year(p.payment_date) = '2005' and month(p.payment_date) = '08';

select concat(s.first_name,' ',s.Last_Name) as Employee, p.payment_date, sum(p.amount) as amount
from staff as s
inner join payment as p 
on s.staff_id = p.staff_id
where year(p.payment_date) = '2005' and month(p.payment_date) = '08'
group by employee, payment_date;

  
/* 4- Use `INNER JOIN` to display the total amount rung up by each staff member in August of 2005. 
Use tables `staff` and `payment`. */
select concat(s.first_name,' ',s.Last_Name) as Employee, sum(p.amount) as amount
from staff as s 
inner join payment as p
on s.staff_id = p.staff_id
where year(p.payment_date) = '2005' and month(p.payment_date) = '08'
group by Employee;




/* 5) List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. 
Use inner join, group by. */
select f.title, count(fa.actor_ID)
from film as f
inner join film_actor as fa
on f.film_id = fa.film_id
group by title;



/* 6) How many copies of the film `Hunchback Impossible` exist in the inventory system? 
Use tables `film` and `inventory`*/
select title, count(inventory_id) as copies
from film as f 
inner join inventory as i 
on f.film_id = i.film_id
where title = 'hunchback impossible';



/* 7) Using the tables `payment` and `customer` and the `INNER JOIN` command, list payments by each customer. 
List the customers alphabetically by last name */
select p.amount, c.first_name, c.last_name
from payment as p
inner join customer as c
on p.customer_ID = c.customer_id
order by c.Last_name;








/* 8) Using the tables `payment` and `customer` and the `INNER JOIN` command, list the total paid by each customer. 
List the customers alphabetically by last name. */
select sum(p.amount) as amount, c.first_name, c.last_name
from payment as p
inner join customer as c
on p.customer_ID = c.customer_id
group by c.first_name, c.last_name
order by c.Last_name;



/* 9) Which actor has appeared in the most films? */
select a.actor_ID, a.first_name, a.last_name, count(fa.film_ID) as FilmCount
from actor as a
inner join film_actor as fa
on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name
order by FilmCount desc
limit 1;





/* 10) Find the most common actor surname from the Sakila database */
select a.last_name, count(a.last_name) as CountOf
from actor as a
group by a.last_name
order by CountOf desc
Limit 1;




/* 11) List the last names of actors, as well as how many actors have that last name.*/
select a.last_name, count(a.last_name) as CountOf
from actor as a
group by a.last_name
order by CountOf;



/* 12) Which last names are not repeated? (Please search for having clause for this exercises) */
select a.last_name, count(a.last_name) as CountOf
from actor as a
group by a.last_name
having CountOf = 1;


/* 13) Which last names appear more than once? (Please search for having clause for this exercises) */
select a.last_name, count(a.last_name) as CountOf
from actor as a
group by a.last_name
having CountOf > 1
order by countOf;
