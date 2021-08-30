SELECT * FROM tstaff;

select name, salary from tstaff;
-- 직원 테이블에서 이름, 부서, 직급 필드만 출력
select name, depart, grade from tstaff;

-- where 
-- 3. 월급이 400만원 이상인 직원 이름 출력
select name as "이름", salary * 10000 as "월급" from tstaff where salary >= 400 ;

-- null
-- 필드는 값이고, null은 상태이기 때문에 is null 연산자 사용
select * from tstaff where score is null;
select * from tstaff where score is not null;