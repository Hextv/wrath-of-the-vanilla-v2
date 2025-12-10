-- Gina MacGregor <Trade Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=843 AND `item`=39354;

-- Christopher Hewen <General Trade Goods Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=8934 AND `item` IN (10648, 14341, 18256, 30817, 39354);
