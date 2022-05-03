
-- MYSQL Numberic Function

-- 절대값
select abs(-252.2);

select * from buytbl;

-- 합계
select *, sum(price) as 합계
from buytbl; -- 총 합계와 첫번째 행 출력

select sum(price) as 합계
from buytbl;

-- 서브 쿼리 (3가지)
select *, (select sum(price) from buytbl) as 총합계
from buytbl;

-- 평균값
select *, avg(price) as 평균
from buytbl;

-- 서브쿼리
-- 연산속도 늦어질 수 있음
select *, (select avg(price) from buytbl) as 평균
from buytbl;

-- 올림
select ceil(25.12);

-- 반올림
select round(135.523);
select round(135.523, 2); -- 소수점 자릿수 지정

-- 버림
select floor(25.81);

select ceil(round(10 - 5) + 5);

-- max 값
select max(price)
from buytbl;

-- min 값
select min(price)
from buytbl;

select count(userName)
from usertbl;

-- 문제
-- '이승기' 고객이 구매한 제품 가격의 평균 출력하기 (buytbl 사용)
select avg(price)
from buytbl
where userName = '이승기';

desc buytbl;
show databases;

show tables;
show table status;

-- 연습 문제
-- 가격의 평균을 구하고 반올림하기
select round(avg(price)) as 가격평균
from buytbl;

-- buytbl에서 가장 비싼 값과 가장 저렴한 값을 조회하고, 가격의 평균값을 반올림하기
select max(price) as 최고금액, min(price) as 최저금액, round(avg(price)) as 평균금액
from buytbl;

-- 판매실적 및 총합
select *, (price * amount) as 판매실적, (select sum(price) from buytbl) as 총합계
from buytbl;

-- buytbl에서 총 매출과 전체 평균을 구하세요 평균은 1의 자리에서 반올림 해주세요
select sum(amount * price) as '총 매출', round(avg(amount * price), 1) as '전체 평균'
from buytbl;

-- usertbl에서 최대 출생년도와 최저 출생년도 뽑아내기
select max(birthYear) as maxYear, min(birthYear) as minYear
from usertbl;

-- buytbl에서 구매한 상품의 평균값 구하기(집계함수)
select b.*,
(select avg((price * amount) / amount ) from buytbl where prodName = b.prodName) as '개당 평균' 
from buytbl as b;

