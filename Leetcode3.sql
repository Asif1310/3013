# Write your MySQL query statement below

# CTE to select total trips involving unbanned users between the specified dates

WITH cte_trips AS 
(SELECT t.id as id, t.status as trip_status, t.request_at as trip_date
FROM Trips t
JOIN Users c on t.client_id = c.users_id AND c.banned <> 'Yes'
JOIN Users d on t.driver_id = d.users_id AND d.banned <> 'Yes'
WHERE t.request_at BETWEEN "2013-10-01" AND "2013-10-03")

SELECT total.trip_date AS Day, ROUND(numerator/denominator, 2) AS "Cancellation Rate"
FROM
(SELECT COUNT(id) as denominator, trip_date FROM cte_trips WHERE trip_status GROUP BY trip_date) total
JOIN
(SELECT COUNT(id) as numerator, trip_date FROM cte_trips WHERE trip_status LIKE 'cancelled%' GROUP BY trip_date
UNION
SELECT 0 as numerator, trip_date FROM cte_trips WHERE trip_date NOT IN (SELECT trip_date FROM cte_trips WHERE trip_status LIKE 'cancelled%')) cancel
on total.trip_date = cancel.trip_date

