SELECT * FROM torder;

select distinct member
from torder;
-- 춘향이가 구입한 물건의 제품과 가격 검색 
select item, price
from titem
where item = 
(select item from torder where member = '춘향');
-- 
select i.item, i.price
from titem i
inner join torder o
on i.item = o.item
where o.member = '춘향';
-- 식품에 대한 주문 목록 출력
select *
from titem i
inner join tcategory c
on i.category = c.category
where i.category = '식품';
-- 다중 조인 : 회원명, 제품, 개수, 날짜, 가격, 배송비
select m.member, o.item, o.num, o.orderDate, i.price, c.delivery
from tmember m
inner join torder o on m.member = o.member
inner join titem i on o.item = i.item
inner join tcategory c on i.category = c.category;
