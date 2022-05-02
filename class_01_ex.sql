
-- 문제 1 shopdb_1 데이터베이스를 생성
CREATE DATABASE shopdb_1;

-- 문제 2 membertbl 테이블 생성
CREATE TABLE membertbl(
	memberId CHAR(8) NOT NULL,
	memberName CHAR(5) NOT NULL,
	memberAddress CHAR(20),
	PRIMARY KEY(memberId)
);

-- 문제 3 producttbl 테이블 생성
CREATE TABLE producTBL(
	productId INT NOT NULL,
	productName CHAR(8) NOT NULL,
	cost INT NOT NULL,
	company CHAR(8),
	amount INT,
	PRIMARY KEY(productId)
);

-- 문제 4 (간단한  테이블 생성 필드 2개이상)
CREATE TABLE student(
	studentId INT NOT NULL,
	studentName CHAR(8) NOT NULL,
	classNumber CHAR(8) NOT NULL,
	PRIMARY KEY(studentId)
);


-- 문제 5 (간단한 테이블 생성 필드 3개이상 primary key 지정)
CREATE TABLE car(
	carNumber INT NOT NULL,
	model CHAR(10) NOT NULL,
	price INT,
	company CHAR(8),
	PRIMARY KEY(carNumber)
);