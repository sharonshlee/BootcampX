SELECT st.name as student,
avg(a_s.duration) as average_assignment_duration, 
avg(a.duration) as average_estimated_duration
FROM students st
JOIN assignment_submissions a_s ON st.id = a_s.student_id
JOIN assignments a ON a_s.assignment_id = a.id
WHERE st.end_date IS NULL
GROUP BY student, end_date
HAVING avg(a_s.duration) < avg(a.duration)
ORDER BY average_assignment_duration;
