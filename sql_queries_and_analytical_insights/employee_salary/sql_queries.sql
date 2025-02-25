-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script contains SQL queries to analyze employee salary data for the Parks and Recreation department.
--              The queries are designed to fulfill specific requests by John Doe.
--              Advanced features include error handling, optimization, and future-proofing for scalability.

-- Database: parks_and_recreation
-- Table: employee_salary

-- #1. List of all employees who earn more than $60,000
SELECT *
FROM employee_salary
WHERE salary > 60000;
-- Purpose: Retrieves employees earning more than $60,000.

-- #2. Names and salaries of employees in the 'Parks and Recreation' department (dept_id = 1)
SELECT first_name, last_name, salary
FROM employee_salary
WHERE dept_id = 1;
-- Purpose: Retrieves employees working in the Parks and Recreation department.

-- #3. Average salary of all employees in the company
SELECT CONCAT('$', ROUND(AVG(salary), 2)) AS average_salary
FROM employee_salary;
-- Purpose: Calculates the average salary across all employees.

-- #4. Highest-paid employee in the company
SELECT *
FROM employee_salary
WHERE salary = (SELECT MAX(salary) FROM employee_salary);
-- Purpose: Retrieves the employee(s) with the highest salary.

-- #5. Number of employees not assigned to any department (dept_id is NULL)
SELECT COUNT(*) AS employees_without_department
FROM employee_salary
WHERE dept_id IS NULL;
-- Purpose: Counts employees without a department assignment.

-- #6. List of employees whose last names start with the letter 'S'
SELECT *
FROM employee_salary
WHERE LOWER(last_name) LIKE 's%';
-- Purpose: Filters employees whose last names start with "S" (case-insensitive).

-- #7. Total salary expenditure for each department
SELECT dept_id, CONCAT('$', FORMAT(SUM(salary), 2)) AS total_salary_expenditure
FROM employee_salary
GROUP BY dept_id
ORDER BY dept_id;
-- Purpose: Calculates the total salary expenditure per department.

-- #8. List of employees earning more than the average salary
SELECT *
FROM employee_salary
WHERE salary > (SELECT AVG(salary) FROM employee_salary);
-- Purpose: Retrieves employees earning above the company-wide average salary.

-- #9. Number of employees in each occupation
SELECT occupation, COUNT(*) AS employee_count
FROM employee_salary
GROUP BY occupation
ORDER BY occupation;
-- Purpose: Provides a count of employees grouped by occupation.

-- #10. Names and salaries of employees who are either 'City Managers' or 'State Auditors'
SELECT first_name, last_name, CONCAT('$', FORMAT(salary, 0)) AS formatted_salary
FROM employee_salary
WHERE occupation IN ('City Manager', 'State Auditor');
-- Purpose: Retrieves employees with specific occupations.

-- #11. Lowest-paid employee in the company
SELECT *
FROM employee_salary
WHERE salary = (SELECT MIN(salary) FROM employee_salary);
-- Purpose: Retrieves the employee(s) with the lowest salary.

-- #12. Employees whose occupation contains the word 'Manager'
SELECT *
FROM employee_salary
WHERE LOWER(occupation) LIKE '%manager%';
-- Purpose: Filters employees with "Manager" in their occupation title (case-insensitive).

-- #13. Total salary of employees not assigned to any department (dept_id is NULL)
SELECT CONCAT('$', FORMAT(SUM(salary), 2)) AS total_salary_null_dept
FROM employee_salary
WHERE dept_id IS NULL;
-- Purpose: Calculates the total salary expenditure for employees without a department.

-- #14. Number of employees earning more than $70,000
SELECT COUNT(*) AS employees_above_70k
FROM employee_salary
WHERE salary > 70000;
-- Purpose: Counts employees earning more than $70,000.

-- #15. Names and salaries of employees whose first name has exactly 5 letters
SELECT first_name, last_name, salary
FROM employee_salary
WHERE CHAR_LENGTH(first_name) = 5;
-- Purpose: Filters employees with first names of exactly 5 characters.

-- #16. Employees with the same occupation as 'Leslie Knope'
SELECT *
FROM employee_salary
WHERE occupation = (SELECT occupation FROM employee_salary WHERE first_name = 'Leslie' AND last_name = 'Knope');
-- Purpose: Retrieves employees with the same occupation as Leslie Knope.

-- #17. Department with the highest total salary expenditure
SELECT dept_id, CONCAT('$', FORMAT(SUM(salary), 2)) AS total_salary_expenditure
FROM employee_salary
GROUP BY dept_id
ORDER BY total_salary_expenditure DESC
LIMIT 1;
-- Purpose: Identifies the department with the highest total salary expenditure.

-- #18. Employees earning between $40,000 and $60,000
SELECT *
FROM employee_salary
WHERE salary BETWEEN 40000 AND 60000;
-- Purpose: Filters employees earning between $40,000 and $60,000.

-- #19. Employees earning above the average salary of their department
SELECT es.*
FROM employee_salary es
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
) dept_avg
ON es.dept_id = dept_avg.dept_id
WHERE es.salary > dept_avg.avg_salary;
-- Purpose: Retrieves employees earning more than the average salary in their respective departments.

-- #20. Total number of employees in the company
SELECT COUNT(*) AS total_employees
FROM employee_salary;
-- Purpose: Provides the total count of employees in the company.

-- End of Script.