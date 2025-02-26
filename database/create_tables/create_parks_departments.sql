-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Author: Jeremiah (Data Analyst)
-- Last Updated: [Date]
-- Description: This script creates the `parks_departments` table.

-- Drop the table if it already exists
DROP TABLE IF EXISTS parks_departments;

-- Create the table
CREATE TABLE parks_departments (
    department_id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (department_id)
);

-- Add a unique constraint on department_name
ALTER TABLE parks_departments ADD CONSTRAINT unique_department_name UNIQUE (department_name);

-- Add an index on department_name
CREATE INDEX idx_department_name ON parks_departments (department_name);

-- Add a comment to the table
ALTER TABLE parks_departments COMMENT = 'Stores department-related information, including department ID and name.';

-- End of Script.