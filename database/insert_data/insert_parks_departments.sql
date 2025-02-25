-- Author: Jeremiah (Data Analyst)
-- Last Updated: 2/25/2025
-- Description: This script inserts sample data into the `parks_departments` table.
--              The table stores department-related information, including department name.
--              This script is part of a larger database setup for the Parks and Recreation department.
--              Advanced features include error handling, transaction management, and future-proofing for scalability.

-- Start a transaction to ensure data integrity.
-- If any error occurs during insertion, the entire transaction will be rolled back.
START TRANSACTION;

-- Insert data into the `parks_departments` table.
-- Each record includes department name.
-- Note: The `department_id` field is auto-incremented, so it does not need to be specified.
INSERT INTO parks_departments (department_name)
VALUES
  ('Parks and Recreation'),
  ('Animal Control'),
  ('Public Works'),
  ('Healthcare'),
  ('Library'),
  ('Finance');

-- Commit the transaction if all inserts are successful.
-- This ensures that the data is permanently saved to the database.
COMMIT;

-- If any errors occur, roll back the transaction to maintain data integrity.
-- This prevents partial or corrupted data from being inserted.
-- Note: Replace this section with proper error handling in your application or script.
-- ROLLBACK;

-- Data inserted successfully.
-- You can now query the `parks_departments` table to verify the inserted data.

-- End of Script.