USE CodeSchool
GO


--Q31: List the average score amongst 17 year olds, 18 year olds, and so on.

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

SELECT YEAR(students.birthday) AS birthyear, ROUND(AVG([average_score].average_score),2) AS average_score
FROM students
INNER JOIN [average_score]
ON [average_score].student_id = students.id
GROUP BY YEAR(students.birthday)
ORDER BY YEAR(students.birthday)
GO

DROP VIEW [average_score]
GO