-- Get the name of all teachers that performed an assistance request during a cohort.
-- Select the instructor's name and the cohort's name.
-- Don't repeat the instructor's name in the results list.
-- Order by the instructor's name.
-- This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here.

SELECT DISTINCT t.name as teacher, c.name as cohort
FROM assistance_requests ar
JOIN teachers t ON ar.teacher_id = t.id
JOIN students st ON ar.student_id = st.id
JOIN cohorts c ON st.cohort_id = c.id
WHERE c.name = 'JUL02'
--GROUP BY t.name, c.name
ORDER BY t.name



-- Expected Result
--       teacher       | cohort 
-- --------------------+--------
--  Cheyanne Powlowski | JUL02
--  Georgiana Fahey    | JUL02
--  Helmer Rodriguez   | JUL02
--  Jadyn Bosco        | JUL02
-- ...
-- (8 rows)


