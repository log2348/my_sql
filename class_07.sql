
-- MySQL Date Function

-- 현재 날짜 출력(년, 월, 일)
select curdate();
select current_date();

-- 현재 시간 출력(시, 분, 초)
select curtime();
select current_time();

-- 일자 반환
select day('2017-06-15');
select day(curdate());

-- week(date, mode)
-- 주 번호 출력
select week('2017-06-15');
select week(curdate());

-- 월 0, 화 1, 수 2, ...
select weekday('2017-06-15');
select weekday(curdate());

-- 년, 월, 일, 시, 분, 초
select now();
select sysdate();

-- 인수에 따라서 datetime 값을 반환한다.
select timestamp('2017-06-15', '13:10:11');

-- 시간 차
select timediff('13:10:11', '13:10:10');
select timediff('2022-05-03 13:10:11', '2022-01-03 13:10:10');
select timediff(now(), '2021-01-03 13:10:10');

select datediff(curdate(), '2022-05-05');

-- 날짜 더하기/빼기
select subdate(now(), interval 10 day); -- 오늘 날짜에서 10일 빼기
select date_add(sysdate(), interval 10 day); -- 오늘 날짜에서 10일 더하기

-- 그 외 내장함수

-- 현재 시스템 유저
select system_user();
select session_user();
select current_user();

-- 현재 사용 중인 버전
select version();

-- null값일 때 null 대신 보여줄 값
select nullif('x', null);

-- 현재부터 어린이날까지 남은 시간 구하기
select timediff(curdate(), '2022-05-05');

-- 기념일 언제인지 출력해보기 ( 100일, 200일, 1000일 등)
select date_add(current_date(), interval 100 day);

select weekday('2022-08-08');

select now() as 현재, timestamp('2022-05-05') as 어린이날, timediff(now(), '2022-05-05 00:00:00') as 남은시간;