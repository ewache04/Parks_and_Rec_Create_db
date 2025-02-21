-- Data Analist: Jeremiah
-- This solution is for "order_request_1" by "John Doe"

-- #1. A complete list of all employee by demographic data
SELECT * 
FROM parks_and_recreation.employee_demographics;

-- #2. Specific columns, including employee ID, first name, last name, age, gender, and birth date
SELECT employee_ID, first_name, last_name, age, gender, birth_date
FROM parks_departments.employee_demographics;

-- #3. A filtered list of employees who are older than 30.
SELECT * 
FROM parks_and_recreation.employee_demographics 
WHERE age > '30';

-- #4. A dataset that includes only male employees.
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'male';

-- #5. A list of employees who were born after 1990.
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age > "1990-01-01";

-- #6. An ordered list of employees sorted by last name.
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY last_name DESC;

-- #7. A count of employees grouped by gender.
SELECT gender, COUNT(*) AS gender_count
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- #8 The youngest and oldest employees in the company.
SELECT age
FROM parks_and_recreation.employee_demographics
WHERE age IN ((SELECT MIN(age) FROM parks_and_recreation.employee_demographics),
(SELECT MAX(age) FROM parks_and_recreation.employee_demographics));

-- #9 list of employees whose last names start with the letter "S."
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE LOWER(last_name) LIKE 'B%';

-- #10 The total number of employees in the database.
SELECT employee_id, COUNT(*) AS total_emp
FROM parks_and_recreation.employee_demographics;

-- #11 The average age of all employees.
SELECT AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics;

-- #12 A list of employees who have a birth date in the current month.
SELECT * 
FROM parks_and_recreation.employee_demographics

WHERE MONTH(birth_date) = MONTH(CURRENT_DATE()) AND YEAR(birth_date) <= (CURRENT_DATE());

-- #13 A breakdown of the number of employees in each age group (e.g., 20-29, 30-39, etc.)






