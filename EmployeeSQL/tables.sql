-- Part 1: Creating Tables

CREATE TABLE departments (
	dept_no VARCHAR(55) PRIMARY KEY  NOT NULL,
    dept_name VARCHAR(55) UNIQUE  NOT NULL
 );
 
CREATE TABLE titles (
    title_id VARCHAR(55) PRIMARY KEY NOT NULL,
    title VARCHAR(55) UNIQUE  NOT NULL
);

CREATE TABLE employees (
     emp_no INT PRIMARY KEY NOT NULL,
     emp_title_id VARCHAR(55) NOT NULL,
     FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
     birth_date DATE NOT NULL,
     first_name VARCHAR(55) NOT NULL,
     last_name VARCHAR(55) NOT NULL,
     sex VARCHAR(1) NOT NULL,
     hire_date DATE NOT NULL
 );

-- Changing the datestyle so we can import the 'employees' csv:

ALTER DATABASE "sql-challenge" SET datestyle TO "ISO, MDY";

CREATE TABLE dept_emp (
     emp_no INT NOT NULL,
     dept_no VARCHAR(55) NOT NULL,
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
     dept_no VARCHAR(55) NOT NULL,
     emp_no INT NOT NULL,
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
      emp_no INT NOT NULL,
      salary INT NOT NULL,
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Checking if data was imported correctly into each table:

SELECT * FROM employees LIMIT 5;
SELECT * FROM titles LIMIT 5;
SELECT * FROM departments LIMIT 10;
SELECT * FROM dept_emp LIMIT 5;
SELECT * FROM dept_manager LIMIT 5;
SELECT * FROM salaries LIMIT 5;