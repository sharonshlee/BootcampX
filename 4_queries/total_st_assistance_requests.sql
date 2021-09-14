SELECT count(ar.*) as total_assistances, st.name
FROM assistance_requests ar
JOIN students st ON ar.student_id = st.id
WHERE st.name = 'Elliot Dickinson'
GROUP BY st.name