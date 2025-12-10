-- Mindless Zombie
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id1`=1501;

-- Wretched Zombie
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id1`=1502;

-- Young Scavenger
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id1`=1508;

-- Duskbat
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id1`=1512;

-- Rotting Dead
UPDATE `creature` SET `spawntimesecs`=300 WHERE `id1`=1525;

-- Ravaged Corpse
UPDATE `creature` SET `spawntimesecs`=300 WHERE `id1`=1526;

-- Bleeding Horror
UPDATE `creature` SET `spawntimesecs`=300 WHERE `id1`=1529;

-- Lost Soul
UPDATE `creature` SET `spawntimesecs`=5400 WHERE `id1`=1531;

-- Wandering Spirit
UPDATE `creature` SET `spawntimesecs`=300 WHERE `id1`=1532;

-- Tormented Spirit
UPDATE `creature` SET `spawntimesecs`=5400 WHERE `id1`=1533;

-- Undertaker Mordo
DELETE FROM `creature` WHERE `id1`=1568;
INSERT INTO `creature` (`id1`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (1568, 0, 1678.99, 1667.86, 135.855, 3.76991, 300);

-- Deeb
UPDATE `creature` SET `spawntimesecs`=7200 WHERE `id1`=1911;

-- Farmer Solliden
UPDATE `creature` SET `spawntimesecs`=5400 WHERE `id1`=1936;

-- Scarlet Sentry
UPDATE `creature` SET `spawntimesecs`=7200 WHERE `id1`=4283;

-- Bayne
UPDATE `creature` SET `spawntimesecs`=5400 WHERE `id1`=10356;

-- Ressan the Needler
UPDATE `creature` SET `spawntimesecs`=7200 WHERE `id1`=10357;

-- Sri'skulk
UPDATE `creature` SET `spawntimesecs`=7200 WHERE `id1`=10359;

-- Claire Willower
DELETE FROM `creature` WHERE `id1`=11945;

-- Meefi Farthrottle <Howling Fjord Zeppelin Master>
DELETE FROM `creature` WHERE `id1`=26539;

-- William Saldean <Grain & Feed Vendor>
DELETE FROM `creature` WHERE `id1`=33996;

-- Deathguard Elite
DELETE FROM `creature` WHERE `guid`=200118;

-- Deathguard Elite
DELETE FROM `creature` WHERE `guid`=200119;

-- Deathguard Elite
DELETE FROM `creature` WHERE `guid`=200120;

-- Deathguard Elite
DELETE FROM `creature` WHERE `guid`=200121;

-- Steamwheedle Bruiser
DELETE FROM `creature` WHERE `guid`=200122;

-- Steamwheedle Bruiser
DELETE FROM `creature` WHERE `guid`=200123;
