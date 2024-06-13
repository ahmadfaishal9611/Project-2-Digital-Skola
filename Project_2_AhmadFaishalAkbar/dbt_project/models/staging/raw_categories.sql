SELECT
    "categoryID",
    "categoryName",
    "description",
    "picture"
FROM
    {{ source('raw','categories') }}