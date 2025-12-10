-- Tome of Nobility (Paladin)
DELETE FROM `creature_queststarter` WHERE `id`=6171 AND `quest`=1661;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (6171, 1661);

-- Summon Felsteed (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=461 AND `quest`=4488;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (461, 4488);
