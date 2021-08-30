SELECT * FROM tstaff;

select name, salary from tstaff;
-- 1. 직원 테이블에서 이름, 부서, 직급 필드만 출력
select name, depart, grade from tstaff;

-- where 
-- 6. 월급이 400만원 이상인 직원 이름 출력
select name as "이름", salary * 10000 as "월급" from tstaff where salary >= 400 ;

-- null
-- 필드는 값이고, null은 상태이기 때문에 is null 연산자 사용
select * from tstaff where score is null;
select * from tstaff where score is not null;

-- 7. 직원 목록에서 월급이 300 미만이면서 성취도는 60 이상인 직원 검색
select name from tstaff where salary < 300 and score >= 60;
-- 8. 영업부의 여직원 이름 검색
select name from tstaff where depart = '영업부' and gender = '여';
-- 9. 직원 목록에서 '정'씨 검색
select * from tstaff where name like '정%';
-- 10. 이름에 '신'자가 포함된 직원 검색
select * from tstaff where name like '%신%';

-- between
select * from tstaff where name between '가' and '사';
select * from tstaff where joindate between '20150101' and '20180101';
-- 12. 월급이 200만원대인 직원 검색
select * from tstaff where salary between 200 and 299;

-- in
-- in과 like 연산자는 같이 쓸 수 없음
-- select * from tstaff where name like in ('이%', '안%'); 
select * from tstaff where name like '이%' or name like '안%';
-- 13. 총무부나 영업부에 근무하는 직원 검색
select * from tstaff where depart in ('총무부','영업부');
-- 14. 인사과나 영업부에 근무하는 대리 검색
select * from tstaff where depart in ('인사과','영업부') and grade = '대리';
-- 15. 차장급 이상의 여직원 검색
select * from tstaff where grade in ('차장','부장','이사') and gender = '여';