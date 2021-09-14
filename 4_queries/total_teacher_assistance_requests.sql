SELECT count(ar.*) as total_assistance_requests, t.name
FROM teachers t
JOIN assistance_requests ar ON t.id = ar.teacher_id
WHERE t.name = 'Waylon Boehm'
GROUP BY t.name