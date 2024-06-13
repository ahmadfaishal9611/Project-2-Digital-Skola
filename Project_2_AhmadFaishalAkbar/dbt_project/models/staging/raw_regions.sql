SELECT
    "regionID",
    "regionDescription"
FROM
    {{ source('raw','regions') }}