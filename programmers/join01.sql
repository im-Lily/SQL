-- 입양 간 기록은 있는데 보호소에 들어온 기록이 없는 아이디와 이름 조회
-- 아이디 순 조회

SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_OUTS O
LEFT JOIN ANIMAL_INS I
ON O.ANIMAL_ID = I.ANIMAL_ID
WHERE I.ANIMAL_ID IS NULL
ORDER BY O.ANIMAL_ID;

/**
OUTS에 있으면서 INS에는 없는 데이터 조회
*/