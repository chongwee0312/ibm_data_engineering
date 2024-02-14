-- Load data into departments table
-- Row import failed with error: ("Duplicate entry '5' for key 'departments.PRIMARY'", 1062)
SELECT * FROM departments;

-- Drop the primary key and reimport the data
ALTER TABLE departments
DROP PRIMARY KEY;

TRUNCATE TABLE departments;

SELECT * FROM departments;

-- The row is actually a duplicate row, we can drop the row
DELETE FROM departments
WHERE manager_id = 30004;

-- Reset the DEPT_ID_DEP As the primary key
ALTER TABLE departments
ADD PRIMARY KEY (DEPT_ID_DEP);

SELECT * FROM departments;

-- Load data into employees table
-- Row import failed with error: ("Incorrect date value: '01/09/1976' for column 'B_DATE' at row 1", 1292)
SELECT * FROM employees;

-- Convert the datatype of B_DATE into varchar and reimport the data
ALTER TABLE employees
MODIFY B_DATE CHAR(10);

SELECT * FROM employees;

-- Convert the datatype of B_DATE back to datetime
UPDATE employees
SET B_DATE = str_to_date(B_DATE, '%m/%d/%Y');

SELECT * FROM employees;

-- Load data into job_history table
-- Row import failed with error: ("Incorrect date value: '08/01/2000' for column 'START_DATE' at row 1", 1292)
SELECT * FROM job_history;

-- Same issue as the employees table
-- Convert the datatype of START_DATE into varchar and reimport the data
ALTER TABLE job_history
MODIFY START_DATE CHAR(10);

SELECT * FROM job_history;

-- Convert the datatype of B_DATE back to datetime
UPDATE job_history
SET START_DATE = str_to_date(START_DATE, '%m/%d/%Y');

SELECT * FROM job_history;

-- Load data into jobs table
-- Row import failed with error: ("Data too long for column 'JOB_TITLE' at row 1", 1406)
SELECT * FROM jobs;

-- Change the varchar length of job_title and reimport the data
ALTER TABLE jobs
MODIFY job_title VARCHAR(30);

TRUNCATE TABLE jobs;

SELECT * FROM jobs;

-- Load data into locations table
-- No issue
SELECT * FROM locations;