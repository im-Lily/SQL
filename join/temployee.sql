SELECT * FROM temployee;

-- 10.1 단순 조인으로 temployee 직원 목록과 월급 출력하고 tproject에서 이 직원이 맡은 프로젝트 출력
select temployee.name, tproject.project 
from temployee, tproject 
where temployee.name = tproject.employee;
-- 10.2 단순 조인 -> 내부 조인
select e.name, p.project
from temployee e
inner join tproject p
on e.name = p.employee;
-- 10.3 직원과 프로젝트 테이블을 내부, 왼쪽 외부, 오른쪽 외부 조인으로 출력
select * 
from temployee e
inner join tproject p
on e.name = p.employee;

select *
from temployee e
left outer join tproject p
on e.name = p.employee;

select *
from temployee e
right outer join tproject p
on e.name = p.employee;

