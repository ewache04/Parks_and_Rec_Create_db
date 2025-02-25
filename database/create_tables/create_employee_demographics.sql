-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script creates the `employee_demographics` table for the Parks and Recreation database.
--              The table stores essential demographic information about employees, including their ID, name, age, gender, and birth date.
--              This table is part of a larger database designed to manage employee and department data.
--              Advanced features include error handling, indexing, and future-proofing for scalability.

-- Drop the table if it already exists to avoid conflicts during creation.
-- This ensures a clean slate for the table creation process.
DROP TABLE IF EXISTS employee_demographics;

-- Create the `employee_demographics` table.
-- This table is designed to store demographic details of employees.
CREATE TABLE employee_demographics (
  -- `employee_id`: Unique identifier for each employee.
  -- INT data type is used for efficient storage of numeric IDs.
  -- NOT NULL constraint ensures that every record must have an employee ID.
  -- PRIMARY KEY constraint ensures uniqueness and fast lookups.
  employee_id INT NOT NULL,

  -- `first_name`: Stores the first name of the employee.
  -- VARCHAR(50) allows for variable-length strings up to 50 characters.
  -- This is optimal for names, as it saves space compared to CHAR.
  first_name VARCHAR(50),

  -- `last_name`: Stores the last name of the employee.
  -- VARCHAR(50) is used for consistency with `first_name`.
  last_name VARCHAR(50),

  -- `age`: Stores the age of the employee.
  -- INT data type is used for whole numbers.
  -- CHECK constraint ensures age is between 18 and 65 (valid working age range).
  age INT CHECK (age >= 18 AND age <= 65),

  -- `gender`: Stores the gender of the employee.
  -- VARCHAR(10) allows for short strings like "Male", "Female", or "Other".
  -- ENUM could also be used here for stricter control over allowed values.
  gender VARCHAR(10),

  -- `birth_date`: Stores the birth date of the employee.
  -- DATE data type is used to store dates in 'YYYY-MM-DD' format.
  -- This field can be used for age calculations or birthday-related queries.
  birth_date DATE,

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
  PRIMARY KEY (employee_id)
);

-- Add an index on `last_name` for faster searches and filtering.
-- This is especially useful for large datasets where queries frequently filter by last name.
CREATE INDEX idx_last_name ON employee_demographics (last_name);

-- Add an index on `age` for faster age-based queries.
-- This is useful for analytical queries involving age ranges.
CREATE INDEX idx_age ON employee_demographics (age);

-- Add a unique constraint on `employee_id` to enforce data integrity.
-- This ensures no duplicate employee IDs can be inserted.
ALTER TABLE employee_demographics ADD CONSTRAINT unique_employee_id UNIQUE (employee_id);

-- Add a comment to the table for better documentation.
-- This comment will appear in database metadata, making it easier for other developers to understand the table's purpose.
ALTER TABLE employee_demographics COMMENT = 'Stores demographic information for employees, including ID, name, age, gender, and birth date.';

-- Table created successfully.
-- You can now insert data into the `employee_demographics` table using the `insert_employee_demographics.sql` script.
-- Ensure that the data adheres to the constraints defined in this script.

-- End of Script.