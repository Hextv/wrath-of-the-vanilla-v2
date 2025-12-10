-- Vile Familiars (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=5765 AND `quest`=1485;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (5765, 1485);

-- Summon Felsteed (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=6251 AND `quest`=4490;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (6251, 4490);
