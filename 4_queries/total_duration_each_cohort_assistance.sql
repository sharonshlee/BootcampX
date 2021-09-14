-- Get the total duration of all assistance requests for each cohort.

SELECT c.name as cohort, sum(completed_at-started_at) as total_duration
FROM assistance_requests ar
JOIN students st ON ar.student_id = st.id
JOIN cohorts c ON st.cohort_id = c.id
GROUP BY c.name
ORDER BY total_duration


--  cohort | total_duration 
-- --------+----------------
--  JUL30  | 390:35:20
--  AUG27  | 398:19:00
--  JUL02  | 453:50:30
--  NOV19  | 462:34:40
--  MAY07  | 480:10:55
--  ...
--  (11 rows)
