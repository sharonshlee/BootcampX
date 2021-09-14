SELECT c.name as cohort, count(a_s.*) as total_submissions
FROM assignment_submissions a_s 
JOIN students st ON a_s.student_id = st.id
JOIN cohorts c ON st.cohort_id = c.id
GROUP BY c.name
ORDER BY total_submissions DESC;