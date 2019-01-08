use db_zoo;

create table tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1)
	,animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_animalia
(animalia_type)
Values
('vertebrate')
,('invertebrate')
;

SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1)
	,class_type varchar(50) NOT NULL
);






