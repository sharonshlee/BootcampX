SELECT c.name as cohort_name, count(st.*) as student_count
FROM students st
JOIN cohorts c
ON st.cohort_id = c.id
GROUP BY c.name
HAVING count(st.*) >= 18
ORDER BY student_count;