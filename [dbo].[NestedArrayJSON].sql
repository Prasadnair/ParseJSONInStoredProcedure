
CREATE OR ALTER   PROCEDURE [dbo].[NestedArrayJSON]
    @JsonInput NVARCHAR(MAX)
AS
BEGIN
    -- Extract the Lender details
    DECLARE @LenderId INT, @LenderName NVARCHAR(100);
    SET @LenderId = JSON_VALUE(@JsonInput, '$.Lender.LenderId');
    SET @LenderName = JSON_VALUE(@JsonInput, '$.Lender.Name');

    -- Parse the "Locations" array
    SELECT ProvinceId, City
    FROM OPENJSON(@JsonInput, '$.Locations')
    WITH (
        ProvinceId INT '$.ProvinceId',
        City NVARCHAR(100) '$.City'
    );
END;
GO


