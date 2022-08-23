# Write your MySQL query statement below
WITH CTE1 AS
(SELECT stock_name, operation, SUM(price) as sm FROM Stocks
GROUP BY stock_name, operation)

SELECT A.stock_name, B.sm - A.sm AS capital_gain_loss FROM CTE1 A join CTE1 B
on A.stock_name = B.stock_name AND
A.operation <> B.operation AND
A.operation = "Buy" AND
B.operation = "Sell"