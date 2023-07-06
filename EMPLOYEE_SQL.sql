--List the employee number, last name, first name, sex, and salary
--of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e

JOIN SALARIES as s on
s.emp_no = e.emp_no ;

--List the first name, last name, and hire date
--for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT  dm.emp_no, dm.dept_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager as dm
LEFT JOIN employees as e ON
dm.emp_no = e.emp_no
JOIN departments as d ON
d.dept_no= dm.dept_no;
--List the department number for each employee along with that employee’s
--employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees as e ON
e.emp_no = de.emp_no
JOIN departments as d ON
d.dept_no= de.dept_no;
--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT e.first_name,  e.last_name, e.sex
FROM employees as e

WHERE first_name = 'Hercules' AND
last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT d.dept_name, d.dept_no, de.emp_no, e.last_name, e.first_name
FROM departments as d
RIGHT JOIN dept_emp as de ON
de.dept_no = d.dept_no
RIGHT JOIN employees as e ON
e.emp_no = de.emp_no
WHERE dept_name = 'Sales';
--List each employee in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
SELECT d.dept_name, d.dept_no, de.emp_no, e.last_name, e.first_name
FROM departments as d
RIGHT JOIN dept_emp as de ON
de.dept_no = d.dept_no
RIGHT JOIN employees as e ON
e.emp_no = de.emp_no
WHERE dept_name = 'Sales' OR dept_name ='Development';

--List the frequency counts, in descending order, of all the
--employee last names (that is, how many employees share each last name).
SELECT COUNT(last_name) AS "FREQUENCY" , last_name FROM employees 
GROUP BY last_name 
ORDER BY "FREQUENCY" DESC;

