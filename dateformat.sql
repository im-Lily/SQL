-- 동물 아이디, 이름, 들어온 날짜 조회, 아이디 순 정렬
-- 날짜(년-월-일)만 보여주세요
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d')
FROM ANIMAL_INS 
ORDER BY ANIMAL_ID;

/*
- 날짜 데이터 일부만 추출하기
- YEAR, MONTH, HOUR, MINUTE ,, 함수 이용
*/
-- 9시부터 20시까지 시간대별 발생한 입양 건수 조회, 시간 순 정렬
SELECT HOUR(DATETIME) AS "HOUR",
COUNT(HOUR(DATETIME)) AS "COUNT"
FROM ANIMAL_OUTS 
GROUP BY HOUR
HAVING HOUR BETWEEN 9 AND 19
ORDER BY HOUR;

/*
날짜 차이 구하기
DATEDIFF(날짜1, 날짜2) -> 날짜1 - 날짜2
*/
-- 입양간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름 조회,
-- 보호 기간이 긴 순으로 조회
SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS I
INNER JOIN ANIMAL_OUTS O
ON I.ANIMAL_ID = O.ANIMAL_ID
ORDER BY DATEDIFF(O.datetime,I.datetime) DESC
limit 2;

