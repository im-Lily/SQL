SELECT * FROM 제품;

-- 7.13 제품 테이블에서 제조업체 검색
select all 제조업체 from 제품; -- 중복 허용
select distinct 제조업체 from 제품; -- 중복 제거

-- 7.16 제품 테이블에서 제품명과 단가를 검색하되, 단가를 가격이라는 새 이름으로 출력
select 제품명, 단가 as "가격" from 제품;

-- 7.17 제품 테이블에서 제품명과 단가 속성을 검색하되, 단가에 500원을 더해 "조정 단가"라는 새 이름으로 출력
select 제품명, 단가 + 500 as "조정 단가" from 제품;

-- 7.18 제품 테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가 검색
select 제품명, 재고량, 단가 from 제품 where 제조업체="한빛제과";

-- 7.21 제품 테이블에서 단가가 2,000원 이상이면서 3,000원 이하인 제품의 제품명, 단가, 제조업체 검색
select 제품명, 단가, 제조업체 from 제품 where 단가 between 2000 and 3000;

-- 집계함수 -> count, min, max, sum, avg 
-- 널인 속성 값은 제외하고 계산 / select, having 절에서만 사용 가능
-- 7.28 제품 테이블에서 모든 제품의 단가 평균 검색
select avg(단가) as "단가 평균" from 제품;

-- 7.29 한빛제과에서 제조한 제품의 재고량 합계를 제품 테이블에서 검색
select sum(재고량) as "재고량 합계" from 제품 where 제조업체 = "한빛제과";

-- 7.31 제품 테이블에서 제조업체의 수 검색
select count(distinct 제조업체) as "제조업체 수" from 제품;

-- 7.33 제품 테이블에서 제조업체별로 제조한 제품의 개수와 제품 중 가장 비싼 단가를 검색하되,
-- 제품의 개수는 제품수라는 이름으로 출력하고 가장 비싼 단가는 최고가라는 이름으로 출력
select 제조업체, count(*) as "제품수", max(단가) "최고가" from 제품 group by 제조업체;

-- 7.34 제품 테이블에서 제품을 3개 이상 제조한 제조업체별로 제품의 개수와, 제품 중 가장 비싼 단가 검색
select 제조업체, count(*) "제품수", max(단가) "최고가" from 제품 group by 제조업체 having count(*) >= 3;

-- 서브쿼리 : 괄호로 묶어 작성하고 order by 절 사용 불가
-- 서브쿼리 먼저 수행
-- 단일 행 서브쿼리 -> 일반 비교 연산자 사용 가능
-- 다중 행 서브쿼리 -> 일반 비교 연산자 사용 불가
-- 7.40 달콤비스킷을 생산한 제조업체가 만든 제품들의 제품명과 단가 검색
-- 단일 행 서브쿼리 
select 제품명, 단가 from 제품 where 제조업체 = (select 제조업체 from 제품 where 제품명 = "달콤비스킷");

-- 7.42 banana 고객이 주문한 제품의 제품명과 제조업체 검색
-- 다중 행 서브쿼리
select 제품명, 제조업체 from 제품 where 제품번호 in (select 주문제품 from 주문 where 주문고객 = "banana"); 
select 제품.제품명, 제품.제조업체 from 제품, 주문 where 주문.주문고객 = "banana" and 제품.제품번호 = 주문.주문제품;

-- 7.43 banana 고객이 주문하지 않은 제품의 제품명과 제조업체 검색
select 제품명, 제조업체 from 제품 where 제품번호 not in (select 주문제품 from 주문 where 주문고객 = "banana"); 

-- 7.44 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체 검색
select 제품명, 단가, 제조업체 from 제품 where 단가 > all (select 단가 from 제품 where 제조업체 = "대한식품");

-- 7.49 제품 테이블에서 제품번호가 p03인 제품의 제품명을 통큰파이로 수정
update 제품 set 제품명 = '통큰파이' where 제품번호 = 'p03';
select * from 제품;

-- 7.50 제품 테이블에 있는 모든 제품의 단가를 10% 인상
update 제품 set 단가 = 단가 * 1.1;
select * from 제품;

-- 7.56 제품 테이블에서 제조업체별 제품수로 구성된 뷰를 업체별제품수라는 이름으로 생성 
create view 업체별제품수 as select 제조업체, count(제품번호) as "제품수" from 제품 group by 제조업체;
-- create view 업체별제품수(제조업체, 제품수) as select 제조업체, count(*) from 제품 group by 제조업체;
select * from 업체별제품수;

create view 제품1 as select 제품번호, 재고량, 제조업체 from 제품 with check option;
create view 제품2 as select 제품명, 재고량, 제조업체 from 제품 with check option;

-- 7.58 제품번호가 p08, 재고량이 1000, 제조업체가 신선식품인 새로운 제품의 데이터를 제품1 뷰에 삽입
select * from 제품1;
insert into 제품1 values ('p08',1000,'신선식품'); -- 생성된 뷰를 통해 제품 테이블에 새로운 튜플 삽입
select * from 제품; -- 뷰를 통해 제시하지 않은 제품명 속성과 단가 속성은 널 값 저장alter

-- 검색 연산은 모든 뷰에 수행할 수 있지만 삽입,수정,삭제 연산은 허용되지 않는 뷰 존재
-- 1. 기본 테이블의 기본키를 구성하는 속성이 포함되어 있지 않은 뷰는 변경 불가
-- 2. 기본 테이블에 있던 내용이 아니라 집계 함수로 새로 계산된 내용을 포함하고 있는 뷰는 변경 불가
-- 3. distinct 키워드를 포함하여 정의한 뷰는 변경 불가
-- 4. group by 절을 포함하여 정의한 뷰는 변경 불가
-- 5. 여러 개의 테이블 조인하여 정의한 뷰는 변경 불가

drop view 제품1;
select * from 제품;