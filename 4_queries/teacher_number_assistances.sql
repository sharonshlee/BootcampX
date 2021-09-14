-- Perform the same query as before, but include the number of assistances as well.

  SELECT t.name as teacher, c.name as cohort, count(ar) as total_assistances
  FROM assistance_requests ar
  JOIN teachers t ON ar.teacher_id = t.id
  JOIN students st ON ar.student_id = st.id
  JOIN cohorts c ON st.cohort_id = c.id
  WHERE c.name = 'JUL02' 
  GROUP BY t.name, c.name
  ORDER BY t.name 


-- Expected Result
--  teacher       | cohort | total_assistances 
-- --------------------+--------+-------------------
--  Cheyanne Powlowski | JUL02  |               336
--  Georgiana Fahey    | JUL02  |               158
--  Helmer Rodriguez   | JUL02  |               157
--  Jadyn Bosco        | JUL02  |               177
-- ...
-- (8 rows)
