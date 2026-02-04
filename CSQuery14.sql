USE CodeSchool
GO


--Q14: Looking at scores, find the hardest subject per track.
CREATE VIEW [average_track_score] AS
    SELECT * FROM (
        SELECT track_id,
        AVG(CONVERT(real,linux)) AS linux,
        AVG(CONVERT(real,python)) AS python,
        AVG(CONVERT(real,databases)) AS databases,
        AVG(CONVERT(real,networking)) AS networking,
        AVG(CONVERT(real,security)) AS security,
        AVG(CONVERT(real,java)) AS java,
        AVG(CONVERT(real,"version control")) AS version_control
        FROM scores
        INNER JOIN students
        ON scores.student_id = students.id
        GROUP BY track_id
    ) AS scores
    UNPIVOT (
        average_score FOR course IN (linux,python,databases,networking,security,java,version_control)
    ) AS pivoted
GO

SELECT min_track.track_id, min_score, course
FROM [average_track_score]
INNER JOIN (
    SELECT track_id, MIN(average_score) AS min_score
    FROM [average_track_score]
    GROUP BY track_id
) AS min_track
ON min_track.track_id = [average_track_score].track_id AND min_track.min_score = [average_track_score].average_score
ORDER BY track_id
GO

DROP VIEW [average_track_score]
GO