SELECT st.name as student, avg(a_s.duration) as average_assignment_duration
FROM students st
JOIN assignment_submissions a_s ON st.id = a_s.student_id
WHERE st.end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;