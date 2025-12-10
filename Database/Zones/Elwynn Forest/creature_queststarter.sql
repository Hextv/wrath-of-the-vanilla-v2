-- The Stolen Tome (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=459 AND `quest`=1598;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (459, 1598);
