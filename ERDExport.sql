-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Occupation_Major" (
    "MajorID" int   NOT NULL,
    "Title" varchar   NOT NULL,
    CONSTRAINT "pk_Occupation_Major" PRIMARY KEY (
        "MajorID"
     )
);

CREATE TABLE "Occupation_Minor" (
    "MinorID" int   NOT NULL,
    "MajorID" varchar   NOT NULL,
    "Title" vanchar   NOT NULL,
    CONSTRAINT "pk_Occupation_Minor" PRIMARY KEY (
        "MinorID"
     )
);

CREATE TABLE "Occupation_Broad" (
    "BroadID" int   NOT NULL,
    "MinorID" int   NOT NULL,
    "Title" varchar   NOT NULL,
    CONSTRAINT "pk_Occupation_Broad" PRIMARY KEY (
        "BroadID"
     )
);

CREATE TABLE "Occupation_Detail" (
    "DetailID" int   NOT NULL,
    "BroadID" varchar   NOT NULL,
    "Title" varchar   NOT NULL,
    "Total_Emp" int   NOT NULL,
    CONSTRAINT "pk_Occupation_Detail" PRIMARY KEY (
        "DetailID"
     )
);

CREATE TABLE "Automation" (
    "DetailID" int   NOT NULL,
    "Percent_Auto" int   NOT NULL,
    "state" varchar   NOT NULL
);

CREATE TABLE "Region" (
    "Region" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "Region"
     )
);

ALTER TABLE "Occupation_Major" ADD CONSTRAINT "fk_Occupation_Major_MajorID" FOREIGN KEY("MajorID")
REFERENCES "Occupation_Minor" ("MajorID");

ALTER TABLE "Occupation_Minor" ADD CONSTRAINT "fk_Occupation_Minor_MinorID" FOREIGN KEY("MinorID")
REFERENCES "Occupation_Broad" ("MinorID");

ALTER TABLE "Occupation_Broad" ADD CONSTRAINT "fk_Occupation_Broad_BroadID" FOREIGN KEY("BroadID")
REFERENCES "Occupation_Detail" ("Title");

ALTER TABLE "Automation" ADD CONSTRAINT "fk_Automation_DetailID" FOREIGN KEY("DetailID")
REFERENCES "Occupation_Detail" ("DetailID");

ALTER TABLE "Region" ADD CONSTRAINT "fk_Region_State" FOREIGN KEY("State")
REFERENCES "Automation" ("state");

