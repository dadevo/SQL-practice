USE CodeSchool
GO


--Q21: Since teachers are coupled with tracks, not subjects, generate a table of who teaches what.
SELECT teacher_id, teachers.name, tracks.name
FROM teachers
INNER JOIN tracks
ON tracks.teacher_id = teachers.id
GO