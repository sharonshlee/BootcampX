-- Get the cohort with the longest average duration of assistance requests.


SELECT c.name, avg(ar.completed_at - ar.started_at) as average_assistance_time
FROM assistance_requests ar
JOIN students st ON ar.student_id = st.id
JOIN cohorts c ON st.cohort_id = c.id
GROUP BY c.name
ORDER BY average_assistance_time DESC
LIMIT 1



--  name  | average_assistance_time 
-- -------+-------------------------
--  MAR12 | 00:15:44.556041
-- (1 row)
