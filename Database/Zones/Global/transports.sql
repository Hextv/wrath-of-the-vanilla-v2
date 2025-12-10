-- From Stormwind to Auberdine
DELETE FROM `transports` WHERE `guid`=2;

-- To Azuremyst Isle
DELETE FROM `transports` WHERE `guid`=9;

-- Transports to Northrend
DELETE FROM `transports` WHERE `guid` IN (10, 11, 12, 17);

-- From Orgrimmar to Thunder Bluff
DELETE FROM `transports` WHERE `guid`=20;
