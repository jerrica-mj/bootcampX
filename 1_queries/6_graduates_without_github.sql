-- Get all graduates without a linked Github account.

SELECT name, email, phone
FROM students
WHERE end_date IS NOT NULL
AND Github IS NULL;

-- Expected Result:
-- name        |             email             |    phone -------------------+-------------------------------+--------------
--  Herminia Smitham  | sawayn.sarina@yahoo.com       | 778-251-5094 Jacinthe Kautzer  | litzy_fay@hilpert.net         | 075-883-5570 Bernardo Turcotte | margarita.anderson@paolo.name | 814-473-6929 Eloisa Quigley    | schmidt.ansel@gmail.com       | 276-965-2022 Tiana Altenwerth  | zelda.stanton@yahoo.com       | 448-872-0954 Hailie Kutch      | zora.corkery@goldner.net      | 249-763-9998 (6 rows)
