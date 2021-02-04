-- Get the names of all students in a single cohort

SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

-- Expected Output:
-- id |       name ----+-------------------
--  1 | Armand Hilll 13 | Brian Jones 16 | Carmel Grant 14 | Clint Cremin 17 | Colten Gutkowski ...
-- (18 rows)