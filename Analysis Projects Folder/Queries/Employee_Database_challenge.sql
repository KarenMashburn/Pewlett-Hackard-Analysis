CREATE TABLE Titles (
  emp_no INT NOT NULL,
  title VARCHAR(30) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL)
  ;

CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

SELECT emp_no, first_name, last_name, birth_date 
INTO employee_info
FROM employees;

SELECT title, from_date, to_date, emp_no
INTO title_info
FROM titles;


-- Joining employees and titles tables	
SELECT 
	employee_info.emp_no, 
	employee_info.first_name, 
	employee_info.last_name,
	employee_info.birth_date,
	titles.title,
	titles.from_date,
	titles.to_date
INTO employee_titles
from employee_info
left JOIN titles
ON employee_info.emp_no=titles.emp_no  ;

drop table employee_titles cascade

-- Joining employees and titles tables	
SELECT 
	emp_no, 
	first_name, 
	last_name,
	title,
	from_date,
	to_date
Into retirement_info	
from employee_titles
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
-- Check the table

drop table retiring_titles cascade

select * from employee_titles;
group by  title
ORDER BY title desc;
ORDER BY title desc;

-- Joining employees and titles tables	
SELECT 
	emp_no,
	first_name,
	last_name,
	title
Into retirement_titles
from retirement_info

select * from retirement_titles

--into retiring_titles
from retirement_info
group by  title
ORDER BY title desc;
-- Check the table

select * from retiring_titles




-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
first_name,
last_name,
title

INTO recent_title
FROM retirement_titles
ORDER BY emp_no, title DESC;

drop table retiring_titles

SELECT count(title),
	title
INTO retiring_titles
FROM recent_title
group by title
order by count(title) DESC;

select * from retiring_titles


### Deliverable # 2

--emp_no,first_name, last_name, birth_date FROM employees, 
SELECT 
	emp_no,
	first_name,
	last_name, 
	birth_date 
FROM employees;


--emp_no, from_date, to_date from dept_emp table
SELECT
	emp_no,
	from_date,
	to_date
from dept_emp;

--emp_no, title from titles table
Select 
	emp_no,
	title
From Titles;



-- Use Dictinct 
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name, 
	birth_date

INTO emp_mentorship_name
FROM employees;


--emp_no, from_date, to_date from dept_emp table * Distinct on
SELECT DISTINCT ON (emp_no) emp_no,
	from_date,
	to_date
INTO emp_dates	
from dept_emp;

--emp_no, title from titles table * distinct on
SELECT DISTINCT ON (emp_no) emp_no,
	title
INTO ment_title	
From Titles;


-- Joining employees and titles tables	
SELECT 
	emp_mentorship_name.emp_no, 
	emp_mentorship_name.first_name, 
	emp_mentorship_name.last_name,
	emp_mentorship_name.birth_date,
	emp_dates.from_date,
	emp_dates.to_date,
	ment_title.title
INTO mentorship_eligibilty
from emp_mentorship_name
left JOIN ment_title
ON emp_mentorship_name.emp_no=ment_title.emp_no 
LEFT JOIN emp_dates
ON emp_dates.emp_no=ment_title.emp_no 
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

select * from mentorship_eligibilty