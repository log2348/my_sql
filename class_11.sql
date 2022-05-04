use employees;

-- 검색에 제한
select * from employees limit 10;
show full tables;

desc employees;

select gender, count(gender)
from employees
group by gender;

-- 그룹함수, 그룹바이, having 절

/**
	GROUP BY 절
	GROUP BY절은 데이터들을 원하는 그룹으로 나눌 수 있다.
	나누고자 하는 그룹의 컬럼명을 SELECT절과 GROUP BY 절 뒤에 추가하면 된다.
	집계 함수와 함께 사용되는 상수는 그룹바이 절에 추가하지 않아도 된다.(많이 실수하는 부분)
**/

/**
	DISTINCT와 GROUP BY 절
    DISTINCT는 주로 중복을 제거하기 위해서 사용한다.
    GROUP BY는 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다.
    하지만 두 작업은 조금만 생각해보면 동일한 형태의 작업이라는 것을 쉽게 알 수 있고,
    일부 작업의 경우 distinct로 동시에 처리할 수도 있다.
**/

/**
	HAVING 절
    WHERE절에서는 집계함수를 사용할 수 없다.
    HAVING절은 집계함수를 가지고 조건을 비교할 때 사용한다.
    GROUP BY절과 함께 사용된다.
**/

use employees;

show tables;

select * from departments;
select * from dept_emp; -- 외래키
select * from dept_manager; -- 매니저 정보
select * from employees;
select * from salaries;
select * from titles;

-- 합계 함수
-- 문제 1. 전체 직원 수(전체 직원 수), 제일 먼저 입사한 일자(최초 고용 일자), 제일 마지막 입사일자(가장 최근 고용일자)
select count(*) as '전체 직원 수', min(hire_date) as '최초 고용 일자', max(hire_date) as '가장 최근 고용일자'
from employees;

-- 문제 2. gender로 그룹핑
select *
from employees
group by gender;

-- 문제 3. 남성, 여성 수와 gender를 표시 하세요
select gender, count(*)
from employees
group by gender;

-- 문제 4. 고용일자로 그룹화
select hire_date as '고용 일자', count(hire_date) as '인원'
from employees
group by hire_date;

-- 문제 5. hire_date가 같은 직원의 인원수를 표시하시오
-- 전체, as 동기
select *, count(emp_no) as 동기
from employees
group by hire_date;

-- 문제 6. 위 쿼리에서 남성과 여성을 구분해서 결과값을 구하시오
select *, count(emp_no) as 동기
from employees
group by hire_date, gender
order by hire_date desc;

select * from salaries;
desc salaries;

-- 급여 테이블의 총 건수, 총 급여, 평균 급여(소수점 둘째자리까지), 최고 연봉자 금액, 최소 연봉자 금액
select count(*) as '총 건수',
	sum(salary) as '총 급여',
    round(avg(salary), 2) as '평균 급여',
    max(salary) as '최고 연봉',
    min(salary) as '최소 연봉'
from salaries;

-- 데이터 검증(그룹핑시 예상치 못한 결과 나올 수 있음)
select max(salary) from salaries;

-- having절 연습
-- 연봉을 10번 이상 받은 직원들을 출력하시오
select *, count(emp_no) as '횟수'
from salaries
group by emp_no
having count(emp_no) >= 10
order by emp_no asc
limit 30;

-- 문제
select * from titles;
select count(*) from titles;

-- 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력 하시오
select title, count(title)
from titles
group by title
having count(title) >= 100000;

-- 5만명 이상 근무하고 있는 부서의 부서번호와 부서 소속 사원의 수를 출력하시오
select *, count(*)
from dept_emp
group by dept_no
having count(dept_no) >= 50000;

select * from dept_emp;
-- 현재 근무중인 사람을 출력하시오
select *
from dept_emp
where to_date = '9999-01-01';

-- 각 부서별 과거에 매니저를 했던 사람의 수를 구하시오 (퇴사자)
-- !=, <>
select * from dept_manager;
select count(*)
from dept_manager
where to_date <> '9999-01-01';

-- 그룹함수, 그룹바이, having절 + join
select * from employees;
select * from dept_emp;

-- 부서별로 입사 날짜가 가장 빠른 직원번호 출력하고 부서번호 기준으로 오름차순 정렬
select b.dept_no, a.emp_no, a.hire_date
from employees a
inner join dept_emp b
on a.emp_no = b.emp_no
group by b.dept_no
having min(a.hire_date)
order by b.dept_no;

select emp_no, hire_date
from employees
group by emp_no;

select * from departments
order by dept_no;

-- 5만명 이상의 직원이 있는 부서이름 출력
select count(a.dept_no), b.dept_name
from dept_emp a
inner join departments b
on a.dept_no = b.dept_no
group by b.dept_name
having count(a.dept_no) >= 50000;