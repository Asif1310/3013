# Write your MySQL query statement below

WITH cte1 AS
(
    SELECT sub1.id AS id, 
CASE WHEN sub2.student is NULL THEN sub1.student ELSE sub2.student END AS Student
FROM
(SELECT * FROM Seat WHERE ((id % 2 <> 0) OR (id = 1)))sub1 LEFT JOIN
(SELECT * FROM Seat WHERE id % 2 = 0)sub2
ON sub1.id = sub2.id-1
    
UNION
    
    SELECT sub4.id AS id, sub3.student AS Student
FROM
(SELECT * FROM Seat WHERE ((id % 2 <> 0) OR (id = 1)))sub3 JOIN
(SELECT * FROM Seat WHERE id % 2 = 0)sub4
ON sub4.id-1 = sub3.id
)

SELECT * FROM cte1 ORDER BY id


