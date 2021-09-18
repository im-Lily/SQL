-- 중복 이메일 조회
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1
ORDER BY Email DESC;
