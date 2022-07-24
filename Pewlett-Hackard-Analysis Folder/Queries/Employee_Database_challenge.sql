
--1. retrieve from employees table,
Select e.emp_no,
e.first_name,
e.last_name,
--2 titles table
ti.title,
ti.from_date,
ti.to_date
--3 into new table
into retirement_titles
--4 join as primary key
from employees as e
	inner join titles as ti
		on (e.emp_no = ti.emp_no)
--5 filter birthdate
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--6.Order by employee number
Order by e.emp_no;


select *
from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ri.emp_no) ri.emp_no,
ri.first_name,
ri.last_name,
ri.title

INTO unique_titles
FROM retirement_titles as ri
WHERE (to_date = '9999-01-01')
ORDER BY ri.emp_no, ri.to_date DESC;


select *
from unique_titles

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

select * 
from retiring_titles

--Mentorship eligibility
select distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
Into mentorship_eligibility
from employees as e
inner join dept_emp as de
	on (e.emp_no = de.emp_no)
		inner join titles as ti
			on (e.emp_no= ti. emp_no)
			where (de.to_date = '9999-01-01')
			And (birth_date between '1965-01-01' and '1965-12-31')
				Order by e.emp_no;
