-- 주소 여부랑 상관없이 사람에 대한 정보 조회
-- FirstName, LastName, City, State
SELECT P.FirstName, P.LastName, A.City, A.State
FROM Person P
LEFT JOIN Address A
ON P.PersonId = A.PersonId;