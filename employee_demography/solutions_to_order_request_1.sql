-- Data Analist: Jeremiah
-- This solution is for "order_request_1" by "James Nathan"

-- #1. Complete list of all employee demographic data
SELECT * 
FROM parks_and_recreation.employee_demographics;

-- #2. Specific columns (employee ID, first name, last name, age, gender, birth date)
SELECT employee_ID, first_name, last_name, age, gender, birth_date
FROM parks_departments.employee_demographics;

-- #3. Employees older than 30
SELECT * 
FROM parks_and_recreation.employee_demographics 
WHERE age > '30';

-- #4. Only male employees
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'male';

-- #5. Employees born after 1990
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
WHERE (DATE(birth_date)) = DATE(CURRENT_DATE());

-- #13 A breakdown of the number of employees in each age group (e.g., 20-29, 30-39, etc.)
SELECT 
CONCAT(FLOOR(age / 10 ) * 10, '-', FLOOR(age / 10) * 10 + 9) AS age_group,
COUNT(*) AS employee_count
FROM parks_and_recreation.employee_demographics
GROUP BY FLOOR(age / 10)
ORDER BY FLOOR(age / 10);

-- #14 A list of employees whose first name starts and ends with the same letter.
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE LOWER(SUBSTRING(first_name, 1,1)) = LOWER(SUBSTRING(first_name, -1,1));

-- #15 Employees whose first name starts and ends with the same letter
SELECT gender,
COUNT(*) AS fre_gender,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
FROM parks_and_recreation.employee_demographics), 2) AS gender_percentage
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- #16 Gender distribution percentage
SELECT last_name, COUNT(*) AS freq_last_name
FROM parks_and_recreation.employee_demographics
GROUP BY last_name 
ORDER BY freq_last_name DESC
LIMIT 5;

-- #16 Top 5 most common last names
SELECT ed.*
FROM parks_and_recreation.employee_demographics ed
JOIN (
	SELECT last_name
    FROM parks_and_recreation.employee_demographics
    GROUP BY last_name
    HAVING COUNT(*) = 1
) unique_last_names
ON ed.last_name = unique_last_names.last_name; 

-- #17  Employees who are the only ones with their last name
SELECT ed. *
FROM parks_and_recreation.employee_demographics ed
join (
	SELECT last_name
    FROM parks_and_recreation.employee_demographics
    GROUP BY last_name
    HAVING COUNT(*) = 1
) unique_last_names
ON parks_and_recreation.employee_demographics.last_name = unique_last_names.last_name;

-- #18  A count of employees grouped by birth year.
SELECT  YEAR(birth_date) AS birth_year,  COUNT(*) AS employee_count 
FROM parks_and_recreation.employee_demographics
GROUP BY YEAR(birth_date)
ORDER BY YEAR(birth_date);

-- #18  A list of employees whose names contain at least three vowels.
SELECT employee_id, first_name, last_name
FROM parks_and_recreation.employee_demographics 
WHERE 
    (LENGTH(first_name) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(first_name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) >= 3
    OR 
    (LENGTH(last_name) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(last_name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) >= 3;



