-- List each assignment with the total number of assistance requests with it.
-- Select the assignment's id, day, chapter, name and the total assistances.
-- Order by total assistances in order of most to least.
SELECT a.id, a.name, a.day, a.chapter, count(ar.assignment_id) as total_requests
FROM assignments a
JOIN assistance_requests ar ON a.id = ar.assignment_id
GROUP BY a.id, a.name, a.day, a.chapter, ar.assignment_id
ORDER BY total_requests DESC





--  id  |       name       | day | chapter |total_requests 
-- -----+------------------+-----+---------+------------------
--  424 | Ullam cumque     |  51 |      12 |           143
--  423 | Culpa esse sint  |  51 |      11 |           113
--   45 | Quia quasi       |   5 |       7 |            86
--   50 | A rerum          |   6 |       5 |            83
--  141 | Illo error dolor |  17 |       9 |            82
--  ...
-- (424 rows)