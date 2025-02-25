-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script creates the `employee_salary` table for the Parks and Recreation database.
--              The table stores salary-related information for employees, including their ID, name, occupation, salary, and department ID.
--              This table is part of a larger database designed to manage employee and department data.
--              Advanced features include error handling, indexing, and future-proofing for scalability.

-- Drop the table if it already exists to avoid conflicts during creation.
-- This ensures a clean slate for the table creation process.
DROP TABLE IF EXISTS employee_salary;

-- Create the `employee_salary` table.
-- This table is designed to store salary details of employees.
CREATE TABLE employee_salary (
  -- `employee_id`: Unique identifier for each employee.
  -- INT data type is used for efficient storage of numeric IDs.
  -- NOT NULL constraint ensures that every record must have an employee ID.
  -- This field will be used to join with the `employee_demographics` table.
  employee_id INT NOT NULL,

  -- `first_name`: Stores the first name of the employee.
  -- VARCHAR(50) allows for variable-length strings up to 50 characters.
  -- NOT NULL constraint ensures that every record must have a first name.
  first_name VARCHAR(50) NOT NULL,

  -- `last_name`: Stores the last name of the employee.
  -- VARCHAR(50) allows for variable-length strings up to 50 characters.
  -- NOT NULL constraint ensures that every record must have a last name.
  last_name VARCHAR(50) NOT NULL,

  -- `occupation`: Stores the job title or occupation of the employee.
  -- VARCHAR(50) allows for variable-length strings up to 50 characters.
  -- This field can be used for role-based analysis or filtering.
  occupation VARCHAR(50),

  -- `salary`: Stores the salary of the employee.
  -- INT data type is used for whole numbers.
  -- CHECK constraint ensures salary is a positive value.
  salary INT CHECK (salary > 0),

  -- `dept_id`: Stores the department ID of the employee.
  -- INT data type is used for efficient storage of numeric IDs.
  -- This field will be used to join with the `parks_departments` table.
  dept_id INT,

  -- `created_at`: Timestamp for when the record was created.
  -- Automatically populated with the current timestamp during record insertion.
  -- Useful for auditing and tracking changes.
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  -- `updated_at`: Timestamp for when the record was last updated.
  -- Automatically updated to the current timestamp during record updates.
  -- Useful for auditing and tracking changes.
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Define the primary key for the table.
  -- The `employee_id` column is designated as the primary key to ensure
  -- each record is unique and can be efficiently retrieved.
  PRIMARY KEY (employee_id),

  -- Add a foreign key constraint to link `dept_id` to the `parks_departments` table.
  -- This ensures referential integrity between the `employee_salary` and `parks_departments` tables.
  CONSTRAINT fk_dept_id
    FOREIGN KEY (dept_id)
    REFERENCES parks_departments(dept_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- Add an index on `occupation` for faster role-based queries.
-- This is useful for analytical queries involving specific job titles.
CREATE INDEX idx_occupation ON employee_salary (occupation);

-- Add an index on `salary` for faster salary-based queries.
-- This is useful for analytical queries involving salary ranges.
CREATE INDEX idx_salary ON employee_salary (salary);

-- Add a unique constraint on `employee_id` to enforce data integrity.
-- This ensures no duplicate employee IDs can be inserted.
ALTER TABLE employee_salary ADD CONSTRAINT unique_employee_id UNIQUE (employee_id);

-- Add a comment to the table for better documentation.
-- This comment will appear in database metadata, making it easier for other developers to understand the table's purpose.
ALTER TABLE employee_salary COMMENT = 'Stores salary-related information for employees, including ID, name, occupation, salary, and department ID.';

-- Table created successfully.
-- You can now insert data into the `employee_salary` table using the `insert_employee_salary.sql` script.
-- Ensure that the data adheres to the constraints defined in this script.

-- End of Script.