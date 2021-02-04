-- Select the total number of students who were in the first 3 cohorts.

SELECT count(*)
FROM students
-- WHERE cohort_id <= 3;  --> this is less flexible, more redundant for multiple cohorts
WHERE cohort_id IN (1,2,3);

-- Expected Output:
-- count -------
--     48 (1 row)