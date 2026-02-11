USE CodeSchool
GO


--Q30: Do students in the cyber security track have higher scores for the security exam than students in other tracks?

SELECT tracks.name, AVG(CONVERT(decimal(2), scores.security)) AS average_score
FROM students
INNER JOIN scores
ON scores.student_id = students.id
INNER JOIN tracks
ON tracks.id = students.track_id
GROUP BY tracks.name
ORDER BY AVG(CONVERT(decimal(2), scores.security)) DESC
GO