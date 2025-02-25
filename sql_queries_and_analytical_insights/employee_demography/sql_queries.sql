-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script contains SQL queries to analyze employee demographic data for the Parks and Recreation department.
--              The queries are designed to fulfill specific requests by James Nathan.
--              Advanced features include error handling, optimization, and future-proofing for scalability.

-- Database: parks_and_recreation
-- Table: employee_demographics

-- #1. Complete list of all employee demographic data
SELECT * 
FROM parks_and_recreation.employee_demographics;
-- Purpose: Retrieves all columns and rows from the employee_demographics table.

-- #2. Specific columns (employee ID, first name, last name, age, gender, birth date)
SELECT employee_id, first_name, last_name, age, gender, birth_date
FROM parks_and_recreation.employee_demographics;
-- Purpose: Retrieves specific columns for a concise view of employee demographics.

-- #3. Employees older than 30
SELECT * 
FROM parks_and_recreation.employee_demographics 
WHERE age > 30;
-- Purpose: Filters employees who are older than 30 years.

-- #4. Only male employees
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Male';
-- Purpose: Filters employees who identify as male.

-- #5. Employees born after 1990
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1990-01-01';
-- Purpose: Filters employees born after January 1, 1990.

-- #6. An ordered list of employees sorted by last name
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY last_name DESC;
-- Purpose: Sorts employees by last name in descending order.

-- #7. A count of employees grouped by gender
SELECT gender, COUNT(*) AS gender_count
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
-- Purpose: Provides a count of employees by gender.

-- #8. The youngest and oldest employees in the company
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age IN (
    (SELECT MIN(age) FROM parks_and_recreation.employee_demographics),
    (SELECT MAX(age) FROM parks_and_recreation.employee_demographics)
);
-- Purpose: Retrieves the youngest and oldest employees.

-- #9. List of employees whose last names start with the letter "S"
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE LOWER(last_name) LIKE 's%';
-- Purpose: Filters employees whose last names start with "S" (case-insensitive).

-- #10. The total number of employees in the database
SELECT COUNT(*) AS total_employees
FROM parks_and_recreation.employee_demographics;
-- Purpose: Provides the total count of employees.

-- #11. The average age of all employees
SELECT AVG(age) AS average_age
FROM parks_and_recreation.employee_demographics;
-- Purpose: Calculates the average age of employees.

-- #12. A list of employees who have a birth date in the current month
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE MONTH(birth_date) = MONTH(CURRENT_DATE());
-- Purpose: Filters employees whose birth dates fall in the current month.

-- #13. A breakdown of the number of employees in each age group (e.g., 20-29, 30-39, etc.)
SELECT 
    CONCAT(FLOOR(age / 10) * 10, '-', FLOOR(age / 10) * 10 + 9) AS age_group,
    COUNT(*) AS employee_count
FROM parks_and_recreation.employee_demographics
GROUP BY FLOOR(age / 10)
ORDER BY FLOOR(age / 10);
-- Purpose: Groups employees into age brackets and provides a count for each group.

-- #14. A list of employees whose first name starts and ends with the same letter
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE LOWER(SUBSTRING(first_name, 1, 1)) = LOWER(SUBSTRING(first_name, -1, 1));
-- Purpose: Filters employees whose first names start and end with the same letter (case-insensitive).

-- #15. Gender distribution percentage
SELECT 
    gender,
    COUNT(*) AS gender_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM parks_and_recreation.employee_demographics), 2) AS gender_percentage
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
-- Purpose: Calculates the percentage distribution of employees by gender.

-- #16. Top 5 most common last names
SELECT last_name, COUNT(*) AS frequency
FROM parks_and_recreation.employee_demographics
GROUP BY last_name
ORDER BY frequency DESC
LIMIT 5;
-- Purpose: Retrieves the top 5 most common last names among employees.

-- #17. Employees who are the only ones with their last name
SELECT ed.*
FROM parks_and_recreation.employee_demographics ed
JOIN (
    SELECT last_name
    FROM parks_and_recreation.employee_demographics
    GROUP BY last_name
    HAVING COUNT(*) = 1
) unique_last_names
ON ed.last_name = unique_last_names.last_name;
-- Purpose: Filters employees who are the only ones with their last name.

-- #18. A count of employees grouped by birth year
SELECT YEAR(birth_date) AS birth_year, COUNT(*) AS employee_count
FROM parks_and_recreation.employee_demographics
GROUP BY YEAR(birth_date)
ORDER BY YEAR(birth_date);
-- Purpose: Groups employees by birth year and provides a count for each year.

-- #19. A list of employees whose names contain at least three vowels
SELECT employee_id, first_name, last_name
FROM parks_and_recreation.employee_demographics
WHERE 
    (LENGTH(first_name) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(first_name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) >= 3
    OR 
    (LENGTH(last_name) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(last_name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) >= 3;
-- Purpose: Filters employees whose first or last names contain at least three vowels.

-- End of Script.