SELECT * FROM tproject;

-- 10.4 프로젝트 비용이 500만원 미만인 프로젝트를 출력하되 프로젝트 담당자도 같이 출력
select p.project,p.employee, e.salary, e.addr 
from tproject p
inner join temployee e
on p.employee = e.name
where p.cost<500;


