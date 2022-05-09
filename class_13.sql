-- 서브쿼리 2

use employees;
select * from employees;
select * from dept_emp; -- employees와 dept_emp의 연관관계(1:1, 1:N, N:M) -> 1 : N
desc dept_emp;
desc employees;

select * from departments order by dept_no; -- departments vs dept_emp ( 1 : N )
desc departments;

select * from dept_manager;
select * from titles;
select * from salaries;

select *, dept_no as '뽑아야 하는 값'
from departments as A
where A.dept_name = 'development';

-- 문제 1(중첩 서브쿼리)
-- dept_emp 테이블에서 development인 emp_no 필드와 dept_no를 출력
select A.emp_no, A.dept_no
from dept_emp as A
where A.dept_no = (
				select dept_no
                from departments
                where dept_name = 'development'
                );

-- 문제 2(중첩 서브쿼리)
-- employees 테이블에서 현재 development 매니저인 직원만 출력
select *
from employees as A
where A.emp_no = (select emp_no
				from dept_manager
                where to_date = '9999-01-01'
                and dept_no = 'd005');
 -- 단일행 결과 집합 나와서 외부 쿼리인 emp_no 조건식으로 처리가 된다.
 
select *
from employees as A
where A.emp_no = (select emp_no
				from dept_manager
                where to_date = '9999-01-01'
                and dept_no = (select dept_no
								from departments
                                where dept_name = 'development')
                                );
/*
	다중 행 서브쿼리
    결과값이 2건 이상 출력되는 것을 말한다. 다중 행 서브쿼리는 쿼리의 결과가 여러 건 출력되기 때문에
    단일행 연산자를 사용할 수 없다.
    별도의 연산자를 사용해야 한다. (in)
*/

select * from titles;

-- join
select a.emp_no, a.first_name, b.title
from employees as a
inner join titles as b
on a.emp_no = b.emp_no;

-- 인라인 뷰로 결과 출력하기

-- MySQL 전용 문법
select a.emp_no, a.first_name, b.title
from employees as a, (select * from titles) as b
where a.emp_no = b.emp_no;

-- 문제 1
-- 직원 테이블에서 부서 팀장만 출력 하시오 (join 사용, 단 현재 근무중인 사람만 출력)
select *
from employees as a
inner join dept_manager as b
on a.emp_no = b.emp_no
where b.to_date = '9999-01-01';

-- 인라인 뷰로 출력
select *
from employees as a, (select *
						from dept_manager
							where to_date = '9999-01-01') as b
where a.emp_no = b.emp_no;

-- 스칼라 서브쿼리 (select 절에 사용하는 서브쿼리)
-- select 절에 서브쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적
-- join의 대체 표현식으로 자주 사용하지만 성능 면에서 좋은 편은 아니다.

-- 단일행 사용해야 한다
select *, (select dept_name
			from departments as b
            where a.dept_no = b.dept_no) as 부서명
from dept_manager as a
where to_date = '9999-01-01';

-- 스칼라 서브쿼리 사용해서 결과 출력
-- 문제 employees 테이블 emp_no, first_name (타이틀명)

select * from employees;
select * from titles;

-- 단일행으로 변경해야 한다. (title 중복됨)
select a.emp_no, a.first_name, (select b.title
								from titles as b
								where a.emp_no = b.emp_no
                                group by emp_no) as 직함
from employees as a;

select * from salaries;
select * from titles;

-- 중첩 서브쿼리
-- 직함이 Senior Enginner인 직원 정보 출력
select *
from employees as a
where emp_no in (select emp_no
				from titles as b
                where title = 'Senior Engineer');

-- 최고 연봉을 받는 직원의 정보 출력                
select *
from employees as e
where e.emp_no in (
					select emp_no
                    from salaries as s
                    where salary = (select max(salary) from salaries)
                    );
                    
-- 현재 'd003' 부서에서 근무 중인 직원 조회
select *
from employees
where emp_no in (select emp_no
				from dept_emp
                where dept_no = 'd003'
                and to_date = '9999-01-01');
                
-- 인라인 뷰
-- d001 부서의 역대 매니저 출력
select a.emp_no, a.first_name, b.dept_no
from employees as a, (select *
						from dept_manager
                        where dept_no = 'd001') as b
where a.emp_no = b.emp_no;

-- 직함이 Engineer인 직원 정보 출력
select a.emp_no, a.first_name, b.title
from employees as a, (select *
						from titles
						where title = 'Engineer') as b
where a.emp_no = b.emp_no;

-- 최고 연봉을 받는 직원의 정보 출력
select *
from employees as e
where e.emp_no in (
					select emp_no
                    from salaries as s
                    where salary = (select max(salary) from salaries)
                    );
                        
select * from titles;

-- 스칼라 서브 쿼리
-- 각 직원들의 최고 연봉을 출력
select a.emp_no, a.first_name, (select max(salary)
								from salaries as b
								where a.emp_no = b.emp_no
								group by emp_no) as '최고 연봉'
from employees as a;

-- 부서 매니저들의 생년월일 조회
select d.dept_no, d.emp_no, (select e.birth_date
								from employees as e
                                where d.emp_no = e.emp_no) as '생년월일'
from dept_manager as d;
