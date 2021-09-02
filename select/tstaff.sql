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

-- 16. 직원 목록을 월급이 적은 사람부터 순서대로 출력하되, 월급이 같다면 성취도가 높은 사람 먼저 출력
select * from tstaff order by salary, score desc;
-- 17. 영업부 직원을 먼저 입사한 순서대로 정렬
select * from tstaff where depart = '영업부' order by joindate;
-- 18. 2020년 이후 신입 직원을 받은 적이 있는 부서 목록 조회
select distinct depart from tstaff where joindate >= '2020-01-01';

-- 5장. 데이터 집계
-- 1. 실적도 없이 놀고 있는 두 직원은 누구인지 조회 
select name from tstaff where score is null;
-- 2. 성취도가 80점 이상인 직원이 몇 명이나 되는지 검색
select count(name) from tstaff where score >= 80;
-- 3. 여직원 중 최고 월급은 얼마인지 검색
select name, max(salary) as '최고 월급' from tstaff where gender = '여';
-- 4. 총무부 직원이 최초로 입사한 날짜 검색
select min(joindate) from tstaff where depart = '총무부';
select joindate from tstaff where depart = '총무부' order by joindate limit 1;

-- 6장. 데이터 관리
-- 2. 직원 목록에 임의의 데이터 삽입
insert into tstaff values ('부엉이','영업부','여','2019-04-13','사원',330,79.20);
-- 4. 성취도가 80점 이상인 직원만 골라 이름과 월급에 대한 보고서를 별도의 테이블로 작성
create table 보고서 as select name, salary from tstaff where score >= 80;
select * from 보고서;
-- 5. 영업부 직원 전부 해고
delete from tstaff where depart = '영업부';
-- 6. 여자 사원급을 모두 대리로 진급
update tstaff set grade = '대리' where gender = '여' and grade = '사원';
-- 7. 영업부 직원의 월급 10%씩 인상
update tstaff set salary = salary * 1.1 where depart ='영업부';

-- 9장. 서브쿼리
-- 1. 성취도가 제일 높은 직원 조회
select name from tstaff where score = (select max(score) from tstaff);
-- 2. 평균 잉상의 월급을 받는 직원 목록 조회
select name from tstaff where salary >= (select avg(salary) from tstaff);
-- 