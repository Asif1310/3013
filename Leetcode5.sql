# Write your MySQL query statement below

WITH cte1 AS
(
SELECT
id, visit_date, people,
@group := if(id = @previous + 1, @group, @group + 1) AS group_num,
@previous := id
FROM (SELECT * FROM Stadium
WHERE people >= 100)sub1,(SELECT @group := 0, @previous := 0)sub2)

SELECT id, visit_date, people 
FROM cte1 WHERE group_num in
(
SELECT sub3.group_num FROM
(
SELECT group_num, count(*)
FROM cte1
GROUP BY group_num
HAVING COUNT(*)>=3)sub3)
ORDER BY visit_date