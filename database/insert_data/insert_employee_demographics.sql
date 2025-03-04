-- ======================================================
-- Author: Jeremiah (Data Analyst)
-- Last Updated: 02/25/2025
-- Description: 
--   This script inserts sample data into the `employee_demographics` table.
--   It includes employee ID, first name, last name, age, gender, and birth date.
--   This script is part of a larger Parks and Recreation database system.
--   Features:
--     - Transaction management for data integrity.
--     - Scalable for future data expansions.
-- ======================================================

-- Start a transaction to ensure atomicity. 
START TRANSACTION;

-- ======================================================
-- Insert Data into `employee_demographics`
-- ======================================================
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
    (1,  'Leslie',       'Knope',          44, 'Female', '1979-09-25'),
    (2,  'Ron',          'Swanson',        55, 'Male',   '1968-05-21'),
    (3,  'Tom',          'Haverford',      36, 'Male',   '1987-03-04'),
    (4,  'April',        'Ludgate',        29, 'Female', '1994-03-27'),
    (5,  'Jerry',        'Gergich',        61, 'Male',   '1962-08-28'),
    (6,  'Donna',        'Meagle',         46, 'Female', '1977-07-30'),
    (7,  'Ann',          'Perkins',        35, 'Female', '1988-12-01'),
    (8,  'Chris',        'Traeger',        43, 'Male',   '1980-11-11'),
    (9,  'Ben',          'Wyatt',          38, 'Male',   '1985-07-26'),
    (10, 'Andy',         'Dwyer',          34, 'Male',   '1989-03-25'),
    (11, 'Mark',         'Brendanawicz',   40, 'Male',   '1983-06-14'),
    (12, 'Craig',        'Middlebrooks',   37, 'Male',   '1986-07-27'),
    (13, 'Perd',         'Hapley',         45, 'Male',   '1978-09-30'),
    (14, 'Jean-Ralphio', 'Saperstein',     32, 'Male',   '1991-04-01'),
    (15, 'Mona-Lisa',    'Saperstein',     30, 'Female', '1993-08-15'),
    (16, 'Orin',         'Redacted',       28, 'Male',   '1995-02-14'),
    (17, 'Shauna',       'Malwae-Tweep',   31, 'Female', '1992-11-22'),
    (18, 'Ethel',        'Beavers',        70, 'Female', '1953-12-03'),
    (19, 'Dennis',       'Feinstein',      50, 'Male',   '1973-07-19'),
    (20, 'Jennifer',     'Barkley',        42, 'Female', '1981-05-10'),
    (21, 'Sam',          'Smith',          29, 'Male',   '1994-06-15'),
    (22, 'Samantha',     'Sims',           33, 'Female', '1990-03-22'),
    (23, 'Eva',          'Evans',          27, 'Female', '1996-09-10'),
    (24, 'Olivia',       'Ortiz',          31, 'Female', '1992-07-07'),
    (25, 'Adam',         'Adams',          40, 'Male',   '1983-04-18'),
    (26, 'Ivy',          'Ingram',         26, 'Female', '1997-11-30'),
    (27, 'Uma',          'Underwood',      29, 'Female', '1994-08-12'),
    (28, 'Oscar',        'Olsen',          50, 'Male',   '1973-05-05'),
    (29, 'Emily',        'Elliott',        34, 'Female', '1989-10-20'),
    (30, 'Aaron',        'Aaronson',       39, 'Male',   '1984-12-25');

-- Commit the transaction if all inserts are successful.
COMMIT;

-- Log success message (optional, for debugging).
SELECT 'Data successfully inserted into employee_demographics.' AS status_message;

-- ======================================================
-- End of Script: Data Successfully Inserted
-- ======================================================
