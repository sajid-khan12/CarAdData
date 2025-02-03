-- Data Cleaning 

SELECT * 
FROM addata;

CREATE table addata_s 
LIKE addata;

SELECT * 
FROM addata_s;

insert addata_s
select * 
from addata;

ALTER TABLE addata_s
RENAME COLUMN ï»¿AdID to AdID;


ALTER TABLE addata_s
DROP COLUMN column_name;
