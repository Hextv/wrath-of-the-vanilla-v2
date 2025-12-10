-- Nazgrel <Advisor to Thrall>
DELETE FROM `creature_queststarter` WHERE `id`=3230;

-- Summon Felsteed (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=3326 AND `quest`=3631;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (3326, 3631);

-- Knowledge of the Orb of Orahil (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=3326 AND `quest`=4967;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (3326, 4967);

-- An Imp's Request (Warlock)
DELETE FROM `creature_queststarter` WHERE `id` IN (3324, 3325, 3326, 4564, 5495, 5496) AND `quest`=8419;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (3326, 8419);

-- Relic of the Earthen Ring
DELETE FROM `creature_queststarter` WHERE `quest` IN (14100, 14111);
