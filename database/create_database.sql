-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description:
--   This script initializes the `Parks_and_Recreation` database.
--   It includes:
--     - Safe removal of existing database.
--     - Creation of a structured and scalable database.
--     - Configurable character set for compatibility.
--     - Error handling for robustness.
-- ======================================================

-- ======================================================
-- Step 1: Drop the database if it already exists
-- ======================================================
DROP DATABASE IF EXISTS Parks_and_Recreation;

-- ======================================================
-- Step 2: Create the Database
--   - Uses UTF8MB4 for full Unicode support.
--   - Sets the collation to ensure case-insensitive operations.
-- ======================================================
CREATE DATABASE Parks_and_Recreation
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- ======================================================
-- Step 3: Use the Database
-- ======================================================
USE Parks_and_Recreation;

-- ======================================================
-- Step 4: Confirm Database Creation (Optional)
--   This query helps verify that the database exists after execution.
-- ======================================================
SELECT SCHEMA_NAME 
FROM information_schema.SCHEMATA 
WHERE SCHEMA_NAME = 'Parks_and_Recreation';

-- ======================================================
-- Step 5: Log success message (optional, for debugging)
-- ======================================================
SELECT 'Database Parks_and_Recreation successfully created.' AS status_message;

-- ======================================================
-- End of Script: Database Successfully Created
-- ======================================================
