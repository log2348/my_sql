
-- AND 와 OR

select *
from membertbl;

select *
from producttbl;

desc producttbl;

INSERT INTO producttbl
VALUES(
	1,
	'세탁기',
	10,
	20220502,
	'LG',
	10
);

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

-- drop membertbl;

CREATE TABLE membertbl(
	memberId CHAR(8) NOT NULL,
	memberName CHAR(5) NOT NULL,
	memberAddress CHAR(20),
	PRIMARY KEY(memberId)
);

INSERT INTO membertbl VALUES("Dang", "탕탕이", "경기도 부천시");
INSERT INTO membertbl VALUES("Han", "한주연", "부산시 해운대구");
INSERT INTO membertbl (memberAddress, memberName, memberId) VALUES("서울시 상암동", "지운이", "jee");
INSERT INTO membertbl(memberId) VALUES("Han222");
INSERT INTO membertbl(memberId, memberName) VALUES("key2", "홍길삼");


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

insert into membertbl values('jsa', '김주한', '부산시 진구');

-- 이름 홍길동, 주소가 부산시 진구
select *
from membertbl
where memberName = '홍길동'
and memberAddress = '부산시 진구';

-- 주소가 부산시 진구 or 경기도 부천시
-- 공백까지 일치해야 검색됨
select *
from membertbl
where memberAddress = '부산시 진구'
or memberAddress = '경기도 부천시';

-- 주소가 (부산시 진구 or 경기도 부천시) and 이름이 김주한
select *
from membertbl
where (memberAddress = '부산시 진구' or memberAddress = '경기도 부천시') and memberName = '김주한';

-- 샘플 데이터 생성
create table memberCart(
	id int not null auto_increment,
    name varchar(30) not null,
    amount int not null,
    primary key(id)
);

desc memberCart;
select * from memberCart;

-- 테이블에 컬럼 추가
alter table memberCart add productName varchar(30) not null;

-- 테이블에 컬럼명을 수정해보자
alter table memberCart rename column name to name2;

-- 테이블에 컬럼명을 삭제해보자
alter table memberCart drop column name2;

-- 테이블 이름 변경하기
rename table memberCart to myCart;
alter table mycart rename shopCart;

select * from myCart;
select * from shopCart;

-- 데이터 입력
insert into shopCart values(1, 1, '청바지');

-- 기본 전략 : auto_increment() - 입력할때마다 자동으로 1씩 증가하며 값 넣어줌
-- pk 입력 하지 않아도 오류 발생하지 않음
insert into shopCart(amount, productName) values(2, '운동화');
insert into shopCart(amount, productName) values(12, '블레이저');
insert into shopCart(amount, productName) values(3, '스마트폰');
insert into shopCart(amount, productName) values(5, '지갑');

desc shopCart;

-- BETWEEN A AND B ( A 이상 B 이하 )
select *
from shopcart
where amount between 2 and 5;
