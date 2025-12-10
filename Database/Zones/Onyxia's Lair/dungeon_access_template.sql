-- Set the min level to enter the raid to 50
DELETE FROM `dungeon_access_template` WHERE `map_id`=249;
INSERT INTO `dungeon_access_template` (`id`, `map_id`, `min_level`, `max_level`, `min_avg_item_level`, `comment`) VALUES (15, 249, 50, 60, 0, 'Onyxia\'s Lair');
