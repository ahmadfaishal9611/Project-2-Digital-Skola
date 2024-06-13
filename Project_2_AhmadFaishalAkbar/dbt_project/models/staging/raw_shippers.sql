SELECT
    "shipperID",
    "companyName",
    "phone"
FROM
    {{ source('raw','shippers') }}