-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: 
--   SQL queries for analyzing employee salary data 
--   in the Parks and Recreation department.
--   Optimized for performance and scalability.
-- ======================================================

-- Database: parks_and_recreation
-- Table: employee_salary

-- ==============================
-- 1. List of all employees who earn more than $60,000
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 60000;

-- ==============================
-- 2. Names and salaries of employees in the 'Parks and Recreation' department (dept_id = 1)
-- ==============================
SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE dept_id = 1;

-- ==============================
-- 3. Average salary of all employees in the company
-- ==============================
SELECT CONCAT('$', ROUND(AVG(salary), 2)) AS average_salary
FROM parks_and_recreation.employee_salary;

-- ==============================
-- 4. Highest-paid employee in the company
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary = (SELECT MAX(salary) FROM parks_and_recreation.employee_salary);

-- ==============================
-- 5. Number of employees not assigned to any department (dept_id is NULL)
-- ==============================
SELECT COUNT(*) AS employees_without_department
FROM parks_and_recreation.employee_salary
WHERE dept_id IS NULL;

-- ==============================
-- 6. List of employees whose last names start with the letter 'S'
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE LOWER(last_name) LIKE 's%';

-- ==============================
-- 7. Total salary expenditure for each department
-- ==============================
SELECT dept_id, CONCAT('$', FORMAT(SUM(salary), 2)) AS total_salary_expenditure
FROM parks_and_recreation.employee_salary
GROUP BY dept_id
ORDER BY dept_id;

-- ==============================
-- 8. List of employees earning more than the average salary
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > (SELECT AVG(salary) FROM parks_and_recreation.employee_salary);

-- ==============================
-- 9. Number of employees in each occupation
-- ==============================
SELECT occupation, COUNT(*) AS employee_count
FROM parks_and_recreation.employee_salary
GROUP BY occupation
ORDER BY occupation;

-- ==============================
-- 10. Names and salaries of employees who are either 'City Managers' or 'State Auditors'
-- ==============================
SELECT first_name, last_name, CONCAT('$', FORMAT(salary, 0)) AS formatted_salary
FROM parks_and_recreation.employee_salary
WHERE occupation IN ('City Manager', 'State Auditor');

-- ==============================
-- 11. Lowest-paid employee in the company
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary = (SELECT MIN(salary) FROM parks_and_recreation.employee_salary);

-- ==============================
-- 12. Employees whose occupation contains the word 'Manager'
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE LOWER(occupation) LIKE '%manager%';

-- ==============================
-- 13. Total salary of employees not assigned to any department (dept_id is NULL)
-- ==============================
SELECT CONCAT('$', FORMAT(SUM(salary), 2)) AS total_salary_null_dept
FROM parks_and_recreation.employee_salary
WHERE dept_id IS NULL;

-- ==============================
-- 14. Number of employees earning more than $70,000
-- ==============================
SELECT COUNT(*) AS employees_above_70k
FROM parks_and_recreation.employee_salary
WHERE salary > 70000;

-- ==============================
-- 15. Names and salaries of employees whose first name has exactly 5 letters
-- ==============================
SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE CHAR_LENGTH(first_name) = 5;

-- ==============================
-- 16. Employees with the same occupation as 'Leslie Knope'
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE occupation = (SELECT occupation FROM parks_and_recreation.employee_salary WHERE first_name = 'Leslie' AND last_name = 'Knope');

-- ==============================
-- 17. Department with the highest total salary expenditure
-- ==============================
SELECT dept_id, CONCAT('$', FORMAT(SUM(salary), 2)) AS total_salary_expenditure
FROM parks_and_recreation.employee_salary
GROUP BY dept_id
ORDER BY total_salary_expenditure DESC
LIMIT 1;

-- ==============================
-- 18. Employees earning between $40,000 and $60,000
-- ==============================
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary BETWEEN 40000 AND 60000;

-- ==============================
-- 19. Employees earning above the average salary of their department
-- ==============================
SELECT es.*
FROM parks_and_recreation.employee_salary es
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM parks_and_recreation.employee_salary
    GROUP BY dept_id
) dept_avg
ON es.dept_id = dept_avg.dept_id
WHERE es.salary > dept_avg.avg_salary;

-- ==============================
-- 20. Total number of employees in the company
-- ==============================
SELECT COUNT(*) AS total_employees
FROM parks_and_recreation.employee_salary;

-- ==============================
-- 21. Employees who got a salary raise (5% if < $50k, else 3%)
-- ==============================
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary < 50000 THEN CONCAT('$', FORMAT(salary + (salary * 0.05), 2))
           ELSE CONCAT('$', FORMAT(salary + (salary * 0.03), 2))
       END AS new_salary
FROM parks_and_recreation.employee_salary;

-- ==============================
-- END OF SCRIPT
-- ==============================
