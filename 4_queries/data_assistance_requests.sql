SELECT t.name as teacher, st.name as student, asgt.name as assignment, (ar.completed_at - ar.started_at) as duration
FROM assistance_requests ar
JOIN teachers t ON t.id = ar.teacher_id
JOIN students st ON ar.student_id = st.id
JOIN assignments asgt ON ar.assignment_id = asgt.id
ORDER BY duration