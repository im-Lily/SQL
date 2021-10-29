-- 각 시간대별 입양이 몇 건이나 발생했는지 조회
-- 시간대 순으로 정렬
SELECT HOUR(DATETIME) AS HOUR, COUNT(*) AS COUNT
FROM ANIMAL_OUTS
GROUP BY HOUR(DATETIME)
HAVING HOUR BETWEEN 9 AND 19
ORDER BY HOUR;

/**
날짜 함수
YEAR : 연도 추출
MONTH : 월 추출
DAY : 일 추출 
HOUR : 시 추출
MINUTE : 분 추출
SECOND : 초 추출
*/