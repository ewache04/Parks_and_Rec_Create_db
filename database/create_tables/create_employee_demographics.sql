-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description:
--   This script creates the `employee_demographics` table 
--   to store demographic information of employees.
-- ======================================================

-- ======================================================
-- Step 1: Create the employee_demographics table
-- ======================================================
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,                    
  first_name VARCHAR(50),                      
  last_name VARCHAR(50),                       
  age INT,                                     
  gender VARCHAR(10),                          
  birth_date DATE,                             
  PRIMARY KEY (employee_id)                  
);

-- ======================================================
-- Step 2: Log success message (optional, for debugging)
-- ======================================================
SELECT 'Table employee_demographics successfully created.' AS status_message;

-- ======================================================
-- Step 3: Commit the transaction
-- ======================================================
COMMIT;

-- ======================================================
-- End of Script: Table `employee_demographics` Created
-- ======================================================
