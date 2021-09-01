SELECT * FROM 고객;

-- 7.10 고객 테이블에서 고객아이디, 고객이름, 등급 검색
select 고객아이디, 고객이름, 등급 from 고객;

-- 7.11 고객 테이블에 존재하는 모든 속성 검색
select * from 고객;

-- 7.22 고객 테이블에서 성이 김 씨인 고객의 고객이름, 나이, 등급, 적립금 검색
select 고객이름, 나이, 등급, 적립금 from 고객 where 고객이름 like "김%";

-- 7.23 고객 테이블에서 고객아이디가 5자인 고객의 고객아이디, 고객이름, 등급 검색
select 고객아이디, 고객이름, 등급 from 고객 where 고객아이디 like "_____";

-- 7.24 고객 테이블에서 나이가 아직 입력되지 않은 고객의 고객이름 검색
select 고객이름 from 고객 where 나이 is null;

-- 7.25 고객 테이블에서 나이가 이미 입력된 고객의 고객이름 검색
select 고객이름 from 고객 where 나이 is not null;

-- 7.26 고객 테이블에서 고객이름, 등급, 나이를 검색하되, 나이를 기준으로 내림차순 정렬
select 고객이름, 등급, 나이 from 고객 order by 나이 desc;

-- 7.30 고객 테이블에 고객이 몇 명 등록되어 있는지 검색
select count(*) as "고객수" from 고객;

-- 7.35 고객 테이블에서 적립금 평균이 1,000원 이상인 등급에 대해 등급별 고객수와 적립금 평균 검색
select 등급, count(*) "고객수", avg(적립금) "적립금 평균" from 고객 group by 등급 having avg(적립금) >= 1000;

-- 7.41 적립금이 가장 많은 고객의 고객이름과 적립금 검색
select 고객이름, 적립금 from 고객 where 적립금 = (select max(적립금) from 고객);

-- 7.45 2019년 3월 15일에 제품을 주문한 고객의 고객이름 검색
select 고객이름 from 고객 where exists (select * from 주문 where 주문일자 = "2019-03-15" and 주문.주문고객 = 고객.고객아이디);

-- 7.46 2019년 3월 15일에 제품을 주문하지 않은 고객의 고객이름 검색
select 고객이름 from 고객 where not exists (select * from 주문 where 주문일자 = "2019-03-15" and 주문.주문고객 = 고객.고객아이디);

-- 7.47 고객 테이블에 고객아이디가 strawberry, 고객이름이 최유경, 나이가 30세, 등급이 vip, 직업이 공무원, 적립금이 100원인 새로운 고객 데이터 삽입
insert into 고객 values ('strawberry','최유경',30,'vip','공무원',100);
select * from 고객;

-- 7.48 고객 테이블에 고객아이디가 tomato, 고객이름이 정은심, 나이가 36세, 등급이 gold, 적립금은 4000원, 직업은 아직 모르는 새로운 고객 데이터 삽입
-- 정은심 고객의 직업 속성이 널 값인지 확인
insert into 고객 (고객아이디, 고객이름, 나이, 등급, 적립금) values ('tomato','정은심',36,'gold',4000);
select 고객이름, 직업 from 고객 where 직업 is null;

-- 7.55 고객 테이블에서 등급이 vip인 고객의 고객아이디, 고객이름, 나이로 구성된 뷰를 우수고객이라는 이름으로 생성하고 검색
-- with check option : 생성한 뷰에 삽입이나 수정 연산을 할 때 select 문에서 제시한 뷰의 정의 조건 위반시 수행되지 않는 제약조건
create view 우수고객 as select 고객아이디, 고객이름, 나이 from 고객 where 등급 = 'vip' with check option;
select * from 우수고객;

-- 7.57 우수고객 뷰에서 나이가 25세 이상인 고객에 대한 모든 내용 검색
select * from 우수고객 where 나이 >= 25;

-- 7.59 우수고객 뷰 삭제
drop view 우수고객;