-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description:
--   This script creates the `employee_salary` table 
--   to store salary details of employees.
-- ======================================================

-- ======================================================
-- Step 1: Create the employee_salary table
-- ======================================================
CREATE TABLE employee_salary (
  employee_id INT NOT NULL,                     
  first_name VARCHAR(50) NOT NULL,            
  last_name VARCHAR(50) NOT NULL,             
  occupation VARCHAR(50),                      
  salary INT,                                  
  dept_id INT,                                
  PRIMARY KEY (employee_id)                    
);

-- ======================================================
-- Step 2: Log success message (optional, for debugging)
-- ======================================================
SELECT 'Table employee_salary successfully created.' AS status_message;

-- ======================================================
-- End of Script: Table `employee_salary` Created
-- ======================================================
