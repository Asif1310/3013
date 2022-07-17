# Write your MySQL query statement below

WITH cte1 AS
(SELECT W2.id, CASE WHEN W2.temperature > W1.temperature THEN 1 ELSE 0 END AS Result
FROM Weather W1
JOIN Weather W2
ON W2.recordDate = W1.recordDate + INTERVAL 1 DAY)

SELECT id from cte1
WHERE Result = 1

