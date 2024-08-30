# ParseJSONInStoredProcedure
Sending JSON to a Stored Procedure and Handling It in SQL Server

# Simple Json Data
DECLARE @JsonData NVARCHAR(MAX);

-- Create JSON data
SET @JsonData = N'{
    "LenderId": 1234,
    "ProvinceId": 56
}';
-- Pass JSON data to the stored procedure
EXEC SendSimpleJsonData @JsonInput = @JsonData;

# Nested JSON Data

DECLARE @JsonData NVARCHAR(MAX);

-- Create nested JSON data
SET @JsonData = N'{
    "Lender": {
        "LenderId": 1234,
        "Name": "ABC Bank"
    },
    "Location": {
        "ProvinceId": 56,
        "City": "Toronto"
    }
}';

-- Pass JSON data to the stored procedure
EXEC dbo.NestedJsonData @JsonInput = @JsonData;

# Handling JSON Array

DECLARE @JsonData NVARCHAR(MAX);

-- Create JSON data with an array
SET @JsonData = N'{
    "Lender": {
        "LenderId": 1234,
        "Name": "ABC Bank"
    },
    "Locations": [
        { "ProvinceId": 56, "City": "Toronto" },
        { "ProvinceId": 78, "City": "Vancouver" }
    ]
}';

-- Pass JSON data to the stored procedure
EXEC [dbo].NestedArrayJSON @JsonInput = @JsonData;
