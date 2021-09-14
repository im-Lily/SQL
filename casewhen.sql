/*
CASE WHEN 조건절 
THEN 참일때 값 
ELSE 거짓일때 값 
END 컬럼명
*/

-- 중성화된 동물의 아이디, 이름, 중성화 여부 아이디 순으로 조회
-- 중성화 여부 O, X
SELECT ANIMAL_ID, NAME,
    CASE
    WHEN
        SEX_UPON_INTAKE LIKE '%Neutered%'
        OR SEX_UPON_INTAKE LIKE '%Spayed%'
    THEN 'O'
    ELSE 'X'
    END AS '중성화'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;