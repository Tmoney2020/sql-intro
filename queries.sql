createdb CompanyDatabase

pgcli CompanyDatabase

CREATE TABLE "Employees" (
  "FullName"        TEXT,
  "Salary"          INT, 
  "JobPosition"     TEXT,
  "PhoneExtension"  INT,
  "IsPartTime"      TEXT
);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', 100000, 'Light Bulb Changer', 123, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Dirk Diggler', 5000000, 'Amature Film Maker', 696, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES('Patrick Bateman', 25000, 'Business Card Maker', 333, 'Yes');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jon Snow', 55000, 'Night Watchman', 835, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Robert Paulson', 33000, 'Soap Maker', 537, 'Yes');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Dexter Morgan', 250000, 'Lab Tech', 187, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES('Tucker Dogman', 57000, 'Cook', 444, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Bert Maclin', 10000, 'CEO', 111, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Ian Malcolm', 40000, 'Cook', 209, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Elliot Alderson', 1000000, 'IT', 934, 'No');

-- // Select all columns for all employees.
SELECT * FROM "Employees"; 

-- // Select only the full names and phone extensions for only full-time employees.
SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'No'; 

-- // Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Homer Simpson', 450, 'Software Developer', 198, 'Yes');


-- // Update all employees that are cooks to have a salary of 500.
UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';

--  // Delete all employees that have the full name of "Lazy Larry".
 DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

--  // Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.
 ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);




--//Adventure Mode - or if the table already exists 

-- // Setting the FullName to be NOT NULL
 ALTER TABLE "Employees" ALTER COLUMN "FullName" SET NOT NUll;

-- //adding an ID 
 ALTER TABLE "Employees" ADD COLUMN "Id" SERIAL PRIMARY KEY;



--  2nd day of homework

CREATE TABLE "Departments"
(
  "Id"              SERIAL PRIMARY KEY,
  "DepartmentName"  TEXT,
  "Buiding"         TEXT
);

-- ALTER TABLE "Movies" ADD COLUMN "RatingId" INTEGER NULL REFERENCES "Ratings" ("Id");
ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

-- Add product Table 
CREATE TABLE "Orders"
(
  "Id"              SERIAL PRIMARY KEY,
  "OrderNumber"     TEXT,
  "DatePlaced"      TIMESTAMP,
  "EMAIL"           TEXT
);

-- Add table products
CREATE TABLE "Products"
(
  "Price"           DOUBLE PRECISION,
  "Name"            TEXT,
  "Description"     TEXT,
  "QuantityInStock" INT
);

-- relate the 2 tables we created 
ALTER TABLE "Products" ADD COLUMN "Id" SERIAL PRIMARY KEY;

CREATE TABLE "ProductOrders"
(
  "Id"              SERIAL PRIMARY KEY,
  "OrderId"         INTEGER REFERENCES "Orders" ("Id"),
  "ProductsId"      INTEGER REFERENCES "Products" ("Id"),
  "OrderQuantity"   INT
);


INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing', 'North');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', 40000, 'Programer', 123, 'false', 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', 80000, 'Manager', 234, 'false', 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', 456, 'true', 2);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (12.45, 'Widget', 'The Original Widget', 100);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (99.99, 'Flowbee', 'Perfect for haircuts', 3);

-- inserting new order X529
INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "EMAIL")
VALUES ('X529','2020-01-01 16:55:00' ,'person@example.com');

--  Add an order quantity of 3 for the product named Widget to the order X529
INSERT INTO "ProductOrders" ("OrderId", "ProductsId", "OrderQuantity") VALUES (2,1,3);


--  Add an order quantity of 2 for the product named Flowbee to the order X529
INSERT INTO "ProductOrders" ("OrderId", "ProductsId", "OrderQuantity") VALUES (2,2,2);

SELECT "ProductOrders"."Id", "Products"."Name", "Orders"."OrderNumber", "ProductOrders"."OrderQuantity", "Orders"."Id"
FROM "Orders"
Join "ProductOrders" ON "ProductOrders"."OrderId" = "Orders"."Id"
Join "Products" ON "Products"."Id" = "ProductOrders"."ProductsId";

--  Given a department id, return all employees in the department.
CREATE TABLE "Departments"
(
  "Id"              SERIAL PRIMARY KEY,
  "DepartmentName"  TEXT,
  "Buiding"         TEXT
);

--  Given a department id, return all employees in the department.
SELECT "Employees"."FullName", "Departments"."Id"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id";


--  Given a department name, return all the phone extensions.
SELECT "Departments"."DepartmentName", "Employees"."PhoneExtension"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id";

--  Find all orders that contain the product id of 2.
SELECT "Products"."Name", "Orders"."OrderNumber", "ProductOrders"."OrderQuantity", "Products"."Id"
FROM "Orders"
Join "ProductOrders" ON "ProductOrders"."OrderId" = "Orders"."Id"
Join "Products" ON "Products"."Id" = 2;


-- Delete 
DELETE FROM "ProductOrders" WHERE "ProductsId" = 2 AND "OrderId" = 2;


