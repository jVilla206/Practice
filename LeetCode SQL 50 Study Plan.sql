# LeetCode SQL 50 Study Plan

### Select
1757. Recyclable and Low Fat Products (Easy)
````sql
SELECT product_id
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y'
````

584. Find Customer Referee (Easy)
````sql
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL
````

595. Big Countries (Easy)
````sql
SELECT name
      ,population
      ,area
FROM World
WHERE area >= 3000000 OR population >= 25000000
````

1148. Article Views I (Easy)
````sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id
````

1683. Invalid Tweets (Easy)
````sql
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15
````




### Basic Joins
1378. Replace Employee ID With The Unique Identifier (Easy)
````sql
SELECT unique_id
      ,name
FROM EmployeeUNI eu
RIGHT JOIN Employees e
  ON eu.id = e.id
````

1068. Product Sales Analysis I (Easy)
````sql
SELECT p.product_name, s.year, s.price
FROM Product p
JOIN Sales s 
ON s.product_id = p.product_id
````

1581. Customer Who Visited but Did Not Make Any Transactions (Easy)
````sql
SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM visits v
LEFT JOIN transactions t
  ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id
````

197. Rising Temperature (Easy)
````sql
SELECT w2.id as id
FROM weather w1
JOIN weather w2
  ON DATEDIFF(w2.recordDate, w1.recordDate) = 1
WHERE w2.temperature > w1.temperature
````

1661. Average Time of Process per Machine (Easy)
````sql
Not finished
````

577. Employee Bonus
````sql
SELECT name
      ,bonus
FROM Employee e
LEFT JOIN Bonus b
  ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL
````

1280. Students and Examinations (Need to practice again) (Easy)
````sql
SELECT s1.student_id
      ,s1.student_name
      ,s2.subject_name
      ,COALESCE(COUNT(s3.student_id), 0) as attended_exams
FROM Students s1
CROSS JOIN Subjects s2  -- Cartesian product to get all combinations of students and subjects
LEFT JOIN Examinations s3
  ON s1.student_id = s3.student_id AND s2.subject_name = s3.subject_name
GROUP BY s2.subject_name, s1.student_id
ORDER BY s1.student_id, s2.subject_name
````

570. Managers with at Least 5 Direct Reports (Medium)
````sql
SELECT e1.name
FROM Employee e1
JOIN Employee e2
  ON e1.id = e2.managerId
GROUP BY e1.id
HAVING COUNT(e2.managerId) >= 5
````

1934. Confirmation Rate (Medium)
````sql
Not finished
````

### Basic Aggregate Functions

620. Not Boring Movies (Easy)
````sql
SELECT *
FROM Cinema
WHERE description != 'boring'
  AND MOD(id, 2) != 0
ORDER BY rating DESC
````

1251. Average Selling Price (Easy)
````sql
# Average selling price: # units * price
SELECT p.product_id
      ,IFNULL(ROUND(SUM(p.price * u.units)/ SUM(u.units), 2), 0) as average_price
FROM Prices p
LEFT JOIN UnitsSold u
  ON p.product_id = u.product_id AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id
````

1075. Project Employees I (Easy)
````sql
SELECT project_id
      ,ROUND(AVG(experience_years), 2) as average_years
FROM Project p
LEFT JOIN Employee e
  ON p.employee_id = e.employee_id
GROUP BY project_id
````

1633. Percentage of Users Attended a Contest (Easy)
````sql
SELECT contest_id
      ,ROUND(COUNT(user_id)*100/ (SELECT COUNT(user_id) FROM Users), 2) as percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
````

1211. Queries Quality and Percentage (Easy)
````sql
select
    query_name,
    round(avg(rating/position), 2) as quality,
    round(sum(if(rating < 3,1,0)) * 100 / count(*), 2) as poor_query_percentage
from
    Queries
where 
    query_name is not null
group by
    query_name
````

1193. Monthly Transactions I (Medium)
````sql
Not finished
````

1174. Immediate Food Delivery II (Medium)
````sql
Not finished
````

550. Game Play Analysis IV (Medium)
````sql
Not finished
````




### Sorting and Grouping
2356. Number of Unique Subjects Taught by Each Teacher (Easy)
````sql
SELECT teacher_id, COUNT(DISTINCT subject_id) as cnt
FROM Teacher
GROUP BY teacher_id
````

1141. User Activity for the Past 30 Days I (Easy)
````sql
SELECT activity_date as day
      ,COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date
````

1070. Product Sales Analysis III (Medium)
````sql
Not finished
````

596. Classes More Than 5 Students (Easy)
````sql
SELECT DISTINCT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5
````

1729. Find Followers Count (Easy)
````sql
SELECT user_id
      ,COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id
````

619. Biggest Single Number (Easy)
````sql
SELECT CASE
            WHEN COUNT(num) = 1 THEN num
            ELSE NULL
        END num
FROM MyNumbers
GROUP BY num
ORDER  BY num DESC
LIMIT 1
````

1045. Customers Who Bought All Products (Medium)
````sql
Not finished
````




### Advanced Select and Joins
1731. The Number of Employees Which Report to Each Employee (Easy)
````sql
Not finished
````

1789. Primary Department for Each Employee (Easy)
````sql
Not finished
````

10. Triangle Judgement (Easy)
````sql
Not finished
````

180. Consecutive Numbers (Medium)
````sql
Not finished
````

1164. Product Price at a Given Date (Medium)
````sql
Not finished
````

1204. Last Person to Fit in the Bus (Medium)
````sql
Not finished
````

1907. Count Salary Categories (Medium)
````sql
Not finished
````






### Subqueries
1978. Employees Whose Manager Left the Company (Easy)
````sql
Not finished
````

626. Exchange Seats (Medium)
````sql
Not finished
````

1341. Movie Rating (Medium)
````sql
Not finished
````

1321. Restaurant Growth (Medium)
````sql
Not finished
````

602. Friend Requests II: Who Has the Most Friends (Medium)
````sql
Not finished
````

585. Investments in 2016 (Medium)
````sql
Not finished
````

185. Department Top Three Salaries (Hard)
````sql
Not finished
````




### Advanced String Functions / Regex / Clause

1667. Fix Names in a Table (Easy)
````sql
SELECT user_id
      ,CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) as name
FROM Users
ORDER BY user_id
````

1527. Patients With a Condition (Easy)
````sql
Not finished
````

196. Delete Duplicate Emails (Easy)
````sql
Not finished
````

176. Second Highest Salary (Medium)
````sql
Not finished
````

1484. Group Sold Products By The Date (Easy)
````sql
Not finished
````

1327. List the Products Ordered in a Period (Easy)
````sql
Not finished
````

1517. Find Users With Valid E-Mails (Easy)
````sql
Not finished
````
