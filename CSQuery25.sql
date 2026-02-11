USE CodeSchool
GO


--Q25: If there are students with duplicate names, are they in the same track or even class?

SELECT * FROM (
    SELECT students.name, occurence,
    CASE WHEN EXISTS (
        SELECT 1
        FROM (
            SELECT name, track_id
            FROM students
            GROUP BY name, track_id
            HAVING COUNT(name) > 1
        ) AS duplicate_tracks
        WHERE duplicate_tracks.name = students.name
        AND duplicate_tracks.track_id = students.track_id
    ) THEN students.track_id ELSE '-' END AS duplicate_track,
    CASE WHEN EXISTS (
        SELECT 1
        FROM (
            SELECT name, track_id, track_number
            FROM students
            GROUP BY name, track_id, track_number
            HAVING COUNT(name) > 1
        ) AS duplicate_classes
        WHERE duplicate_classes.name = students.name
        AND duplicate_classes.track_id = students.track_id
        AND duplicate_classes.track_number = students.track_number
    ) THEN CONVERT(CHAR(1), students.track_number) ELSE '-' END AS duplicate_class
    FROM students
    INNER JOIN (
        SELECT name, COUNT(name) AS occurence
        FROM students
        GROUP BY name
        HAVING COUNT(name) > 1
    ) AS duplicate_name
    ON students.name = duplicate_name.name
) AS data
WHERE NOT duplicate_track = '-' OR NOT duplicate_class = '-'
GROUP BY name, occurence, duplicate_track, duplicate_class
ORDER BY name