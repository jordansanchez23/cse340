--Testing DB CSE340
SELECT DISTINCT inv_year FROM inventory
WHERE CAST(inv_year AS INTEGER) >= 2016
ORDER BY inv_year ASC;

--Query #1
INSERT INTO account (account_firstname, account_lastname, account_email, account_password)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n');

--Query #2
UPDATE account
SET account_type = 'Admin'::account_type
WHERE account_id = 1;

SELECT * FROM account;

--Query #3
DELETE FROM account
WHERE account_id = 1;

SELECT * FROM inventory;

--Query #4
UPDATE inventory
SET inv_description = REPLACE(inv_description, 'the small interiors', 'a huge interior')
WHERE inv_id = 10;

--Query #5
SELECT inventory.inv_make, inventory.inv_model, classification.classification_name
FROM inventory
	INNER JOIN classification
	ON inventory.classification_id = classification.classification_id
WHERE classification.classification_id = 2;

SELECT inv_id, inv_image, inv_thumbnail FROM inventory;

--Query #6
UPDATE inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
	inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');

