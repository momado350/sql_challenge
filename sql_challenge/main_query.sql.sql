DROP TABLE IF EXISTS departments;
--create table
CREATE TABLE departments (
dept_no INT NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);
 
SELECT * FROM departments;
-- drop table if exists
DROP TABLE IF EXISTS dept_emp;
--create table
CREATE TABLE dept_emp (
emp_no INT NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

--select all from table
SELECT * FROM dept_emp;
--drop table if exists
DROP TABLE IF EXISTS dept_manager;
--create table
CREATE TABLE dept_manager (
dept_no VARCHAR(50) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
); 
--select all from table
SELECT * FROM dept_manager;
-- drop table if exists
DROP TABLE IF EXISTS employees;
--create table
CREATE  TABLE employees (
emp_no INT NOT NULL,
	birth_date DATE,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(7) NOT NULL,
	hire_date DATE
);
--select all from table
SELECT * FROM employees;
-- drop table if exists
DROP TABLE IF EXISTS salaries;
--create table
CREATE TABLE salaries (
emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE,
	to_date DATE
);
--select all from table
SELECT * FROM salaries;
-- drop table if exists
DROP TABLE IF EXISTS  titles;
--create table
CREATE TABLE  titles (
emp_no INT NOT NULL,
	 title VARCHAR(50) NOT NULL,
	from_date DATE,
	to_date DATE
);
--select all from table
SELECT * FROM  titles;
--1\List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT * FROM salaries;
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;
--2\List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE extract(year from hire_date) = 1986;
--3\List the manager of each department with the following information:
--department number, department name, the manager's employee number
--last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--4\List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON employees.emp_no = dept_emp.emp_no 
JOIN departments
ON departments.dept_no = dept_emp.dept_no;
--5\List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
SELECT * FROM dept_manager;
--6\ List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
-- 7\ List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';
--8\ In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "freq_count"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;


