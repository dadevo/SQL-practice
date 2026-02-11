USE CodeSchool
GO


--Q23: Output one table per track at once, include only the students from the last class that was added to this track.

CREATE FUNCTION ufn_lastClass (@trackID CHAR(2))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM students
    WHERE students.track_id = @trackID AND students.track_number = (
        SELECT TOP 1 track_number
        FROM students
        WHERE students.track_id = @trackID
        ORDER BY track_number DESC
    )
)
GO

SELECT * FROM ufn_lastClass('cs')
GO

SELECT * FROM ufn_lastClass('ds')
GO

SELECT * FROM ufn_lastClass('sa')
GO

SELECT * FROM ufn_lastClass('sd')
GO

DROP FUNCTION ufn_lastClass
GO