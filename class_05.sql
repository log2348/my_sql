-- my sql function

-- MYSQL String Function
select ascii('b'); -- 아스키 코드 출력하는 내장함수
select char_length('MY SQL TEST') as 문자길이; -- 공백도 글자수에 포함
select char_length('홍길동') as 이름;
select concat('boot', 'class', '100%') as class_name; -- 문자열 더해줌
select concat_ws('->', 'boot', 'class', '100%') as class_name; -- 문자 연결시 구분자값 지정
-- 문자열 목록 내에서 q를 검색할 수 있다
select find_in_set('q', 's,q,l'); -- 문자열이 몇번째에 위치하는지 출력(없다면 0 출력)

select format(250500.5634, 2);
-- 숫자 형식은 '#.##.##.##'(소수점 2자리 반올림)으로 지정한다.

select lcase('HELLO JAVA'); -- 소문자로 변환
select ucase('hello java'); -- 대문자로 변환
select trim('    M Y S Q L  '); -- 앞뒤 공백 제거
select replace('     aaa 11     ', ' ', ''); -- (문자열, 대체될 문자열, 대체할 문자열)

-- inner join
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount, char_length(a.userName)
from userTbl as a
inner join buyTbl as b
on a.userName = b.userName;

-- JOIN과 문자열 내장함수 문제
select * from usertbl;
select * from buytbl;

-- usertbl 기준으로 buytbl과 공통되는 userName 출력하고, 글자수 반환하기
select u.userName, char_length(u.userName)
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

select u.userName, char_length(u.userName)
from buytbl as b
right join usertbl as u
on u.userName = b.userName;

-- usertbl 기준으로 right join 하고 userName과 prodName 문자열 이어붙여 출력하기
select u.userName, concat(u.userName, b.prodName)
from buytbl as b
right join usertbl as u
on u.userName = b.userName;

-- usertbl기준으로 buytbl left join한다.
-- mobile에서 -빼고 조회
select a.userName, a.birthYear, a.addr, replace(a.mobile, '-', ''), b.prodName, b.price, b.amount
from usertbl as a
left join buytbl as b
on a.userName = b.userName;

-- 50 이상 구매한 고객의 이름과 사용 금액을 보여주세요
select a.userName, (b.price * b.amount) as total
from usertbl as a
inner join buytbl as b
on a.username = b.username
where b.price > 50;

-- '누가 구매한 상품명' 으로 리스트를 만들고, 가격과 수량 조회하기
select concat_ws('가 구매한', u.userName, b.prodName) as 'list', b.amount, b.price
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

select u.userName, u.mobile, b.price, b.amount, char_length(u.mobile)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;
