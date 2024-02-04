-- DATA ANALYSIS 

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,cast(s.salary as money) 
FROM employees as e
JOIN salaries as s ON
s.emp_no=e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE extract (year FROM hire_date) = 1986;

 --List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no,d.dep_name,e.emp_no,e.last_name,e.first_name
FROM dept_manager as dm 
JOIN departments as d ON
dm.dept_no=d.dept_no 
JOIN employees as e on
e.emp_no = dm.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,de.dept_no,d.dep_name
FROM dept_employee as de 
JOIN employees as e ON
e.emp_no = de.emp_no
JOIN departments as d ON
de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,last_name,sex
FROM employees
WHERE first_name = 'Hercules' 
AND   last_name like ('B%');

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,e.last_name,e.first_name
FROM dept_emp as de 
JOIN employees as e ON
e.emp_no = de.emp_no
JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dep_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,de.dept_no,d.dep_name
FROM dept_emp as de 
JOIN employees as e ON
e.emp_no = de.emp_no
JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dep_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,count(*) as count
FROM employees
GROUP BY last_name
ORDER BY count DESC;
