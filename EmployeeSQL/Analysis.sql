--1
SELECT 
    employees.emp_no AS employee_num, 
    employees.last_name, 
    employees.first_name, 
    employees.sex, 
    salaries.salary
FROM 
    employees AS employees
LEFT JOIN salaries AS salaries ON employees.emp_no = salaries.emp_no;

--2 
CREATE TABLE FIRSTEmployees AS
SELECT
    first_name,
    last_name,
    hire_date,
    EXTRACT(YEAR FROM hire_date) AS Year
FROM
    employees;
SELECT * FROM  FIRSTEmployees WHERE Year = 1986

--3
SELECT 
    emp.last_name, emp.first_name, 
	deptm.dept_no AS department_number, 
    deptm.emp_no as employee_number,
	dep.dept_name AS department_name
FROM 
    dept_manager AS deptm
LEFT JOIN employees AS emp ON deptm.emp_no = emp.emp_no
LEFT JOIN departments AS dep ON deptm.dept_no = dep.dept_no;

--4
SELECT 
	de.dept_no as department_num, 
	emp.emp_no as employee_num, 
	emp.last_name, 
	emp.first_name, 
	dep.dept_name
FROM 
	employees AS emp
LEFT JOIN dept_emp AS de ON emp.emp_no = de.emp_no
LEFT JOIN departments AS dep ON de.dept_no = dep.dept_no;

--5
SELECT 
    last_name, 
    first_name, 
    sex
FROM 
employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6
SELECT 
	emp_no AS employee_num, 
	last_name, 
	first_name
FROM 
	employees
WHERE 
	emp_no IN(
	SELECT 
		emp_no
	FROM 
		dept_emp
	WHERE 
		dept_no IN(
		SELECT 
			dept_no
		FROM 
			departments
		WHERE 
			dept_name = 'Sales'));

--7
SELECT 
    de.emp_no, 
    emp.last_name, 
    emp.first_name, 
    dep.dept_name
FROM 
    employees AS emp
LEFT JOIN dept_emp AS de ON emp.emp_no = de.emp_no
LEFT JOIN departments AS dep ON de.dept_no = dep.dept_no
WHERE 
    dept_name = 'Sales' 
OR 
    dept_name = 'Development';

--8
SELECT last_name, COUNT(*) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
