-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This solution provides various analytical queries related to employee salaries and department insights.

-- #1. A complete list of all departments
SELECT d. * 
FROM parks_and_recreation.parks_departments d
ORDER BY d.department_name;

-- #2. The total number of employees in each department.
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS employee_count
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name
ORDER BY employee_count DESC;

-- #3. The total salary expenditure for each department.
SELECT 
    d.department_name,
    CONCAT('$ ', FORMAT(COALESCE(SUM(e.salary), 0), 2)) AS total_salary_expenditure
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name
ORDER BY total_salary_expenditure DESC;

-- #4. The average salary for employees in each department.
SELECT
    d.department_name,
    CONCAT('$ ', FORMAT(COALESCE(AVG(e.salary), 0), 2)) AS avg_salary
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

-- #5. The highest-paid employee(s) in each department.
WITH MaxSalary AS (
    SELECT dept_id, MAX(salary) AS max_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT 
    d.department_name, 
    e.first_name, e.last_name, 
    CONCAT('$ ', FORMAT(e.salary, 2)) AS highest_salary
FROM employee_salary e
JOIN MaxSalary ms ON e.dept_id = ms.dept_id AND e.salary = ms.max_salary
JOIN parks_departments d ON e.dept_id = d.department_id
ORDER BY d.department_name;

-- #6. The lowest-paid employee(s) in each department.
WITH MinSalary AS (
    SELECT dept_id, MIN(salary) AS min_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT 
    d.department_name, 
    e.first_name, e.last_name, 
    CONCAT('$ ', FORMAT(e.salary, 2)) AS lowest_salary
FROM employee_salary e
JOIN MinSalary ms ON e.dept_id = ms.dept_id AND e.salary = ms.min_salary
JOIN parks_departments d ON e.dept_id = d.department_id
ORDER BY d.department_name;

-- #7. A list of employees who are not assigned to any department.
SELECT *
FROM employee_salary 
WHERE dept_id IS NULL;

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

-- #11. Employees earning more than the average salary of their department.
WITH DeptAvg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT e.*
FROM employee_salary e
JOIN DeptAvg da ON e.dept_id = da.dept_id
WHERE e.salary > da.avg_salary;

-- #12. Employees earning less than the average salary of their department.
WITH DeptAvg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT e.*
FROM employee_salary e
JOIN DeptAvg da ON e.dept_id = da.dept_id
WHERE e.salary < da.avg_salary;

-- #13. The gender distribution of employees in each department.
SELECT 
    d.department_name, 
    ed.gender, 
    COUNT(ed.employee_id) AS gender_count
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
JOIN employee_demographics ed ON e.employee_id = ed.employee_id
GROUP BY d.department_name, ed.gender
ORDER BY d.department_name, gender_count DESC;

-- #14. The average age of employees in each department.
SELECT 
    d.department_name, 
    ROUND(AVG(ed.age), 2) AS average_age
FROM parks_departments d
LEFT JOIN employee_salary e ON d.department_id = e.dept_id
JOIN employee_demographics ed ON e.employee_id = ed.employee_id
GROUP BY d.department_name
ORDER BY average_age DESC;

-- #15 - #20: Lists of employees by department.
SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Parks and Recreation';

SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Public Works';

SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Healthcare';

SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Animal Control';

SELECT e.*
FROM employee_salary e
JOIN parks_departments d ON e.dept_id = d.department_id
WHERE d.department_name = 'Library';

-- ==============================
-- END OF SCRIPT
-- ==============================

