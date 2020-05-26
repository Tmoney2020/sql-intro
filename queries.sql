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
