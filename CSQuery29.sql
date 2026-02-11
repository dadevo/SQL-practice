USE CodeSchool
GO


--Q29: Do students in the data scientist track have higher score for the database exam than students in other tracks?

SELECT tracks.name, AVG(CONVERT(decimal(2), scores.databases)) AS average_score
FROM students
INNER JOIN scores
ON scores.student_id = students.id
INNER JOIN tracks
ON tracks.id = students.track_id
GROUP BY tracks.name
ORDER BY AVG(CONVERT(decimal(2), scores.databases)) DESC
GO