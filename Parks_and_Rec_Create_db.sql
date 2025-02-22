DROP DATABASE IF EXISTS `Parks_and_Recreation`;
CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;

-- Create employee_demographics table
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

-- Create employee_salary table
CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

-- Insert data into employee_demographics
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1, 'Leslie', 'Knope', 44, 'Female', '1979-09-25'),
(2, 'Ron', 'Swanson', 55, 'Male', '1968-05-21'),
(3, 'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27'),
(13, 'Perd', 'Hapley', 45, 'Male', '1978-09-30'),
(14, 'Jean-Ralphio', 'Saperstein', 32, 'Male', '1991-04-01'),
(15, 'Mona-Lisa', 'Saperstein', 30, 'Female', '1993-08-15'),
(16, 'Orin', 'Redacted', 28, 'Male', '1995-02-14'),
(17, 'Shauna', 'Malwae-Tweep', 31, 'Female', '1992-11-22'),
(18, 'Ethel', 'Beavers', 70, 'Female', '1953-12-03'),
(19, 'Dennis', 'Feinstein', 50, 'Male', '1973-07-19'),
(20, 'Jennifer', 'Barkley', 42, 'Female', '1981-05-10');

-- Insert data into employee_salary
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000, 1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000, 1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000, 1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000, 1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000, 1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000, 1),
(7, 'Ann', 'Perkins', 'Nurse', 55000, 4),
(8, 'Chris', 'Traeger', 'City Manager', 90000, 3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000, 6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000, 1),
(13, 'Perd', 'Hapley', 'Reporter', 48000, NULL),
(14, 'Jean-Ralphio', 'Saperstein', 'Entrepreneur', 30000, NULL),
(15, 'Mona-Lisa', 'Saperstein', 'Entrepreneur', 30000, NULL),
(16, 'Orin', 'Redacted', 'Musician', 15000, NULL),
(17, 'Shauna', 'Malwae-Tweep', 'Reporter', 52000, NULL),
(18, 'Ethel', 'Beavers', 'Retired', 10000, NULL),
(19, 'Dennis', 'Feinstein', 'Businessman', 120000, NULL),
(20, 'Jennifer', 'Barkley', 'Political Consultant', 95000, NULL);

-- Create parks_departments table
CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

-- Insert data into parks_departments
INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');