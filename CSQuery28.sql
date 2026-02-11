USE CodeSchool
GO


--Q28: Find out if students with longer names have higher average scores.

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

SELECT LEN(students.name) AS name_length, AVG([average_score].average_score) AS average_score
FROM students
INNER JOIN [average_score]
ON [average_score].student_id = students.id
GROUP BY LEN(students.name)
ORDER BY AVG([average_score].average_score) DESC
GO

DROP VIEW [average_score]
GO