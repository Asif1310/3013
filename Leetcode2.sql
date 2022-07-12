CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (

      WITH cte1 AS (SELECT salary, DENSE_RANK()OVER(ORDER BY salary DESC)  AS sal_rank FROM Employee)
      
      SELECT CASE 
      WHEN MAX(sal_rank) < N THEN NULL
      ELSE (SELECT MAX(cte1.salary) FROM cte1 WHERE sal_rank = N) END
      FROM cte1
      
  );
END