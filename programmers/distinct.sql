-- 동물 이름 몇 개 인지 조회, 중복 제외
-- 이름이 NULL인 경우 제외
SELECT COUNT (DISTINCT NAME)
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;