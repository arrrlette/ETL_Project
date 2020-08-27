-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

--DROP TABLES
DROP TABLE occupation_detail;
DROP TABLE automation;
DROP TABLE occupation_broad;
DROP TABLE occupation_minor;
DROP TABLE occupation_major;

--CREATE TABLES
CREATE TABLE "occupation_detail" (
    "detail_id" int   NOT NULL,
    "OCC_TITLE" varchar   NOT NULL,
    "broad_id" int   NOT NULL,
    "total_emp" int   NOT NULL,
    "a_mean" VARCHAR   NOT NULL,
    "a_median" VARCHAR   NOT NULL,
    "h_mean" VARCHAR   NOT NULL,
    "h_median" VARCHAR   NOT NULL,
    CONSTRAINT "pk_occupation_detail" PRIMARY KEY (
        "detail_id"
     )
);

CREATE TABLE "occupation_broad" (
    "broad_id" int   NOT NULL,
    "OCC_TITLE" VARCHAR   NOT NULL,
    "minor_id" int   NOT NULL,
    CONSTRAINT "pk_occupation_broad" PRIMARY KEY (
        "broad_id"
     )
);


CREATE TABLE "occupation_minor" (
    "minor_id" int   NOT NULL,
    "OCC_TITLE" VARCHAR   NOT NULL,
    "major_id" int   NOT NULL,
    CONSTRAINT "pk_occupation_minor" PRIMARY KEY (
        "minor_id"
     )
);

CREATE TABLE "occupation_major" (
    "major_id" int   NOT NULL,
    "OCC_TITLE" VARCHAR   NOT NULL,
    CONSTRAINT "pk_occupation_major" PRIMARY KEY (
        "major_id"
     )
);

CREATE TABLE "automation" (
    "detail_id" int   NOT NULL,
    "occupation" VARCHAR   NOT NULL,
    "probability" float   NOT NULL,
    "Alabama" VARCHAR   NOT NULL,
    "Alaska" VARCHAR   NOT NULL,
    "Arizona" VARCHAR   NOT NULL,
    "Arkansas" VARCHAR   NOT NULL,
    "California" VARCHAR   NOT NULL,
    "Colorado" VARCHAR   NOT NULL,
    "Connecticut" VARCHAR   NOT NULL,
    "Delaware" VARCHAR   NOT NULL,
    "District_of_Columbia" VARCHAR   NOT NULL,
    "Florida" VARCHAR   NOT NULL,
    "Georgia" VARCHAR   NOT NULL,
    "Hawaii" VARCHAR   NOT NULL,
    "Idaho" VARCHAR   NOT NULL,
    "Illinois" VARCHAR   NOT NULL,
    "Indiana" VARCHAR   NOT NULL,
    "Iowa" VARCHAR   NOT NULL,
    "Kansas" VARCHAR   NOT NULL,
    "Kentucky" VARCHAR   NOT NULL,
    "Louisiana" VARCHAR   NOT NULL,
    "Maine" VARCHAR   NOT NULL,
    "Maryland" VARCHAR   NOT NULL,
    "Massachusetts" VARCHAR   NOT NULL,
    "Michigan" VARCHAR   NOT NULL,
    "Minnesota" VARCHAR   NOT NULL,
    "Mississippi" VARCHAR   NOT NULL,
    "Missouri" VARCHAR   NOT NULL,
    "Montana" VARCHAR   NOT NULL,
    "Nebraska" VARCHAR   NOT NULL,
    "Nevada" VARCHAR   NOT NULL,
    "New_Hampshire" VARCHAR   NOT NULL,
    "New_Jersey" VARCHAR   NOT NULL,
    "New_Mexico" VARCHAR   NOT NULL,
    "New_York" VARCHAR   NOT NULL,
    "North_Carolina" VARCHAR   NOT NULL,
    "North_Dakota" VARCHAR   NOT NULL,
    "Ohio" VARCHAR   NOT NULL,
    "Oklahoma" VARCHAR   NOT NULL,
    "Oregon" VARCHAR   NOT NULL,
    "Pennsylvania" VARCHAR   NOT NULL,
    "Rhode_Island" VARCHAR   NOT NULL,
    "South_Carolina" VARCHAR   NOT NULL,
    "South_Dakota" VARCHAR   NOT NULL,
    "Tennessee" VARCHAR   NOT NULL,
    "Texas" VARCHAR   NOT NULL,
    "Utah" VARCHAR   NOT NULL,
    "Vermont" VARCHAR   NOT NULL,
    "Virginia" VARCHAR   NOT NULL,
    "Washington" VARCHAR   NOT NULL,
    "West_Virginia" VARCHAR   NOT NULL,
    "Wisconsin" VARCHAR   NOT NULL,
    "Wyoming" VARCHAR   NOT NULL,
    CONSTRAINT "pk_automation" PRIMARY KEY (
        "detail_id"
     )
);

ALTER TABLE "occupation_detail" ADD CONSTRAINT "fk_occupation_detail_detail_id" FOREIGN KEY("detail_id")
REFERENCES "automation" ("detail_id");

ALTER TABLE "occupation_detail" ADD CONSTRAINT "fk_occupation_detail_broad_id" FOREIGN KEY("broad_id")
REFERENCES "occupation_broad" ("broad_id");

ALTER TABLE "occupation_broad" ADD CONSTRAINT "fk_occupation_broad_minor_id" FOREIGN KEY("minor_id")
REFERENCES "occupation_minor" ("minor_id");

ALTER TABLE "occupation_minor" ADD CONSTRAINT "fk_occupation_minor_major_id" FOREIGN KEY("major_id")
REFERENCES "occupation_major" ("major_id");

--SEARCH TABLES
SELECT *
FROM occupation_detail;

SELECT *
FROM occupation_broad;

SELECT *
FROM occupation_minor;

SELECT *
FROM occupation_major;

SELECT *
FROM automation;