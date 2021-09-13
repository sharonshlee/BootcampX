SELECT SUM(a_s.duration) as total_duration
FROM assignment_submissions a_s
JOIN students s
ON a_s.student_id = s.id
WHERE s.name = 'Ibrahim Schimmel';