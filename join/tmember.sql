SELECT * FROM tmember;

select distinct member from tmember;

select * from tmember,torder;
-- 단순 조인 where
select *
from tmember m, torder o
where m.member = o.member;
-- 내부 조인 on
select * 
from tmember m
inner join torder o
on m.member = o.member;
-- inner join : 조건에 일치하는 고객 정보만 출력
select m.addr, m.member, o.item, o.num, o.orderDate
from tmember m
inner join torder o
on m.member = o.member;
-- left outer join : 조건에 일치하는 고객 정보 + member 테이블에만 존재하는 고객 정보 출력
select m.addr, m.member, o.item, o.num, o.orderDate
from tmember m
left outer join torder o
on m.member = o.member;
-- right join : 주 테이블 tOrder로 변경 -> o.member로 변경
select m.addr, o.member, o.item, o.num, o.orderDate
from tmember m
right outer join torder o
on m.member = o.member;
-- full join : mariadb는 full join 지원x -> union 활용
select m.addr, m.member, o.item, o.num, o.orderDate
from tmember m
left join torder o
on m.member = o.member
union 
select m.addr, o.member, o.item, o.num, o.orderDate
from tmember m
right join torder o
on m.member = o.member;



