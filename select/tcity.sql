SELECT * FROM tcity;

select name, popu from tcity;
select region, name, area from tcity;

-- 별칭 큰 따옴표("") 사용
select name as "도시명", area as "면적(제곱Km)", popu as "인구(만명)" from tcity;
select name as "도시", popu as "인구(만명)", region as "지역" from tcity;

-- 계산값 출력
select name, popu * 10000 as "인구(명)" from tcity;
select name, area, popu, popu * 10000 / area as "인구밀도" from tcity;

-- 더미데이터
select 60 * 60 * 24 as "하루" from dual;
select 60 * 60 * 24 * 365 as "1년" from dual;

-- where 작은 따옴표('') 사용
-- sql 구문은 대소문자를 가리지 않지만, 필드안에 저장된 값은 대소문자 구분함
select name, area from tcity where area > 1000;
select * from tcity where name = '서울';
select * from tcity where metro = 'y';
-- 1. 인구가 10만명 미만인 도시의 이름 출력
select name as "도시", popu * 10000 as "인구(명)" from tcity where popu < 10;
-- 2. 전라도에 있는 도시의 정보 출력
select * from tcity where region = '전라';

-- null



