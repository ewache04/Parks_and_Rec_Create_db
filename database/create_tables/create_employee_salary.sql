-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025

-- Description: This script creates the `employee_salary` table.

-- Drop the table if it already exists
DROP TABLE IF EXISTS employee_salary;

-- Create the table
CREATE TABLE employee_salary (
    employee_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(50),
    salary INT CHECK (salary > 0),
    dept_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (employee_id),
    CONSTRAINT fk_dept_id
        FOREIGN KEY (dept_id)
        REFERENCES parks_departments(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Add an index on occupation
CREATE INDEX idx_occupation ON employee_salary (occupation);

-- Add an index on salary
CREATE INDEX idx_salary ON employee_salary (salary);

-- Add a unique constraint on employee_id
ALTER TABLE employee_salary ADD CONSTRAINT unique_employee_id UNIQUE (employee_id);

-- Add a comment to the table
ALTER TABLE employee_salary COMMENT = 'Stores salary-related information for employees, including ID, name, occupation, salary, and department ID.';

-- End of Script.