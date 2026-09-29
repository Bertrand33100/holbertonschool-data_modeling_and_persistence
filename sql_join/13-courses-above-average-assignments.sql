SELECT courses.title AS course_title
FROM courses
LEFT JOIN assignments ON courses.id = assignments.course_id
GROUP BY courses.id, courses.title
HAVING COUNT(assignments.id) > (
    SELECT CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM courses)
    FROM assignments
)
ORDER BY course_title ASC;
