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


-- #3. The total salary expenditure for each department.
SELECT 
	d.department_id,
    d.department_name,
    CONCAT('$ ', FORMAT(SUM(e.salary), 2)) AS salary_expenditure_per_department
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id

GROUP BY d.department_id, d.department_name
ORDER BY department_name;

-- #4. The average salary for employees in each department.
SELECT
	d.department_id,
    d.department_name,
    CONCAT('$ ', FORMAT(AVG(e.salary), 2)) AS avg_salary_per_department

FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id

GROUP BY d.department_id, d.department_name
ORDER BY department_name;

-- #5. The highest-paid employee in each department.
SELECT
	d.department_id,
    d.department_name, 
    e.first_name, e.last_name, 
    CONCAT('$ ', FORMAT(MAX(e.salary), 2)) AS max_salary_per_department
    
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id

GROUP BY d.department_id, d.department_name
ORDER BY department_name;

-- #6. The lowest-paid employee in each department.
SELECT
	d.department_id,
    d.department_name,
    e.first_name, e.last_name, 
    CONCAT('$ ', FORMAT(MIN(e.salary), 2)) AS min_salary_per_department
    
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id

GROUP BY d.department_id, d.department_name
ORDER BY department_name;

-- #7. A list of employees who are not assigned to any department.
SELECT *
FROM parks_and_recreation.employee_salary es
WHERE es.dept_id NOT LIKE 'NULL';

-- #8. The department with the highest total salary expenditure.
SELECT 
    d.department_name, 
    CONCAT('$ ', FORMAT(SUM(e.salary), 2)) AS total_salary_expenditure
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name
ORDER BY SUM(e.salary) DESC
LIMIT 1;

-- #9. The department with the lowest total salary expenditure.
SELECT 
    d.department_name, 
    CONCAT('$ ', FORMAT(SUM(e.salary), 2)) AS total_salary_expenditure
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name
ORDER BY SUM(e.salary) ASC
LIMIT 1;

-- #10. The percentage of employees working in each department.
SELECT 
    d.department_name, 
    CONCAT(ROUND(COUNT(e.employee_id) * 100.0 / (SELECT COUNT(*) FROM employee_salary), 2), '%') AS percentage_of_employees
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name
ORDER BY percentage_of_employees DESC;

-- #11. A list of employees who earn more than the average salary of their department
SELECT e.*
FROM employee_salary e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
) dept_avg ON e.dept_id = dept_avg.dept_id
WHERE e.salary > dept_avg.avg_salary;

-- #12. A list of employees who earn less than the average salary of their department.
SELECT e.*
FROM employee_salary e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
) dept_avg ON e.dept_id = dept_avg.dept_id
WHERE e.salary < dept_avg.avg_salary;


-- #13. The gender distribution of employees in each department
SELECT 
    d.department_name, 
    ed.gender, 
    COUNT(ed.employee_id) AS gender_count
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
JOIN employee_demographics ed ON e.employee_id = ed.employee_id
GROUP BY d.department_name, ed.gender;

-- #14. The average age of employees in each department
SELECT 
    d.department_name, 
    ROUND(AVG(ed.age),2) AS average_age
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
JOIN employee_demographics ed ON e.employee_id = ed.employee_id
GROUP BY d.department_name;

-- #15. A list of all employees working in the Parks and Recreation department
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Parks and Recreation';

-- #16. A list of all employees working in the Public Works department
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Public Works';

-- #17. A list of all employees working in the Healthcare department
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Healthcare';

-- #18. A list of all employees working in the Finance department
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Finance';

-- #19. A list of all employees working in the Animal Control department
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Animal Control';

-- #20. A list of all employees working in the Library department
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Library';
