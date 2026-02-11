USE CodeSchool
GO


--Q27: List all students in a single table, sorted by year first, then by track, then by class, then by highest average score per student.

CREATE VIEW [average_score] AS
    SELECT student_id,AVG(score) AS average_score
    FROM (
        SELECT student_id, CONVERT(real,linux) AS score FROM scores
        UNION ALL SELECT student_id, python AS score FROM scores
        UNION ALL SELECT student_id, databases AS score FROM scores
        UNION ALL SELECT student_id, networking AS score FROM scores
        UNION ALL SELECT student_id, security AS score FROM scores
        UNION ALL SELECT student_id, java AS score FROM scores
        UNION ALL SELECT student_id, "version control" AS score FROM scores
    ) AS score_table
    GROUP BY student_id
GO

SELECT students.name, students.birthday, classes.start_date, students.track_id, students.track_number, [average_score].average_score
FROM students
INNER JOIN [average_score]
ON [average_score].student_id = students.id
INNER JOIN classes
ON classes.number = students.track_number AND classes.track_id = students.track_id
ORDER BY classes.start_date, students.track_id, students.track_number, [average_score].average_score DESC
GO

DROP VIEW [average_score]
GO