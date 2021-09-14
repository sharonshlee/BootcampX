-- Select the cohort's name and the average assistance request time.
-- Order the results from shortest average to longest.


SELECT c.name, avg(ar.completed_at - ar.started_at) as average_assistance_time
FROM assistance_requests ar
JOIN students st ON ar.student_id = st.id
JOIN cohorts c ON st.cohort_id = c.id
GROUP BY c.name
ORDER BY average_assistance_time



--  name  | average_assistance_time 
-- -------+-------------------------
--  SEP24 | 00:13:23.071576
--  JUL30 | 00:13:23.956547
--  FEB12 | 00:13:42.66022
--  JUN04 | 00:13:45.974562
--  MAY07 | 00:13:58.745754
-- ...
-- (11 rows)