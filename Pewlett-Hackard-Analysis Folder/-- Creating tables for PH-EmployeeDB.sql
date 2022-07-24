-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

--Employees table

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
--dept manager table
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no)
);
--table salaries
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,

);

--create dept_emp
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no varchar NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,

);



--create titles

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title varchar NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,

);

--Query alert
Select * From departments;

select *
From departments

--select *
--from dept_emp

Drop table dept_emp cascade;

Create table dept_emp (
	emp_no INT NOT NULL,
  	dept_no varchar NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL
);

select * 
from dept_manager

select * 
from salaries

select * 
from employees

select * 
from titles

drop table titles cascade;

create table titles (
	emp_no INT NOT NULL,
  	title varchar NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL
	);
	
select * 
from titles

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

Select *
from retirement_info

--select *
--from dept_emp

Drop table dept_emp cascade;

Create table dept_emp (
	emp_no INT NOT NULL,
  	dept_no varchar NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL
);

select * 
from dept_manager

select * 
from salaries

select * 
from employees

select * 
from titles

drop table titles cascade;

create table titles (
	emp_no INT NOT NULL,
  	title varchar NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL
	);
	
select * 
from titles

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

Select *
from retirement_info

Drop Table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

--Joining departments and dept_managers tables inner join
Select departments.dept_name,
		dept_manager.emp_no,
		dept_manager.from_date,
		dept_manager.to_date
From departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
from retirement_info
Left join dept_emp
On retirement_info.emp_no = dept_emp.emp_no;

--Alias'
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
From departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

Select ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date

INTO current_emp

From retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number - counting employess and grouping by deparment
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
Order By de.dept_no;

Select * 
from salaries
order by to_date DESC;
-- Tables listds

SELECT emp_no,
    first_name,
last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
select * 
from manager_info

--Inner joins current_emp. departments, and dept for Sales only
select ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name

into dept_info
from current_emp as ce
inner join dept_emp as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no);
		
select *
from dept_info

--- IN and where queries sales and development team
select e.emp_no, 
e.first_name, 
e.last_name, 
d.dept_name
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales','Development');

