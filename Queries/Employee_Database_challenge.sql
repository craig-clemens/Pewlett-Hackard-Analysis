--Deliverable 1

--create retirement_titles.csv
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
    INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT * fROM retirement_titles;

--create unique_titles.csv
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles

--create retiring_titles.csv
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT (ut.emp_no) DESC;

SELECT * FROM retiring_titles

--Deliverable 2

--create mentorship_eligibility.csv
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility
