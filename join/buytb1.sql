SELECT * FROM buytb1;

/* 
집계함수
avg, max, min, count
1. buytb1 에서 총 얼만큼 주문되었는지 총 주문량 출력
*/
select sum(amount)
from buytb1;
/* 
2. buytb1 에서 물품 별로 총 몇 개가 주문되었는지 출력하라
개수(count)와 주문량(sum)은 다름!
count : 셀 개수, sum : 합계
*/
select prodname, count(amount)
from buytb1
group by prodname;
-- 3. buytb1 에서 물품 별로 가장 많이 주문된 것을 출력하라
select prodname, max(amount)
from buytb1
group by prodname;
-- 4. buytb1 에서 사용자들의 총 구매 금액을 출력하라
select userid, sum(amount*price)
from buytb1
group by userid;
-- 5. buytb1에서 사용자들이 평균적으로 몇 개의 물건을 샀는지 출력 
-- TODO
select userid, count(prodname)
from buytb1
group by userid;
/* 
6. buytb1 에서 사용자들의 총 구매 금액이 1500 이상인 사용자를 출력하라
having : 집계 함수에서 조건 줄 때 사용
*/
select userid, sum(price*amount)
from buytb1
group by userid
having sum(price*amount) >= 1500;
-- is null
SELECT *
FROM buytb1
WHERE groupname IS NULL;
-- is not null
SELECT *
FROM buytb1
WHERE groupname IS NOT NULL;
-- inner join : 교집합
select b.userid, u.name, b.price
from buytb1 b
inner join usertb1 u
on b.userid = u.userid;
/* 
outer join
left outer join / right outer join / full outer join
*/
-- 7. 전체 회원의 구매 기록을 출력하되, 구매 기록이 없는 회원도 출력
select *
from usertb1 u
left outer join buytb1 b
on u.userid = b.userid;

