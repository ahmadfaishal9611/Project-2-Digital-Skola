SELECT
    "territoryID",
    "territoryDescription",
    "regionID"
FROM
    {{ source('raw','territories') }}