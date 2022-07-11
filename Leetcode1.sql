# Write your MySQL query statement below
with cte1 as
(SELECT salary, DENSE_RANK()OVER(ORDER BY salary DESC) as rnk from Employee)

SELECT case when max(cte1.rnk) = 1 then NULL
else (SELECT max(cte1.salary) from cte1 where cte1.rnk = 2) END as SecondHighestSalary
from cte1