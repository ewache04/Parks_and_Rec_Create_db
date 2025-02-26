-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description:
--   This script creates the `parks_departments` table 
--   to store department information related to parks.
-- ======================================================

-- ======================================================
-- Step 1: Create the parks_departments table
-- ======================================================
CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT, 
  department_name VARCHAR(50) NOT NULL,      
  PRIMARY KEY (department_id)                
);

-- ======================================================
-- Step 2: Log success message (optional, for debugging)
-- ======================================================
SELECT 'Table parks_departments successfully created.' AS status_message;

-- ======================================================
-- End of Script: Table `parks_departments` Created
-- ======================================================
