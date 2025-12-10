-- Piercing the Veil (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=5667 AND `quest`=1470;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (5667, 1470);
