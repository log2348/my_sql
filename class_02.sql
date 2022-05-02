-- CRUD

-- 데이터 생성 insert
DESC membertbl;

-- 인코딩
ALTER TABLE membertbl convert to charset utf8;

INSERT INTO membertbl VALUES("Dang", "탕탕이", "경기도 부천시");
INSERT INTO membertbl VALUES("Han", "한주연", "부산시 해운대구");
INSERT INTO membertbl (memberAddress, memberName, memberId) VALUES("서울시 상암동", "지운이", "jee");

-- 오류 구문 (membertbl에 memberId, memberName 필드명이 not null로 설계했기 때문이다)
INSERT INTO membertbl(memberId) VALUES("Han222");
INSERT INTO membertbl(memberId, memberName) VALUES("key2", "홍길삼");


-- 전체 테이블에 대한 데이터 조회
SELECT * FROM membertbl;

-- 한 건에 대한 데이터 조회를 어떻게 할까? (조건 WHERE 절)
SELECT * FROM membertbl WHERE memberId = 'jee';

-- 한 건에 대한 조회 + 조건절
SELECT memberName
FROM membertbl
WHERE memberId = 'jee';

-- 한 건에 대한 데이터 삭제
DELETE FROM membertbl WHERE memberId = 'key2';

-- 전체에 대한 데이터 삭제 구문
DELETE FROM membertbl;

TRUNCATE membertbl;

-- 한 건에 대한 데이터 수정
UPDATE membertbl SET memberName = '홍길동' WHERE memberId = 'jee';

-- 전체 데이터에 대한 값 수정(WHERE절 작성 안 하면 모든 건 수정됨)
UPDATE membertbl SET memberAddress = '';

--------------------------------------------------------------------
DESC producttbl;
ALTER TABLE producttbl convert to charset UTF8;
SELECT * FROM producttbl;

-- 문제 1 producttbl 데이터를 3건 입력해주세요
INSERT INTO producttbl
VALUES(
	1,
	'세탁기',
	10,
	20220502,
	'LG',
	10
);

DELETE FROM producttbl;

-- 불필요한 컬럼 삭제하는 방법
ALTER TABLE
	producttbl
DROP
	MAKEDATE;

-- 문제 2 검색
INSERT INTO
	producttbl
VALUES
(
	2,
	'컴퓨터',
	90,
	'삼성',
	2
);

INSERT INTO
	producttbl
VALUES
(
	3,
	'냉장고',
	10,
	'LG',
	100
);

SELECT
	company
FROM
	producttbl
WHERE
	productName = '냉장고';


-- 문제 3 수정
UPDATE
	producttbl
SET
	productName = '노트북'
WHERE
	productName = '컴퓨터';

-- 문제 4 삭제
DELETE
FROM
	producttbl
WHERE
	productName = '세탁기';

UPDATE
	producttbl
SET
	productName = 'TV'
WHERE
	productName = '냉장고';