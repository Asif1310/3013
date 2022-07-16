# Write your MySQL query statement below

WITH cte1 AS
(SELECT email, COUNT(email) as email_count
FROM Person
GROUP BY email)

SELECT email FROM cte1 WHERE email_count > 1