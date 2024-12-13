🎬 Sakila Database Query Adventures! 🌟

Welcome to my **Sakila Database Query Practice** repository! If you're a fan of SQL, movies, and uncovering data insights, you're in for a treat. 🍿 In this journey, I explored the Sakila database using **INNER JOIN**, **GROUP BY**, and other SQL magic to answer some fun questions. Ready? Let’s dive in! 🚀

---

## 🧑‍💻 What’s Inside?

Here are the exciting queries I worked on, along with snippets of SQL brilliance. 😎

---

### 1️⃣ Staff Member Details 🧑‍💼  
Using `INNER JOIN`, I displayed the **names and addresses** of all staff members. Because, why not know where your favorite employees live? 😏

```sql
SELECT 
  CONCAT(s.first_name, ' ', s.last_name) AS Employee, 
  CONCAT_WS(', ', a.address, a.address2, a.district, a.postal_code) AS Address 
FROM staff AS s
INNER JOIN address AS a 
ON s.address_id = a.address_id;
```
### 2️⃣ Staff and Payments 💰
Who’s earning what? I combined the staff and payment tables to find out how much each staff member is handling. 💼
```sql
SELECT 
  CONCAT(s.first_name, ' ', s.last_name) AS Employee, 
  SUM(p.amount) AS TotalAmount
FROM staff AS s
INNER JOIN payment AS p 
ON s.staff_id = p.staff_id
GROUP BY Employee;
```
### 3️⃣ August 2005 Payments 📅
For a little time travel, I queried all payments made by staff members in August 2005. Who doesn’t love a good retro analysis? 😍
```sql
select concat(s.first_name,' ',s.Last_Name) as Employee, p.payment_date, sum(p.amount) as amount
from staff as s
inner join payment as p 
on s.staff_id = p.staff_id
where year(p.payment_date) = '2005' and month(p.payment_date) = '08'
group by employee, payment_date;
```
### 4️⃣ Actors Per Film 🎭
Ever wondered how many actors star in each movie? This query counts them all. 🎥
```sql
select f.title, count(fa.actor_ID)
from film as f
inner join film_actor as fa
on f.film_id = fa.film_id
group by title;
```

---

## 💡 What I Learned

- **INNER JOIN** is my new best friend for combining data across tables. 🙌  
- **GROUP BY** is great for summarising data like totals and counts. 📊  
- **Date-based queries** are powerful for time-series analysis. 📅  

---

## 🛠 Tools Used

- **MySQL**: The engine powering all the Sakila database queries.  
- **Sakila Database**: A treasure trove of movie-related data. 🎥  
- **Patience**: Because debugging SQL syntax is an adventure. 🤓  

---

## 🌟 Next Steps
  
- Keep practicing and leveling up my **SQL skills**! 💪  
