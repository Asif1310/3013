# Write your MySQL query statement below

SELECT id, 
CASE WHEN p_id is NULL THEN 'Root' 
WHEN id in (SELECT DISTINCT p_id FROM Tree) THEN 'Inner'
ELSE 'Leaf' END AS type
FROM Tree
ORDER BY id