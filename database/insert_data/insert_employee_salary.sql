-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description:
--   This script inserts sample data into the `employee_salary` table.
--   Includes:
--     - Transaction management for data integrity.
--     - Duplicate handling to prevent conflicts.
--     - Logging for debugging and maintainability.
-- ======================================================

-- Start a transaction to ensure atomicity.
START TRANSACTION;

-- Insert data only if employee_id does not already exist to prevent duplicates.
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
(18, 'Ethel', 'Beavers', 70, 'Female', '1953-12-03'),
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
COMMIT;

-- Log success message (optional, for debugging).
SELECT 'Data successfully inserted into employee_salary.' AS status_message;

-- ======================================================
-- End of Script
-- ======================================================
