-- Data Analist: Jeremiah
-- This solution is for "request" by "James Nathan"

-- #1. A complete list of all departments
SELECT * 
FROM parks_and_recreation.parks_departments;

-- #2. The total number of employees in each department.
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS employee_count
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name;

