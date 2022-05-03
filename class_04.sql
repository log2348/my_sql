CREATE DATABASE shopdb;

use shopdb;

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

-- inner join 1
select *
from userTbl
inner join buytbl
on userTbl.userName = buyTbl.userName;

-- inner join 2
-- Alias AS 별칭 (코드 구문 안에서 사용하는 별칭)
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount
from userTbl as a
inner join buyTbl as b
on a.userName = b.userName;

-- LEFT JOIN 1
-- usertbl 기준
select *
from usertbl as u
left join buyTbl as b
on u.userName = b.userName;

-- userTBL 고객 등록
select * from userTBL;
insert into userTbl values('야스오', 2000, '여수', '010-1234-1234');

-- LEFT JOIN 2 (LEFT OUTER JOIN)
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is not null;

/**
 구매 테이블 생성할 때 외래키에 대한 제약을 생성했기 때문에 오류 발생
 구매 테이블을 생성할 때 외래키(FK) 제약하지 않았다면 insert는 가능하다.
**/
insert into buytbl values('티모', '컴퓨터', 100, 1); -- 오류 구문

-- LEFT JOIN 3
-- buytbl 기준
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName;

-- LEFT JOIN 4
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName
where u.userName is not null;

-- RIGHT JOIN 1
-- buytbl 기준으로 usertbl 정보 들고옴
select u.userName, b.prodName, b.price, b.amount
from userTbl as u
right join buyTbl as b
on u.userName = b.userName;

-- 곱집합 CROSS JOIN 1
select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName;

-- 곱집합 CROSS JOIN 2
select *
from usertbl
cross join buytbl
on usertbl.userName = buytbl.userName
where usertbl.userName is null
or buytbl.userName is null;
