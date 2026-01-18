-- Task 2: Data Types, Constraints & Table Design
-- SQL Developer Internship - Elevate Labs

-- 1. Use existing database
USE intern_training_db;

-- 2. Drop table if already exists (for re-run safety)
DROP TABLE IF EXISTS students;

-- 3. Create students table with proper data types & constraints
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,        -- PRIMARY KEY
    name VARCHAR(100) NOT NULL,                        -- NOT NULL
    email VARCHAR(150) UNIQUE NOT NULL,                -- UNIQUE + NOT NULL
    age INT CHECK (age >= 18),                         -- CHECK constraint
    date_of_birth DATE NOT NULL,                       -- DATE data type
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- DEFAULT value
);

-- 4. Insert valid records
INSERT INTO students (name, email, age, date_of_birth)
VALUES
('Rahul Sharma', 'rahul@gmail.com', 22, '2002-05-12'),
('Anjali Verma', 'anjali@gmail.com', 21, '2003-03-18'),
('Suresh Kumar', 'suresh@gmail.com', 23, '2001-08-25');

-- 5. Try inserting invalid data (Constraint failure examples)

-- Duplicate email (UNIQUE constraint violation)
-- INSERT INTO students (name, email, age, date_of_birth)
-- VALUES ('Test User', 'rahul@gmail.com', 20, '2004-01-01');

-- Age below 18 (CHECK constraint violation)
-- INSERT INTO students (name, email, age, date_of_birth)
-- VALUES ('Young User', 'young@gmail.com', 16, '2008-02-02');

-- 6. Add a new column using ALTER TABLE
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15) UNIQUE;

-- 7. Rename a column
ALTER TABLE students
RENAME COLUMN phone_number TO mobile_number;

-- 8. Drop a column
ALTER TABLE students
DROP COLUMN mobile_number;

-- 9. Fetch all records to verify structure
SELECT * FROM students;
