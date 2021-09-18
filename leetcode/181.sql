-- 매니저보다 많이 버는 직원 조회
-- SELF JOIN
SELECT E.Name AS Employee 
FROM Employee E
INNER JOIN Employee M
ON E.ManagerId = M.Id
WHERE E.Salary > M.Salary;
