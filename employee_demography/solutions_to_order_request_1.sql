-- Data Analist: Jeremiah
-- This solution is for "order_request_1" by "John Doe"

-- #1. Select All Data



-- #2. Select Specific Columns (employee ID, first name, last name, age, gender, and birth date)
SELECT employee_id, first_name, last_name, age, gender, birth_date 
FROM parks_and_recreation.employee_demographics;


-- #3. Filter by Age (Employees Older Than 30)
SELECT * FROM parks_and_recreation.employee_demographics 
WHERE age > 30;


-- #4. Filter by Gender (Only Male Employees)
SELECT * FROM parks_and_recreation.employee_demographics 
WHERE gender = 'Male';


-- #5. Find Employees Born After 1990
SELECT * FROM parks_and_recreation.employee_demographics 
WHERE birth_date > '1990-01-01';


-- #6. Order Employees by Last Name
SELECT * FROM parks_and_recreation.employee_demographics 
ORDER BY last_name ASC;


-- #7. Count Employees by Gender
SELECT gender, COUNT(*) AS total_employees 
FROM parks_and_recreation.employee_demographics 
GROUP BY gender;

SELECT gender, COUNT(*) AS total_male
FROM parks_and_recreation.employee_demographics WHERE gender = 'male' and age < '90';


-- #8. Find the Youngest and Oldest Employees
SELECT * FROM parks_and_recreation.employee_demographics 
ORDER BY age ASC LIMIT 1;  -- Youngest Employee


SELECT * FROM parks_and_recreation.employee_demographics 
ORDER BY age DESC LIMIT 1;  -- Oldest Employee


-- #9. Find Employees with Last Names Starting with 'S'
SELECT * FROM parks_and_recreation.employee_demographics 
WHERE last_name LIKE 'S%';


-- #10. Count Total Employees
SELECT COUNT(*) AS total_employees 
FROM parks_and_recreation.employee_demographics;
