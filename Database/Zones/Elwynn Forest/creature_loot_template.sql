-- Diseased Timber Wolf
DELETE FROM `creature_loot_template` WHERE `Entry`=69 AND `Item`=750;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `QuestRequired`, `MinCount`, `MaxCount`, `Comment`) VALUES (69, 750, 80, 1, 1, 1, 'Timber Wolf - Tough Wolf Meat');

-- Diseased Young Wolf
DELETE FROM `creature_loot_template` WHERE `Entry`=299 AND `Item`=750;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `QuestRequired`, `MinCount`, `MaxCount`, `Comment`) VALUES (299, 750, 80, 1, 1, 1, 'Young Wolf - Tough Wolf Meat');
