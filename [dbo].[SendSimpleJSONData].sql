CREATE OR ALTER   PROCEDURE [dbo].[SendSimpleJSONData]
    @JsonInput NVARCHAR(MAX)
AS
BEGIN
    -- Extract values from the JSON input
    DECLARE @LenderId INT, @ProvinceId INT;

    SET @LenderId = JSON_VALUE(@JsonInput, '$.LenderId');
    SET @ProvinceId = JSON_VALUE(@JsonInput, '$.ProvinceId');

    -- Use the extracted values for further processing
    SELECT @LenderId AS LenderId, @ProvinceId AS ProvinceId;
END;
GO


