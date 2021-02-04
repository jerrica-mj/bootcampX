-- The same query as before, but only return rows where total assignments is greater than or equal to 10.

SELECT day, count(*) as total_assignments
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

-- Expected Result:
-- day | total_assignments -----+-------------------
--    1 |                11 9 |                12 22 |                10 23 |                10 24 |                10 ...
-- (15 rows)