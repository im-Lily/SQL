SELECT * FROM usertb1;

/* 
where 조건절 -> 조건 연산자, 관계 연산자
조건 연산자 -> =, <, >, <=, >=, !=
관계 연산자 -> OR, AND, NOT
1. 조건 연산자를 통해서 addr이 서울인 사람만 출력
*/
select name, addr
from usertb1
where addr = '서울';
-- 2. 조건 연산자와 관계 연산자를 통해 이름이 '이승기'가 아니고 addr이 서울인 사람 출력
select name, addr
from usertb1
where name != '이승기' and addr = '서울';
-- 3. 키가 180 ~ 190인 사람을 조회
select name, height
from usertb1
where height between 180 and 190; -- WHERE height >= 180 AND height <= 190;
-- 4. addr이 서울이거나 경북인 사람 조회
select name, addr
from usertb1
where addr in ('서울','경북'); -- where addr = '서울' or addr = '경북'; 
-- 5. 키가 180 ~ 190인 사람을 조회하는데, 키가 작은 순으로 조회
select name, height
from usertb1
where height between 180 and 190
order by height; -- 오름차순
/* 
order by height desc; 내림차순
6. usertb1 에서 사용자들의 평균 키 출력
*/
select avg(height)
from usertb1;
-- 7.  usertb1 에서 키가 가장 큰 사용자와 키가 가장 작은 사용자의 이름 출력 -- TODO
select min(height) as "가장 작은 키", max(height) as "가장 큰 키"
from usertb1;
-- 8. usertb1 에서 지역 별로 사용자들의 키 평균이 몇인지 출력하라
select addr, avg(height)
from usertb1
group by addr;
-- 9. usertb1 에서 번호 앞 자리(010인지 011인지) 별로 몇 명이 있는지 출력하라
select mobile1, count(*)
from usertb1
group by mobile1;
/* 
limit : 출력 제한
상위 5개 데이터 출력
*/
SELECT name, height
FROM usertb1
ORDER BY height ASC
LIMIT 5;
/* 
offsete : 어디서부터 어디까지 출력 제한
키가 작은 상위 3번째부터 5개의 데이터 출력
*/
SELECT name, height
FROM usertb1
ORDER BY height ASC
LIMIT 3, 5;
/* 
10. usertb1에서 장원익의 키보다 큰 사람들을 출력
서브쿼리
any : 서브 쿼리의 반환들 중 하나라도 해당한다면 되는 OR
all : 서브 쿼리의 반환들 중 모두 해당되는 AND
하나의 반환값
*/
select name, height
from usertb1
where height >= 
(select height from usertb1 where name = '장원익');
-- any
SELECT name, height
FROM usertb1
WHERE height >= ANY (select height from usertb1 where name = '장원익' or name = '김호중');
-- all
SELECT name, height
FROM usertb1
WHERE height >= ALL (select height from usertb1 where name = '장원익' or name = '손흥민');
-- 11. 사용자 키는 몇 가지가 있는지 출력
select count(distinct(height))
from usertb1;
