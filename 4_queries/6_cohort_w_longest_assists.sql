-- Get the cohort with the longest average duration of assistance requests.
-- The same requirements as the previous query, but only return the single row with the longest average.

SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_time
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON student_id = students.id
GROUP BY cohorts.name
-- order longest to shortest, then only return 1 (1st) entry (longest)
ORDER BY average_assistance_time DESC
LIMIT 1;

-- Expected Result:
--  name  | average_assistance_time
-- -------+-------------------------
--  MAR12 | 00:15:44.556041
-- (1 row)
