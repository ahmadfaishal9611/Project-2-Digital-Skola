SELECT
    "orderID",
    "productID",
    "unitPrice",
    "quantity",
    "discount"
FROM
    {{ source('raw','order_details') }}