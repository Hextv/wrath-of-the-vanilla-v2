-- Entering the raid requires the Drakefire Amulet
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id`=15;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`, `requirement_type`, `requirement_id`, `requirement_note`, `faction`, `comment`) VALUES (15, 2, 16309, 'You must be part of a Raid group, at least level 50 and have the Drakefire Amulet in your inventory to enter.', 2, 'Onyxia\'s Lair');
