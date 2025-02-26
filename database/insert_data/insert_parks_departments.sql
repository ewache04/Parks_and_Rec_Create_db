-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description:
--   This script inserts sample data into the `parks_departments` table.
--   Includes:
--     - Transaction management for data integrity.
--     - Duplicate handling to prevent errors.
--     - Logging for better debugging and maintainability.
-- ======================================================

-- Start a transaction to ensure atomicity.
START TRANSACTION;

-- Insert data only if department_name does not already exist to prevent duplicates.
INSERT INTO parks_departments (department_name)
SELECT 'Parks and Recreation' 
WHERE NOT EXISTS (SELECT 1 FROM parks_departments WHERE department_name = 'Parks and Recreation')
UNION ALL
SELECT 'Animal Control' 
WHERE NOT EXISTS (SELECT 1 FROM parks_departments WHERE department_name = 'Animal Control')
UNION ALL
SELECT 'Public Works' 
WHERE NOT EXISTS (SELECT 1 FROM parks_departments WHERE department_name = 'Public Works')
UNION ALL
SELECT 'Healthcare' 
WHERE NOT EXISTS (SELECT 1 FROM parks_departments WHERE department_name = 'Healthcare')
UNION ALL
SELECT 'Library' 
WHERE NOT EXISTS (SELECT 1 FROM parks_departments WHERE department_name = 'Library')
UNION ALL
SELECT 'Finance' 
WHERE NOT EXISTS (SELECT 1 FROM parks_departments WHERE department_name = 'Finance');

-- Commit the transaction if all inserts are successful.
COMMIT;

-- Log success message (optional, for debugging).
SELECT 'Data successfully inserted into parks_departments.' AS status_message;

-- ======================================================
-- End of Script
-- ======================================================
