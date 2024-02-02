-- Create tables for employee data
CREATE TABLE departments (
    dept_no CHAR(30) NOT NULL,
    dept_name VARCHAR(70) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(70) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE dept_manager (
    dept_no CHAR(70) NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title CHAR(15) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(70) NOT NULL,
    last_name VARCHAR(70) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE titles (
    title_id CHAR(30) NOT NULL,
    title VARCHAR(70) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        dept_no
    )
);
-- Add foreign keys for tables
ALTER TABLE dept_emp ADD CONSTRAINT "fk_dept_emp_empno" FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT "fk_dept_emp_deptno" FOREIGN KEY(dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT "fk_dept_manager_empno" FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_manager ADD CONSTRAINT "fk_dept_manager_deptno" FOREIGN KEY(dept_no) REFERENCES departments(dept_no);
ALTER TABLE employees ADD CONSTRAINT "fk_employees_emptitle" FOREIGN KEY(emp_title) REFERENCES titles(title_id);
ALTER TABLE salaries ADD CONSTRAINT "fk_salaries_empno" FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
