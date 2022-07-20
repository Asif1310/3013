# Write your MySQL query statement below

SELECT sub.department AS Department, e1.name AS Employee, e1.salary AS Salary
FROM
(SELECT e.departmentId, d.name AS department, max(e.salary) AS maximum
FROM Employee e
JOIN Department d
ON e.departmentId = d.id
GROUP BY e.departmentId, d.name)sub
JOIN Employee e1
ON e1.departmentId = sub.departmentId
AND e1.salary = sub.maximum