-- Get important data about each assistance request.
-- Select the teacher's name, student's name, assignment's name, and the duration of each assistance request.
-- Subtract completed_at by started_at to find the duration.
-- Order by the duration of the request.

SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN assignments ON assignment_id = assignments.id
JOIN students ON student_id = students.id
ORDER BY duration;


-- Expected Result:
--       teacher       |         student          |    assignment    | duration
-- --------------------+--------------------------+------------------+----------
--  Helmer Rodriguez   | Maximillian Pfannerstill | Expedita officia | 00:02:45
--  Roberto Towne      | Vivien Mosciski          | Ea totam iste    | 00:02:45
--  Georgiana Fahey    | Gene Carter              | Ut fuga          | 00:02:45
--  Cheyanne Powlowski | Vivien Mosciski          | Eum eaque        | 00:02:45
--  Roberto Towne      | Maximillia Willms        | Quibusdam est    | 00:03:00
-- (26299 rows)