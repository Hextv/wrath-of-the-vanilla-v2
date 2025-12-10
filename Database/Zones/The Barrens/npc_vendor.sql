-- Grub
DELETE FROM `npc_vendor` WHERE `entry`=3443;

-- Tari'qa <Trade Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3482 AND `item`=39354;

-- Wrahk <Tailoring Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3485 AND `item`=38426;

-- Hula'mahi <Reagents and Herbs>
DELETE FROM `npc_vendor` WHERE `entry`=3490 AND `item` IN (21835, 21927, 22053, 22054, 22055, 22147, 22148, 37201, 43230, 43231, 43232, 43233, 43234, 43235, 43237);
DELETE FROM `npc_vendor` WHERE `entry`=3490 AND `item`=8925;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (3490, 8925);

-- Gagsprocket <Engineering Goods>
DELETE FROM `npc_vendor` WHERE `entry`=3495 AND `item` IN (14639, 39684, 40533);

-- Ranik <Trade Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3499 AND `item` IN (20855, 39354);

-- Kalldan Felmoon <Specialist Leatherworking Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=5783 AND `item`=38426;

-- Yonada <Tailoring & Leatherworking Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=5944 AND `item`=38426;

-- Tarban Hearthgrain <Baker>
DELETE FROM `npc_vendor` WHERE `entry`=8307 AND `item`=30817;

-- Kelm Hargunth <Warsong Supply Officer>
DELETE FROM `npc_vendor` WHERE `entry`=14754 AND `item`=30498;
