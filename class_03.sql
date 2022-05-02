--- userTBL. buyTBL 만들기

USE shopdb;

-- 고객 테이블 생성
CREATE TABLE userTBL(
	userName CHAR(3) NOT NULL,
	birthYear INT NOT NULL,
	addr CHAR(2) NOT NULL,
	mobile CHAR(12),
	PRIMARY KEY(userName)
);

-- 필드 수정, 컬럼 수정
ALTER TABLE usertbl MODIFY mobile CHAR(13);

-- 테이블 정보
DESC usertbl;

DELETE FROM buytbl;

-- 구매 테이블 생성 (fk)

CREATE TABLE buytbl(
	userName CHAR(3) NOT NULL,
	prodName CHAR(3) NOT NULL,
	price INT NOT NULL,
	amount INT NOT NULL,
	FOREIGN KEY(userName) REFERENCES usertbl(userName)
);

DESC buytbl;
ALTER TABLE buytbl convert to charset UTF8;
ALTER TABLE usertbl convert to charset UTF8;

--- usertbl 데이터 입력하기
INSERT INTO usertbl
VALUES
(
	'이승기',
	1987,
	'서울',
	'010-1234-1234'
);

INSERT INTO usertbl
VALUES
(
	'홍길동',
	1911,
	'부산',
	'010-2222-2222'
);

INSERT INTO usertbl
VALUES
(
	'이순신',
	1999,
	'대구',
	'010-3333-3333'
);

SELECT *
FROM usertbl;

-- 구매 테이블 데이터 입력
/** 오류 구문
INSERT INTO
	buytbl
VALUES
(
	'이승기2',
	'운동화',
	50,
	1
);
**/

INSERT INTO
	buytbl
VALUES
(
	'이승기',
	'운동화',
	50,
	1
);

INSERT INTO
	buytbl
VALUES
(
	'이승기',
	'노트북',
	150,
	1
);

INSERT INTO
	buytbl
VALUES
(
	'홍길동',
	'모니터',
	10,
	1
);

INSERT INTO
	buytbl
VALUES
(
	'홍길동',
	'모니터',
	200,
	2
);

INSERT INTO
	buytbl
VALUES
(
	'이순신',
	'청바지',
	40,
	1
);

INSERT INTO
	buytbl
VALUES
(
	'이순신',
	'책',
	10,
	3
);

SELECT * FROM buytbl;