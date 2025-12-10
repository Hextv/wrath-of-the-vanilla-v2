-- Kurm Stonehoof <Mining Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3002 AND `item` IN (20815, 20824);

-- Fyr Mistrunner <Bread Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=3003 AND `item` IN (27855, 33449, 35950);

-- Mahu <Leatherworking & Tailoring Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3005 AND `item`=38426;

-- Nida Winterhoof <Herbalism Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3014 AND `item`=40411;

-- Kuna Thunderhorn <Bowyer & Fletching Goods>
DELETE FROM `npc_vendor` WHERE `entry`=3015 AND `item`=28053;

-- Nata Dawnstrider <Enchanting Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3012 AND `item`=6342;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (3012, 6342, 1, 7200);

-- Kaga Mistrunner <Meat Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=3025 AND `item` IN (27854, 33454, 35953);

-- Naal Mistrunner <Cooking Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3027 AND `item`=30817;

-- Thrumn <Tabard Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=5189 AND `item` IN (15197, 15199, 19031, 19505, 24004, 31773, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221);

-- Innkeeper Pala <Innkeeper>
DELETE FROM `npc_vendor` WHERE `entry`=6746 AND `item` IN (27857, 28399, 33443, 33444, 33445, 35952, 35954);

-- Chepi <Reagent Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=8361 AND `item` IN (22147, 22148, 37201, 44605, 44614, 44615);
