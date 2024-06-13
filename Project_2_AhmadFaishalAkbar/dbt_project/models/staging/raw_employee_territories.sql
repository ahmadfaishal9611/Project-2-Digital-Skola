SELECT
    "employeeID",
    "territoryID"
FROM
    {{ source('raw','employee_territories') }}