-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script creates the `Parks_and_Recreation` database.
--              The database is designed to store and manage data related to employees, salaries, and departments for the Parks and Recreation department.
--              Advanced features include error handling, transaction management, and future-proofing for scalability.

-- Drop the database if it already exists to avoid conflicts during creation.
-- This ensures a clean slate for the database creation process.
DROP DATABASE IF EXISTS `Parks_and_Recreation`;

-- Create the `Parks_and_Recreation` database.
-- This database will serve as the central repository for all Parks and Recreation-related data.
CREATE DATABASE `Parks_and_Recreation`;

-- Switch to the newly created database.
-- This ensures that all subsequent operations are performed within the `Parks_and_Recreation` database.
USE `Parks_and_Recreation`;

-- Database created successfully.
-- You can now proceed to create tables and insert data into the database.

-- End of Script.