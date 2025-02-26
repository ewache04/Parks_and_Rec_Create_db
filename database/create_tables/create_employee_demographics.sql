-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script creates the `employee_demographics` table.

-- Drop the table if it already exists
DROP TABLE IF EXISTS employee_demographics;

-- Create the table
CREATE TABLE employee_demographics (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT CHECK (age >= 18 AND age <= 65),
    gender VARCHAR(10),
    birth_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (employee_id)
);

-- Add an index on last_name
CREATE INDEX idx_last_name ON employee_demographics (last_name);

-- Add an index on age
CREATE INDEX idx_age ON employee_demographics (age);

-- Add a unique constraint on employee_id
ALTER TABLE employee_demographics ADD CONSTRAINT unique_employee_id UNIQUE (employee_id);

-- Add a comment to the table
ALTER TABLE employee_demographics COMMENT = 'Stores demographic information for employees, including ID, name, age, gender, and birth date.';

-- End of Script.