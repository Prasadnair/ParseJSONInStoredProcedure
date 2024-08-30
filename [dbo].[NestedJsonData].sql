
CREATE OR ALTER   PROCEDURE [dbo].[NestedJsonData]
    @JsonInput NVARCHAR(MAX)
AS
BEGIN
    -- Extract values from the nested JSON input
    DECLARE @LenderId INT, @LenderName NVARCHAR(100), @ProvinceId INT, @City NVARCHAR(100);

    -- Extract values from the nested "Lender" object
    SET @LenderId = JSON_VALUE(@JsonInput, '$.Lender.LenderId');
    SET @LenderName = JSON_VALUE(@JsonInput, '$.Lender.Name');

    -- Extract values from the nested "Location" object
    SET @ProvinceId = JSON_VALUE(@JsonInput, '$.Location.ProvinceId');
    SET @City = JSON_VALUE(@JsonInput, '$.Location.City');

    -- Use the extracted values
    SELECT @LenderId AS LenderId, @LenderName AS LenderName, @ProvinceId AS ProvinceId, @City AS City;
END;
GO


