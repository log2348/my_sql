
USE shopdb;

-- SHOW DATABASES;

CREATE TABLE membertbl_1(
	memberid CHAR(8) NOT NULL,
	membername CHAR(10)
);

SELECT * FROM membertbl_1;

-- 데이터 베이스를 생성하는 구문
CREATE DATABASE shopdb_1;

-- 데이터 베이스를 삭제하는 구문
-- DROP DATABASE shopdb_1;

-- 테이블을 생성하는 구문
CREATE TABLE 테이블명(
	필드면 필드타입,
	필드명 필드타입,
	PRIMARY KEY(필드명)
);

-- 테이블 삭제 방법
-- DROP TABLE membertbl_1;

-- membertbl 테이블 생성
-- ID는 유일해야하기 때문에 Primary Key로 지정
CREATE TABLE membertbl(
	memberId CHAR(8) NOT NULL,
	memberName CHAR(5) NOT NULL,
	memberAddress CHAR(20),
	PRIMARY KEY(memberId)
);

-- SELECT 구문
SELECT * FROM membertbl;

-- 테이블 구조 확인 방법
DESC membertbl;

-- 테이블 만들기 2
CREATE TABLE productTBL(
	productId INT NOT NULL,
	productName CHAR(4) NOT NULL,
	cost INT NOT NULL,
	MAKEDATE DATE,
	company CHAR(5),
	amount INT,
	PRIMARY KEY(productId)
);

SELECT * FROM producttbl;

-- 테이블 더 자세하게 조회하고 싶다면
DESC producttbl;


