CREATE TABLE IF NOT EXISTS public.categories(
    "categoryID" INT NOT NULL PRIMARY KEY,
    "categoryName" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "picture" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.shippers(
    "shipperID" INT NOT NULL PRIMARY KEY,
    "companyName" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.customers(
    "customerID" VARCHAR(255) NOT NULL PRIMARY KEY,
    "companyName" VARCHAR(255) NOT NULL,
    "contactName" VARCHAR(255) NOT NULL,
    "contactTitle" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "region" VARCHAR(255),
    "postalCode" VARCHAR(255),
    "country" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "fax" VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.regions(
    "regionID" INT NOT NULL PRIMARY KEY,
    "regionDescription" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.suppliers(
    "supplierID" INT NOT NULL PRIMARY KEY,
    "companyName" VARCHAR(255) NOT NULL,
    "contactName" VARCHAR(255) NOT NULL,
    "contactTitle" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "region" VARCHAR(255),
    "postalCode" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "fax" VARCHAR(255),
    "homePage" VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.employees(
    "employeeID" INT NOT NULL PRIMARY KEY,
    "lastName" VARCHAR(255) NOT NULL,
    "firstName" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "titleOfCourtesy" VARCHAR(255) NOT NULL,
    "birthDate" DATE NOT NULL,
    "hireDate" DATE NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "region" VARCHAR(255),
    "postalCode" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "homePhone" VARCHAR(255) NOT NULL,
    "extension" VARCHAR(255) NOT NULL,
    "photo" TEXT NOT NULL,
    "notes" TEXT NOT NULL,
    "reportsTo" INT,
    "photoPath" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.products(
    "productID" INT NOT NULL PRIMARY KEY,
    "productName" VARCHAR(255) NOT NULL,
    "supplierID" INT NOT NULL,
    "categoryID" INT NOT NULL,
    "quantityPerUnit" VARCHAR(255) NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "unitsInStock" INT NOT NULL,
    "unitsOnOrder" INT NOT NULL,
    "reorderLevel" INT NOT NULL,
    "discontinued" INT NOT NULL,
    FOREIGN KEY ("supplierID") REFERENCES public.suppliers ("supplierID"),
    FOREIGN KEY ("categoryID") REFERENCES public.categories ("categoryID")
);

CREATE TABLE IF NOT EXISTS public.territories(
    "territoryID" INT NOT NULL PRIMARY KEY,
    "territoryDescription" VARCHAR(255) NOT NULL,
    "regionID" INT NOT NULL,
    FOREIGN KEY ("regionID") REFERENCES public.regions ("regionID")
);

CREATE TABLE IF NOT EXISTS public.employee_territories(
    "employeeID" INT NOT NULL,
    "territoryID" INT NOT NULL,
    PRIMARY KEY ("employeeID", "territoryID"),
    FOREIGN KEY ("employeeID") REFERENCES public.employees ("employeeID"),
    FOREIGN KEY ("territoryID") REFERENCES public.territories ("territoryID")
);

CREATE TABLE IF NOT EXISTS public.orders(
    "orderID" INT NOT NULL PRIMARY KEY,
    "customerID" VARCHAR(255) NOT NULL,
    "employeeID" INT NOT NULL,
    "orderDate" DATE NOT NULL,
    "requiredDate" DATE NOT NULL,
    "shippedDate" DATE,
    "shipVia" INT NOT NULL,
    "freight" DOUBLE PRECISION NOT NULL,
    "shipName" VARCHAR(255) NOT NULL,
    "shipAddress" VARCHAR(255) NOT NULL,
    "shipCity" VARCHAR(255) NOT NULL,
    "shipRegion" VARCHAR(255),
    "shipPostalCode" VARCHAR(255),
    "shipCountry" VARCHAR(255) NOT NULL,
    FOREIGN KEY ("customerID") REFERENCES public.customers ("customerID"),
    FOREIGN KEY ("employeeID") REFERENCES public.employees ("employeeID"),
    FOREIGN KEY ("shipVia") REFERENCES public.shippers ("shipperID")
);

CREATE TABLE IF NOT EXISTS public.order_details(
    "orderID" INT NOT NULL,
    "productID" INT NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "quantity" INT NOT NULL,
    "discount" DOUBLE PRECISION NOT NULL,
    PRIMARY KEY ("orderID", "productID"),
    FOREIGN KEY ("orderID") REFERENCES public.orders ("orderID"),
    FOREIGN KEY ("productID") REFERENCES public.products ("productID")
);