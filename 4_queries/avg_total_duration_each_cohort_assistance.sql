-- Calculate the average total duration of assistance requests for each cohort.

SELECT avg(total_duration) as average_total_duration
FROM (
  SELECT c.name as cohort, sum(completed_at-started_at) as total_duration
  FROM assistance_requests ar
  JOIN students st ON ar.student_id = st.id
  JOIN cohorts c ON st.cohort_id = c.id
  GROUP BY c.name
  ORDER BY total_duration
 ) as total_durations;



--  average_total_duration 
-- ------------------------
--  555:22:25.909091
-- (1 row)
