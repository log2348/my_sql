-- 검증하기

-- 서브쿼리
-- orderByHireDate()
SELECT *
FROM employees AS a 
LEFT JOIN dept_emp AS b 
ON a.emp_no = b.emp_no 
WHERE b.dept_no = (SELECT dept_no 
FROM departments
WHERE dept_name = 'Development')
ORDER BY a.hire_date DESC; 

select * from departments;
select * from titles;

-- showDeptEmpInfo()
SELECT * 
FROM employees AS a 
LEFT JOIN dept_emp AS b 
ON a.emp_no = b.emp_no 
WHERE b.dept_no = (SELECT dept_no 
FROM departments AS d 
WHERE dept_name = 'Development') 
AND to_date = '9999-01-01';

-- showPresentManagerInfo() 부서의 현재 매니저 정보 출력
SELECT * 
FROM employees AS a 
WHERE a.emp_no = (SELECT emp_no 
FROM dept_manager 
WHERE to_date = '9999-01-01' 
AND dept_no = (SELECT dept_no 
FROM departments 
WHERE dept_name = 'Finance')
);

-- showTitleEmpInfo()
SELECT *
FROM employees as a, (SELECT * 
FROM titles 
WHERE title = 'Senior Staff') AS b 
WHERE a.emp_no = b.emp_no;

-- getTitle()
SELECT *, (SELECT b.title
FROM titles AS b
WHERE a.emp_no = b.emp_no
GROUP BY emp_no) AS title
FROM employees AS a
WHERE a.first_name = 'Huan' AND a.last_name = 'Lortz';

-- showTitleEmpInfo() 
SELECT * 
FROM employees as a, (SELECT * 
						FROM titles 
						WHERE title = 'Senior Staff'
                        AND to_date = '9999-01-01') AS b 
WHERE a.emp_no = b.emp_no;

-- showManagerInfo()
SELECT * 
FROM employees AS a 
LEFT JOIN dept_manager AS b 
ON a.emp_no = b.emp_no 
WHERE b.dept_no = (SELECT dept_no
FROM departments 
WHERE dept_name = 'Finance'); 