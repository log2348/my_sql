create database shop_db;
use shop_db;

-- use 사용 안 하고 데이터베이스 지정해서 테이블 생성
create table shop_db.product(
	id tinyint not null,
    p_name varchar(30) not null,
    created date,
    company varchar(30)
);

-- index(색인) : create index(UNIQUE INDEX)
create index idx_product_name
on product (p_name);

-- 가상 테이블 (뷰 테이블)
select * from product;

-- 데이터 생성
insert into product values(1, '세탁기', '2020-12-12', '삼성');
insert into product values(2, '냉장고', now(), 'LG'); -- now() 경고표시
insert into product values(3, '모니터', curdate(), '삼성');
insert into product values(4, '컴퓨터', curdate(), '삼성');

desc product;

-- 컬럼 추가하기
alter table product add input_time timestamp;

/**
보여주고 싶은 컬럼만 보여줄 때
가상 테이블 생성하기
정확하게는 테이블이 아니라 참조해서 필요한 부분만 보여주는 것
**/
create view product_view
as select p_name, created, company
from product;

select * from product_view;
select * from product;

-- 뷰테이블에서 삭제하면 참조하고 있는 테이블에도 영향 --> 계정에 삭제권한을 주지 않으면 됨
delete from product_view where p_name = '컴퓨터';

-- drop database shop_db;

show databases;

-- index 조회하는 방법
show index from product;

-- index 수정하는 방법
-- alter table product

-- 인덱스 삭제
alter table product
drop index idx_product_name;

-- 테이블 복사
select * from product;

create table product_2 select * from product;
select * from product_2;

-- 집계 함수
-- GROUP BY
use shopdb;

select * from buytbl;

-- GROUP BY
select userName
from buytbl
group by userName;

select *
from buytbl
group by price;

select *
from buytbl
group by amount;

-- 이름으로 묶고 amount 2보다 큰 사람들을 출력하기
select *
from buytbl
where amount > 2
group by userName;

-- 집계 함수 : 여러 행 또는 테이블 전체 행으로부터 하나의 결과 값을 반환하는 함수
-- count(*) 총 row 수
select count(*) as 판매횟수
from buytbl;

select userName, sum(price) as '구매금액'
from buytbl;

-- 집계 함수와 group by
select userName, sum(price) as '구매금액'
from buytbl
group by userName;

-- 문제
use shopdb;
-- select * from product;
select * from usertbl;
select * from buytbl;
select * from producttbl;

-- buytbl에서 제품별 판매량 구하기
select prodName as 제품명, count(prodName) as 판매량 from buytbl
group by prodName;

-- shopdb의 usertbl 뷰테이블 생성하고, 90년대생 인원 출력하기
create table usertbl_view2 select * from usertbl;
select * from usertbl_view2;

select count(*) as '90년대생 인원'
from usertbl_view2
where birthYear < 2000;

-- 유저당 평균 구매 횟수
select userName '고객명', round(avg(amount), 0) '평균 구매 횟수'
from buytbl
group by userName;
