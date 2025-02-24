-- Data Analist: Jeremiah
-- This solution is for "request" by "John Doe"

-- #1. Can you give me a list of all employees who earn more than $60,000?
SELECT *
FROM employee_salary
WHERE salary > 60000;

-- #2. I need the names and salaries of employees who work in the 'Parks and Recreation' department (dept_id = 1).
SELECT * 
FROM employee_salary
WHERE dept_id = 1;

-- #3. What is the average salary of all employees in the company?
SELECT CONCAT('$ ', ROUND(AVG(COALESCE(FORMAT(salary), 0)),2)) AS avg_salary
FROM employee_salary;

-- #4. Who is the highest-paid employee in the company?
SELECT CONCAT('$ ', ROUND(MAX(COALESCE(FORMAT(salary)))))AS max_salary
FROM employee_salary;

-- #5. Can you find out how many employees do not belong to any department (dept_id is NULL)?
SELECT COUNT(dept_id = 'NULL' ) AS  null_id_count
FROM employee_salary;

-- #6. I need a list of employees whose last names start with the letter 'S'.
SELECT *
FROM employee_salary
WHERE LOWER(last_name) LIKE 's%';


-- #7. What is the total salary expenditure for each department?
SELECT dept_id,  CONCAT('$ ', FORMAT(SUM(salary), 2)) AS total_salary_expenditure
FROM employee_salary
GROUP BY dept_id
ORDER BY dept_id; 

-- #8. Can you list all employees who earn more than the average salary?
SELECT *
FROM employee_salary
WHERE salary > (SELECT AVG(salary) FROM employee_salary);

-- #9. How many employees are there in each occupation?
SELECT  occupation, COUNT(occupation) AS employee_per_occupation
FROM employee_salary
GROUP BY occupation
ORDER BY occupation;

-- #10. I need the names and salaries of employees who are either 'City Managers' or 'State Auditors'.
SELECT employee_id, occupation, first_name, last_name, CONCAT('$ ', FORMAT(salary, 0)) AS formatted_salary
FROM employee_salary
WHERE occupation = 'City Manager' OR occupation = 'State Auditor';

-- #11. Who is the lowest-paid employee in the company?
SELECT *
FROM employee_salary
WHERE salary = (SELECT MIN(salary) FROM employee_salary);

-- #12. Can you find all employees whose occupation contains the word 'Manager'?
SELECT *
FROM employee_salary
WHERE occupation LIKE '%manager';

-- #13. What is the total salary of all employees who are not assigned to any department (dept_id is NULL)?
SELECT CONCAT('$ ', FORMAT(SUM(salary), 2)) AS total_salary_dept_id_null
FROM employee_salary;

-- #14. How many employees earn more than $70,000?
SELECT COUNT(*) AS numb_of_employees
FROM employee_salary
WHERE salary > 70000;

-- #15. I need the names and salaries of employees whose first name has exactly 5 letters.
SELECT first_name, last_name, salary
FROM employee_salary
WHERE CHAR_LENGTH(first_name)  = 5;

-- #16. Can you list all employees who have the same occupation as 'Leslie Knope'?
SELECT *
FROM employee_salary
WHERE occupation LIKE (SELECT occupation FROM employee_salary  WHERE first_name = 'Leslie' AND last_name = 'Knope');

-- #17. Which department has the highest total salary expenditure?
SELECT dept_id, occupation, CONCAT('$ ', FORMAT(MAX(salary), 2)) AS salary_expenditure
FROM employee_salary
WHERE (SELECT MAX(salary) FROM employee_salary);

-- #18. I need a list of employees who earn between $40,000 and $60,000.
SELECT *
FROM employee_salary
WHERE salary BETWEEN 40000 AND 60000; 

-- #19. Can you find employees whose salary is above the average salary of their department?
SELECT es. *
FROM employee_salary es
JOIN (
	SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
) dept_avg
ON es.dept_id = dept_avg.dept_id
WHERE es.salary > dept_avg.avg_salary; 

-- #20. What is the total number of employees in the company?
SELECT COUNT(*) AS total_number_of_employees 
FROM employee_salary







