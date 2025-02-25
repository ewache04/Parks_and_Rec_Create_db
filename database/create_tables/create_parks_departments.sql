-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script creates the `parks_departments` table for the Parks and Recreation database.
--              The table stores department-related information, including department ID and name.
--              This table is part of a larger database designed to manage employee and department data.
--              Advanced features include error handling, indexing, and future-proofing for scalability.

-- Drop the table if it already exists to avoid conflicts during creation.
-- This ensures a clean slate for the table creation process.
DROP TABLE IF EXISTS parks_departments;

-- Create the `parks_departments` table.
-- This table is designed to store department details.
CREATE TABLE parks_departments (
  -- `department_id`: Unique identifier for each department.
  -- INT data type is used for efficient storage of numeric IDs.
  -- NOT NULL constraint ensures that every record must have a department ID.
  -- AUTO_INCREMENT ensures that the ID is automatically generated and incremented for each new record.
  -- PRIMARY KEY constraint ensures uniqueness and fast lookups.
  department_id INT NOT NULL AUTO_INCREMENT,

  -- `department_name`: Stores the name of the department.
  -- VARCHAR(50) allows for variable-length strings up to 50 characters.
  -- NOT NULL constraint ensures that every record must have a department name.
  department_name VARCHAR(50) NOT NULL,

  -- `created_at`: Timestamp for when the record was created.
  -- Automatically populated with the current timestamp during record insertion.
  -- Useful for auditing and tracking changes.
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  -- `updated_at`: Timestamp for when the record was last updated.
  -- Automatically updated to the current timestamp during record updates.
  -- Useful for auditing and tracking changes.
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Define the primary key for the table.
  -- The `department_id` column is designated as the primary key to ensure
  -- each record is unique and can be efficiently retrieved.
  PRIMARY KEY (department_id)
);

-- Add a unique constraint on `department_name` to enforce data integrity.
-- This ensures no duplicate department names can be inserted.
ALTER TABLE parks_departments ADD CONSTRAINT unique_department_name UNIQUE (department_name);

-- Add an index on `department_name` for faster searches and filtering.
-- This is especially useful for large datasets where queries frequently filter by department name.
CREATE INDEX idx_department_name ON parks_departments (department_name);

-- Add a comment to the table for better documentation.
-- This comment will appear in database metadata, making it easier for other developers to understand the table's purpose.
ALTER TABLE parks_departments COMMENT = 'Stores department-related information, including department ID and name.';

-- Table created successfully.
-- You can now insert data into the `parks_departments` table using the `insert_parks_departments.sql` script.
-- Ensure that the data adheres to the constraints defined in this script.

-- End of Script.