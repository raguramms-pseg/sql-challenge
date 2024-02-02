
-- Database: employee_db

-- DROP DATABASE IF EXISTS employee_db;

--CREATE DATABASE employee_db
--    WITH
--    OWNER = postgres
--    ENCODING = 'UTF8'
--    LC_COLLATE = 'C'
--    LC_CTYPE = 'C'
--    LOCALE_PROVIDER = 'libc'
--    TABLESPACE = pg_default
--    CONNECTION LIMIT = -1
--    IS_TEMPLATE = False;


DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    title_id VARCHAR  PRIMARY KEY NOT NULL,
    title VARCHAR  NOT NULL
   );
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR   NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR   NOT NULL,
  last_name VARCHAR   NOT NULL,
	sex VARCHAR   NOT NULL,
	hire_date date NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
   
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL ,
	salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    
);
CREATE TABLE departments (
    dept_no VARCHAR  PRIMARY KEY NOT NULL,
    dep_name VARCHAR  NOT NULL
   );

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
	dept_no VARCHAR  NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);


-- Import files using import tool in the sequence specified below and query the data and counts
Select * from titles;
Select * from employees;
Select * from salaries;
Select * from departments;
Select * from dept_employee;
Select * from dept_manager;