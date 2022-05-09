/*
	서브쿼리(내부쿼리) - 1
    서브쿼리 종류
    : 서브쿼리는 쿼리의 위치가 어디에 있느냐에 따라서 총 세 가지 종류로 나눌 수 있다.
    1) 중첩 서브쿼리(Nested Subquery) : WHERE절에 사용하는 서브쿼리
    2) 인라인 뷰(inline view) : FROM절에 사용하는 서브쿼리
    3) 스칼라 서브쿼리(Scalar Subquery) : SELECT절에 사용하는 서브쿼리
    괄호로 반드시 감싸져있어야 한다.
 */
 
 -- db 생성
 create database reservationdb;
 use reservationdb;
 
 -- 테이블 생성(예약)
 create table reservation(
	id int auto_increment,
    name varchar(20) not null,
    reserveDate date not null,
    roomNum varchar(5) not null,
    primary key(id)
 );
 
 -- 고객 테이블
 create table customer(
	id int auto_increment,
    name varchar(20) not null,
    age int not null,
    address varchar(10),
    primary key(id)
 );
 
 -- 데이터 입력
insert into reservation values(1, '홍길동', '2020-05-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-05-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-05-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-05-04 00:00:00', 4);

select * from reservation;

-- 문제 : 데이터 수정
-- id 1번 roomNum 1001
-- id 2번 roomNum 1002
-- id 3번 roomNum 1003
-- id 4번 roomNum 1004

update reservation set roomNum = 1001 where id = 1;
update reservation set roomNum = 1002 where id = 2;
update reservation set roomNum = 1003 where id = 3;
update reservation set roomNum = 1004 where id = 4;

-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');

select * from customer;

-- 데이터 수정
update customer set address = '인천' where id = 2;
update customer set address = '수원' where id = 4;

select * from customer where address in ('서울');

/*
	서브쿼리의 특징
    
    서브쿼리의 장점(조인 대신 서브쿼리를 쓰는 이유)
    1. 서브쿼리는 쿼리를 구조화 시키므로 쿼리의 각 부분을 명확히 구분할 수 있게 해준다.
    2. 서브쿼리는 복잡한 JOIN이나 UNION과 같은 동작을 수행할 수 있는 또 다른 방법을 제공한다.
    3. 서브쿼리는 복잡한 JOIN이나 UNION보다 좀 더 읽기 편하다. (가독성 높임)
*/

-- 서브쿼리
-- 오류 구문
select id, reserveDate, roomNum, name
from reservation
where name in (select * from customer where address = '서울');

-- 주소가 서울인 고객들의 예약 정보를 확인하는 쿼리
-- 중첩 서브쿼리
select id, reserveDate, roomNum, name
from reservation
where name in (
				select name
                from customer
                where address = '서울'
                );
                
-- JOIN문으로 변경해서 같은 결과 출력하기
select r.id, r.reserveDate, r.roomNum, c.name
from reservation as r
left join customer as c
on r.name = c.name
where c.address = '서울';

select r.id, r.reserveDate, r.roomNum, c.name
from reservation as r
inner join customer as c
on r.name = c.name
where c.address = '서울';

-- FROM 절 서브쿼리(인라인 뷰)
select name, reservedRoom
from (select name, reserveDate, (roomNum) as reservedRoom
		from reservation
        where roomNum > 1001) as reservationInfo;
-- reservationInfo의 row에서 name, reservedRoom 출력

/*
	쿼리 실행 순서
    
    reservation 테이블에서 roomNum이 1001 보다 큰 레코드를 먼저 찾은 후에 roomNum 필드값 1씩 증가
    해당 쿼리에 결과 집합 reservationInfo 임시 테이블로 만들어 진다. (내부 쿼리, 서브쿼리)
    외부 쿼리에서는 이렇게 만들어진 임시 테이블에서 name, reservedRoom 필드만을 선택해서 결과 집합을 보여주게 된다.
*/

-- 서브쿼리 사용해서 문제 내기
-- 2020-05-02 일자로 예약한 고객의 id와 이름 조회하기
select id, name
from customer
where name in (
				select name
				from reservation
				where reserveDate = '2020-05-02'
                );

-- 서울에 거주하는 고객정보 출력
select *
from (select *
		from customer
			where address = '서울') as customerInfo;
           
-- 30대 고객의 예약 정보 출력
select name, age
from (
		select name, age
		from customer as c
        where c.age > 29 and age < 40) as customer_1;
        
-- 5/2 이후에 예약한 예약자 정보 확인
select *
from(
		select *
        from reservation
        where reserveDate > '2020-05-02'
        ) as reservationInfo;

