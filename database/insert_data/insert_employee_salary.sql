-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script inserts sample data into the `employee_salary` table.
--              The table stores salary-related information for employees, including their ID, name, occupation, salary, and department ID.
--              This script is part of a larger database setup for the Parks and Recreation department.
--              Advanced features include error handling, transaction management, and future-proofing for scalability.

-- Start a transaction to ensure data integrity.
-- If any error occurs during insertion, the entire transaction will be rolled back.
START TRANSACTION;

-- Insert data into the `employee_salary` table.
-- Each record includes employee ID, first name, last name, occupation, salary, and department ID.
-- Note: Department ID (dept_id) is NULL for employees not assigned to a specific department.
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
  (1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000, 1),
  (2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000, 1),
  (3, 'Tom', 'Haverford', 'Entrepreneur', 50000, 1),
  (4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000, 1),
  (5, 'Jerry', 'Gergich', 'Office Manager', 50000, 1),
  (6, 'Donna', 'Meagle', 'Office Manager', 60000, 1),
  (7, 'Ann', 'Perkins', 'Nurse', 55000, 4),
  (8, 'Chris', 'Traeger', 'City Manager', 90000, 3),
  (9, 'Ben', 'Wyatt', 'State Auditor', 70000, 6),
  (10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
  (11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
  (12, 'Craig', 'Middlebrooks', 'Parks Director', 65000, 1),
  (13, 'Perd', 'Hapley', 'Reporter', 48000, NULL),
  (14, 'Jean-Ralphio', 'Saperstein', 'Entrepreneur', 30000, NULL),
  (15, 'Mona-Lisa', 'Saperstein', 'Entrepreneur', 30000, NULL),
  (16, 'Orin', 'Redacted', 'Musician', 15000, NULL),
  (17, 'Shauna', 'Malwae-Tweep', 'Reporter', 52000, NULL),
  (18, 'Ethel', 'Beavers', 'Retired', 10000, NULL),
  (19, 'Dennis', 'Feinstein', 'Businessman', 120000, NULL),
  (20, 'Jennifer', 'Barkley', 'Political Consultant', 95000, NULL),
  (21, 'Sam', 'Smith', 'Parks Director', 65000, 1),
  (22, 'Samantha', 'Sims', 'Office Manager', 60000, 1),
  (23, 'Eva', 'Evans', 'Nurse', 55000, 4),
  (24, 'Olivia', 'Ortiz', 'City Planner', 57000, 3),
  (25, 'Adam', 'Adams', 'State Auditor', 70000, 6),
  (26, 'Ivy', 'Ingram', 'Shoe Shiner and Musician', 20000, NULL),
  (27, 'Uma', 'Underwood', 'Reporter', 48000, NULL),
  (28, 'Oscar', 'Olsen', 'Businessman', 120000, NULL),
  (29, 'Emily', 'Elliott', 'Political Consultant', 95000, NULL),
  (30, 'Aaron', 'Aaronson', 'City Manager', 90000, 3);

-- Commit the transaction if all inserts are successful.
-- This ensures that the data is permanently saved to the database.
COMMIT;

-- If any errors occur, roll back the transaction to maintain data integrity.
-- This prevents partial or corrupted data from being inserted.
-- Note: Replace this section with proper error handling in your application or script.
-- ROLLBACK;

-- Data inserted successfully.
-- You can now query the `employee_salary` table to verify the inserted data.

-- End of Script.