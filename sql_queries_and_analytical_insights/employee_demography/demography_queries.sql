-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: 
--   SQL queries for analyzing employee demographic data 
--   in the Parks and Recreation department.
--   Optimized for performance and scalability.
-- ======================================================

-- Database: parks_and_recreation
-- Table: employee_demographics

-- ==============================
-- 1. Retrieve all employee demographic data
-- ==============================
SELECT * 
FROM parks_and_recreation.employee_demographics;

-- ==============================
-- 2. Retrieve selected columns for a concise overview
-- ==============================
SELECT employee_id, first_name, last_name, age, gender, birth_date
FROM parks_and_recreation.employee_demographics;

-- ==============================
-- 3. Employees older than 30
-- ==============================
SELECT * 
FROM parks_and_recreation.employee_demographics 
WHERE age > 30;

-- ==============================
-- 4. Retrieve only male employees
-- ==============================
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Male';

-- ==============================
-- 5. Employees born after 1990
-- ==============================
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE YEAR(birth_date) > 1990;

-- ==============================
-- 6. Employees sorted by last name (descending)
-- ==============================
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY last_name DESC;

-- ==============================
-- 7. Employee count grouped by gender
-- ==============================
SELECT gender, COUNT(*) AS gender_count
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- ==============================
-- 8. Retrieve the youngest and oldest employees
-- ==============================
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age = (SELECT MIN(age) FROM parks_and_recreation.employee_demographics)
   OR age = (SELECT MAX(age) FROM parks_and_recreation.employee_demographics);

-- ==============================
-- 9. Employees whose last names start with "S"
-- ==============================
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE last_name LIKE 'S%';

-- ==============================
-- 10. Total number of employees
-- ==============================
SELECT COUNT(*) AS total_employees
FROM parks_and_recreation.employee_demographics;

-- ==============================
-- 11. Average age of employees
-- ==============================
SELECT ROUND(AVG(age), 2) AS average_age
FROM parks_and_recreation.employee_demographics;

-- ==============================
-- 12. Employees with a birth date in the current month
-- ==============================
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE MONTH(birth_date) = MONTH(CURRENT_DATE());

-- ==============================
-- 13. Employee count by age group (e.g., 20-29, 30-39)
-- ==============================
SELECT 
    CASE 
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS employee_count
FROM parks_and_recreation.employee_demographics
GROUP BY age_group
ORDER BY age_group;

-- ==============================
-- 14. Employees whose first name starts and ends with the same letter
-- ==============================
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE LOWER(LEFT(first_name, 1)) = LOWER(RIGHT(first_name, 1));

-- ==============================
-- 15. Gender distribution percentage
-- ==============================
SELECT 
    gender,
    COUNT(*) AS gender_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM parks_and_recreation.employee_demographics), 2) AS gender_percentage
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- ==============================
-- 16. Top 5 most common last names
-- ==============================
SELECT last_name, COUNT(*) AS frequency
FROM parks_and_recreation.employee_demographics
GROUP BY last_name
ORDER BY frequency DESC
LIMIT 5;

-- ==============================
-- 17. Employees who are the only ones with their last name
-- ==============================
SELECT ed.*
FROM parks_and_recreation.employee_demographics ed
JOIN (
    SELECT last_name
    FROM parks_and_recreation.employee_demographics
    GROUP BY last_name
    HAVING COUNT(*) = 1
) unique_names
ON ed.last_name = unique_names.last_name;

-- ==============================
-- 18. Employee count by birth year
-- ==============================
SELECT YEAR(birth_date) AS birth_year, COUNT(*) AS employee_count
FROM parks_and_recreation.employee_demographics
GROUP BY birth_year
ORDER BY birth_year;

-- ==============================
-- 19. Employees with at least three vowels in their names
-- ==============================
SELECT employee_id, first_name, last_name
FROM parks_and_recreation.employee_demographics
WHERE 
    (LENGTH(first_name) - LENGTH(REPLACE(LOWER(first_name), 'a', '')) +
     LENGTH(first_name) - LENGTH(REPLACE(LOWER(first_name), 'e', '')) +
     LENGTH(first_name) - LENGTH(REPLACE(LOWER(first_name), 'i', '')) +
     LENGTH(first_name) - LENGTH(REPLACE(LOWER(first_name), 'o', '')) +
     LENGTH(first_name) - LENGTH(REPLACE(LOWER(first_name), 'u', ''))) >= 3
    OR 
    (LENGTH(last_name) - LENGTH(REPLACE(LOWER(last_name), 'a', '')) +
     LENGTH(last_name) - LENGTH(REPLACE(LOWER(last_name), 'e', '')) +
     LENGTH(last_name) - LENGTH(REPLACE(LOWER(last_name), 'i', '')) +
     LENGTH(last_name) - LENGTH(REPLACE(LOWER(last_name), 'o', '')) +
     LENGTH(last_name) - LENGTH(REPLACE(LOWER(last_name), 'u', ''))) >= 3;

-- ==============================
-- END OF SCRIPT
-- ==============================
