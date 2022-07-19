# Write your MySQL query statement below

WITH cte1 AS
(SELECT num,
CASE WHEN num <> @previous THEN @counter := @counter + 1 ELSE @counter := @counter END AS counter,
@previous := num
FROM Logs, (SELECT @counter := 0, @previous := 0)sub1)

SELECT DISTINCT cte1.num AS ConsecutiveNums 
FROM cte1 JOIN
(SELECT counter, COUNT(*)
FROM cte1
GROUP BY counter
HAVING COUNT(*)> 2)sub2
ON cte1.counter = sub2.counter