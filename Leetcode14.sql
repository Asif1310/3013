# Write your MySQL query statement below
WITH CTE1 AS
(SELECT user_id, COUNT(order_id) AS orders_in_2019,EXTRACT(YEAR FROM Orders.order_date) AS Year
FROM Users JOIN Orders ON
Users.user_id = Orders.buyer_id
GROUP BY user_id,Year
HAVING Year = 2019)

SELECT user_id AS buyer_id, join_date, 0 as orders_in_2019 FROM Users WHERE user_id NOT IN
(SELECT user_id FROM CTE1)
UNION
SELECT CTE1.user_id AS buyer_id, join_date, orders_in_2019
FROM CTE1
JOIN Users ON CTE1.user_id = Users.user_id