-- Data Cleaning 

SELECT * 
FROM addata;

CREATE table addata_s4
LIKE addata;

insert addata_s4
select * 
from addata;

ALTER TABLE addata_s4
RENAME COLUMN ï»¿AdID to AdID;


ALTER TABLE addata_s4
DROP COLUMN latitude, 
DROP COLUMN longitude,
DROP COLUMN mapAddress, 
DROP COLUMN VIN;

ALTER TABLE addata_s4
add column `date_posted` Date;

UPDATE addata_s4
SET date_posted = STR_TO_DATE(`date`, '%m/%d/%Y, %H:%i:%s');

ALTER TABLE addata_s4
DROP COLUMN `Date`;

SELECT * 
FROM addata_s4

DELETE FROM addata_s4
WHERE 
  price < 1 
  OR title IS NULL;
  
ALTER TABLE addata_s4
RENAME COLUMN saleby to seller_type;

SELECT AdID, COUNT(*) AS DuplicateCount
FROM addata_s4
GROUP BY AdID
HAVING COUNT(*) > 1;

Select * FROM 
addata_s4

UPDATE addata_s4
SET city = CONCAT(UPPER(LEFT(city, 1)), LOWER(SUBSTRING(city, 2)));

UPDATE addata_s4
SET seller_type = 
CASE 
When LOWER(seller_type) like '%dealer' then 'Dealer'
When LOWER(seller_type) like '%owner' then 'Owner'
Else seller_type
END; 

UPDATE addata_s4
SET `condition` = 
CASE 
When LOWER(`condition`) like '%used' then 'Used'
When LOWER(`condition`) like '%damaged' then 'Damaged'
Else 'condition'
END; 


UPDATE addata_s4
SET fueltype = CONCAT(UPPER(LEFT(fueltype, 1)), LOWER(SUBSTRING(fueltype, 2)));

UPDATE addata_s4
SET color = CONCAT(UPPER(LEFT(color, 1)), LOWER(SUBSTRING(color, 2)));

SELECT * 
FROM addata_s4;


UPDATE addata_s4
SET body = REGEXP_REPLACE(body, '[^A-Za-z0-9 ]', ' ');

UPDATE addata_s4
SET Body = CONCAT(UPPER(LEFT(body, 1)), LOWER(SUBSTRING(body, 2)));

ALTER TABLE addata_s4 MODIFY Transmission VARCHAR(255);

Update addata_s4
SET Transmission = 
  CASE
    WHEN Transmission = '1' THEN 'Auto'
    WHEN Transmission = '2' THEN 'Manual'
    WHEN Transmission = '3' THEN 'CVT'
    ELSE Transmission
  END;
  
ALTER TABLE addata_s4 MODIFY `push button start` VARCHAR(255);

UPDATE addata_s4
SET `push button start` = 
  CASE
    WHEN `push button start` IS NULL OR `push button start` = '' THEN 'Not Mentioned'
    WHEN `push button start` = '0' THEN 'No'
    WHEN `push button start` = '1' THEN 'Yes'
    ELSE `push button start`
  END;
  
UPDATE addata_s4
SET `parking assist` = 
  CASE
    WHEN `parking assist` IS NULL OR `parking assist` = '' THEN 'Not Mentioned'
    WHEN `parking assist` = '0' THEN 'No'
    WHEN `parking assist` = '1' THEN 'Yes'
    ELSE `parking assist`
  END;
  

UPDATE addata_s4
SET `sunroof` = 
  CASE
    WHEN `sunroof` IS NULL OR `sunroof` = '' THEN 'Not Mentioned'
    WHEN `sunroof` = '0' THEN 'No'
    WHEN `sunroof` = '1' THEN 'Yes'
    ELSE `sunroof`
  END;
  
UPDATE addata_s4
SET `alloy wheels` = 
  CASE
    WHEN `alloy wheels` IS NULL OR `alloy wheels` = '' THEN 'Not Mentioned'
    WHEN `alloy wheels` = '0' THEN 'No'
    WHEN `alloy wheels` = '1' THEN 'Yes'
    ELSE `alloy wheels`
  END;
  
UPDATE addata_s4
SET model = REPLACE(model, '_', ' ');

UPDATE addata_s4
SET model = CONCAT(UPPER(LEFT(model, 1)), LOWER(SUBSTRING(model, 2)));  

SELECT * 
FROM addata_s4;