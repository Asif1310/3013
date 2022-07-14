# Write your MySQL query statement below

SELECT sub.Department, sub.Employee, sub.Salary FROM
(SELECT d.name as Department,e.name as Employee, e.salary as Salary, DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) as sal_rank
FROM Employee e
JOIN Department d
ON e.departmentId = d.id)sub
WHERE sub.sal_rank <= 3