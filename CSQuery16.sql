USE CodeSchool
GO


--Q16: Find the percentage of students failing (scoring below 7) tests.
SELECT ( 100 * (
    SELECT 1.0*COUNT(student_id)
    FROM scores
    WHERE ISNULL(linux,10) < 7
    OR ISNULL(python,10) < 7
    OR ISNULL(databases,10) < 7
    OR ISNULL(networking,10) < 7
    OR ISNULL(security,10) < 7
    OR ISNULL(java,10) < 7
    OR ISNULL("version control",10) < 7
    ) / (
    SELECT 1.0*COUNT(student_id)
    FROM scores
    )
) AS passed_percentage
GO