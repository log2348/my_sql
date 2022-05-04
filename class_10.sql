
-- MySQL 계정 생성 및 권한 관리

-- 사용자 계정 확인
show databases;
use mysql;

-- % 외부에서 접근 가능
-- localhost 내 컴퓨터
select host, user from user;

-- 1. 사용자 추가 및 권한 세팅 (첫번째 방법)
create user tester1@localhost identified by 'asd123';
-- drop user tester1@lcoalhost;
grant select, insert, update, delete on shop_db.* to 'tester1'@'localhost';

-- MySQL 8에서 계정 생성 방법

-- 2. 모든 DB에 권한 할당, localhost만 접근 허용 (두번째 방법)
create user tester2@localhost identified by 'asd123';
grant all privileges on *.* to 'tester2'@'localhost' with grant option;
flush privileges;

-- 3. 외부 접속 허용 계정
create user tester3@'%' identified by 'asd123';
grant all privileges on *.* to tester3@'%' with grant option;

-- 4. 계정 삭제 방법
drop user 'tester3'@'%';
drop user 'tester2'@'localhost';

-- DB에 만들어진 모든 테이블 확인
use shopdb;

show full tables;
show tables;

-- 뷰 생성
create view usertbl_view as select userName, birthYear, addr from usertbl;
select * from usertbl_view;

use mysql;
select * from user;

create user tencoding@'%' identified by 'asd123';
grant select on shopdb.usertbl_view to 'tencoding'@'%';

-- 문제
-- 외부에서 접근할 수 있는 korea_it 계정 생성하고 shopdb의 producttbl 테이블 조회할 수 있는 권한 부여하기
create user 'korea_it'@'%' identified by 'asd123';
grant select on shopdb.producttbl to 'korea_it'@'%';
use mysql;
select host, user from user;


