SELECT * FROM tcity;

select name, popu from tcity;
select region, name, area from tcity;

-- 별칭
select name as "도시명", area as "면적(제곱Km)", popu as "인구(만명)" from tcity;
select name as "도시", popu as "인구(만명)", region as "지역" from tcity;

-- 계산값 출력
select name, popu * 10000 as "인구(명)" from tcity;
select name, area, popu, popu * 10000 / area as "인구밀도" from tcity;

-- 더미데이터
select 60 * 60 * 24 as "하루" from dual;
select 60 * 60 * 24 * 365 "1년" from dual;
