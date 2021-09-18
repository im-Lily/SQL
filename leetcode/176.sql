-- 두번째 높은 월급 받는 직원 조회
SELECT MAX(Salary) AS "SecondHighestSalary"
FROM Employee 
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
