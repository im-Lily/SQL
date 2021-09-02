SELECT * FROM tcity;

select name, popu from tcity;
select region, name, area from tcity;

-- 별칭 큰 따옴표("") 사용
select name as "도시명", area as "면적(제곱Km)", popu as "인구(만명)" from tcity;
-- 2. 
select name as "도시", popu as "인구(만명)", region as "지역" from tcity;

-- 계산값 출력
select name, popu * 10000 as "인구(명)" from tcity;
select name, area, popu, popu * 10000 / area as "인구밀도" from tcity;

-- 더미데이터
select 60 * 60 * 24 as "하루" from dual;
-- 3.
select 60 * 60 * 24 * 365 as "1년" from dual;

-- where 작은 따옴표('') 사용
-- sql 구문은 대소문자를 가리지 않지만, 필드안에 저장된 값은 대소문자 구분함
select name, area from tcity where area > 1000;
select * from tcity where name = '서울';
select * from tcity where metro = 'y';
-- 4. 인구가 10만명 미만인 도시의 이름 출력
select name as "도시", popu * 10000 as "인구(명)" from tcity where popu < 10;
-- 5. 전라도에 있는 도시의 정보 출력
select * from tcity where region = '전라';

-- 논리 연산자 : 두 개 이상의 조건 동시에 검색 시 and, or 연산자 사용
-- and의 우선순위가 or보다 높기 때문에 괄호로 우선순위 명확히 지정하는 것을 권장
select * from tcity where popu >= 100 and area >= 700;
select * from tcity where region = '경기' and popu >= 50 or area >= 500;
select * from tcity where region = '경기' and (popu >= 50 or area >= 500);
select * from tcity where not(region = '경기');
select * from tcity where not(region = '전라' or metro = 'y');

-- like : 패턴으로 부분 문자열 검색
select * from tcity where name like '%천%';
select * from tcity where name not like '%천%';
select * from tcity where trim(name) like '%천'; -- trim : 불필요한 공백 제거

-- between : between 최소값 and 최대값, 시작과 끝 값 포함, 연속된 범위만 검색 가능
select * from tcity where popu between 50 and 100;
-- 면적 500 ~ 1000 사이의 도시 검색
select * from tcity where area between 500 and 1000;

-- in : 불연속적인 값 여러 개의 목록과 일치하는 레코드 검색
select * from tcity where region in ('경상','전라');
select * from tcity where region not in ('경상','전라');

-- 5장. 데이터 집계
-- 5. 도시 목록에서 지역별 인구수 조회
select region, sum(popu) as '지역별 인구수' from tcity group by region;
-- 6. 각 지역에서 가장 넓은 면적을 구하되, 인구가 50만 이상인 도시만 대상으로 함
select * from tcity where popu >= 50 group by region having max(area);
-- 7. 각 지역별 평균 면적을 구하되 평균 면적이 1000 이상인 지역만 출력
select region, avg(area) as '지역별 평균 면적' from tcity group by region having avg(area) >= 1000;

-- 6장. 데이터 관리
-- 1. 도시 목록에 용인 삽입하라. 면적 293에 인구 98만이되 데이터는 임의의값을 써도 무관
insert into tcity values ('용인',293,98,'y','경기');
-- 3. 도시 목록에 이천(461km,21만)과 대구(883km,248만), 영월(1127km, 4만) 삽입
insert into tcity values ('이천',461,21,'n','경기'), ('대구',883,248,'y','경상'), ('영월',1127,4,'n','강원');
