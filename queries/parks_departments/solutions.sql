-- Data Analist: Jeremiah
-- This solution is for "request" by "James Nathan"

-- #1. A complete list of all departments
SELECT * 
FROM parks_and_recreation.parks_departments;

-- #2. The total number of employees in each department.
SELECT department_name,  COUNT(parks_departments.department_id = employee_salary.dept_id)
FROM parks_departments;

