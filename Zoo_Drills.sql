USE db_zoo
GO

/* DRILL #1 */
SELECT * FROM tbl_habitat;

/* DRILL #2 */
SELECT species_name FROM tbl_species WHERE species_order = 3;

/* DRILL #3 */
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

/* DRILL #4 */
SELECT 
	species_name, nutrition_id
FROM tbl_species INNER JOIN tbl_nutrition 
	ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
	WHERE nutrition_id BETWEEN 2202 AND 2206;

/* DRILL #5 */
SELECT 
	species_name [Species Name:]
	,nutrition_id [Nutrition Type:]
FROM tbl_species INNER JOIN tbl_nutrition 
	ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id

/* DRILL #6 */
SELECT 
	A.specialist_fname
	,A.specialist_lname
	,A.specialist_contact
FROM tbl_specialist A INNER JOIN tbl_care B ON A.specialist_id = B.care_specialist 
	INNER JOIN tbl_species C ON B.care_id = C.species_care
	WHERE C.species_name = 'penguin';

/* DRILL #7 */
CREATE DATABASE db_People;
GO

USE [db_People];
GO

DROP TABLE tbl_location, tbl_Names;
GO

CREATE TABLE tbl_Names
(
	name_id INT PRIMARY KEY NOT NULL IDENTITY(1,1)
	,fname varchar(30) NOT NULL
	,lname varchar(40) NOT NULL
);

CREATE TABLE tbl_location
(
	location_id INT NOT NULL CONSTRAINT fk_location_id FOREIGN KEY REFERENCES tbl_Names(name_id) ON UPDATE CASCADE ON DELETE CASCADE
	,phone varchar(15)
	,street_addr varchar(45)
)

INSERT INTO tbl_Names
(
	fname
	,lname
)
SELECT 'John','Beattle' UNION
SELECT 'Paul','Beattle' UNION
SELECT 'George','Beattle' UNION
SELECT 'Ringo','Beattle';

INSERT INTO tbl_location
(
	location_id
	,phone
	,street_addr
)
SELECT 1, '+13 345892','6420 Liverpool Lane' UNION
SELECT 1, '+13 534732','6420 Liverpool Lane' UNION
SELECT 2, '+17 424587','123 Abby Road' UNION
SELECT 3, '+19 587245','3rd Star-On-Right Way' UNION
SELECT 3, '+19 587245','Somewhere Over the Rainbow' UNION
SELECT 4, '+16 823647','1964 London Road';

SELECT
	fname [First Name]
	,lname [Last Name]
	,phone [Phone]
	,street_addr [Location]
FROM tbl_Names INNER JOIN tbl_location ON
	tbl_Names.name_id = tbl_location.location_id;
