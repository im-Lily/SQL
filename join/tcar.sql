SELECT * FROM tcar;

-- 단순 조인 (크로스 조인)
-- 결과셋의 크기는 두 테이블의 레코드 개수를 곱한 것과 같음
select * from tcar, tmaker;
-- 회사명이 일치하는 것만 출력
select * from tcar, tmaker 
where tcar.maker = tmaker.maker;
