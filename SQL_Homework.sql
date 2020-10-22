--Q.1 
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
JOIN salary
ON salary.emp_no = employees.emp_no;

--Q.2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--Q.3
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--Q.4
SELECT departments.dept_name, dept_employees.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_employees
ON dept_employees.dept_no = departments.dept_no
JOIN employees 
ON dept_employees.emp_no = employees.emp_no;

--Q.5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--Q.6
SELECT departments.dept_name, departments.dept_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_employees 
ON dept_employees.dept_no = departments.dept_no
JOIN employees
ON dept_employees.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

--Q.7
SELECT departments.dept_name, departments.dept_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_employees 
ON dept_employees.dept_no = departments.dept_no
JOIN employees
ON dept_employees.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'

--Q.8
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

--Creation of Tables Below:
SELECT * FROM employees;
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE salary (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	s_emp_no INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (s_emp_no) REFERENCES salary(emp_no)
);

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	e_emp_no INT,
	d_dept_no VARCHAR,
	id_unique SERIAL,
	PRIMARY KEY (id_unique),
	FOREIGN KEY (d_dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (e_emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	e_emp_no INT,
	d_dept_no VARCHAR,
	id_unique SERIAL,
	PRIMARY KEY (id_unique),
	FOREIGN KEY (d_dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (e_emp_no) REFERENCES employees(emp_no)
);