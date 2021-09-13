SELECT SUM(duration) as total_duration
FROM assignment_submissions a_s
JOIN students s on a_s.student_id = s.id
JOIN cohorts c on s.cohort_id = c.id
WHERE c.name = 'FEB12';