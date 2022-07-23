# Write your MySQL query statement below

SELECT d.name AS Department, e1.name AS Employee, e1.salary AS Salary
FROM
(SELECT e.departmentId, max(e.salary) AS maximum
FROM Employee e
GROUP BY e.departmentId)sub
JOIN Employee e1
ON e1.departmentId = sub.departmentId
AND e1.salary = sub.maximum
JOIN Department d
ON e1.departmentId = d.id 
