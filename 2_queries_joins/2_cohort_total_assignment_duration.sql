-- Get the total amount of time that all students from a specific cohort have spent on all assignments.
-- This should work for any cohort but use FEB12 for now.
-- Select only the total amount of time as a single column.


SELECT sum(assignment_submissions.duration) as total_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';


-- Expected Result:
--  total_duration
-- ----------------
--          373501
-- (1 row)