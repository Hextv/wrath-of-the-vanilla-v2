-- Defias Thug
UPDATE `creature_template` SET `faction`=17 WHERE `entry`=38;

-- Diseased Timber Wolf
UPDATE `creature_template` SET `name`='Timber Wolf' WHERE `entry`=69;

-- Kobold Laborer
UPDATE `creature_template` SET `maxlevel`=4 WHERE `entry`=80;

-- Garrick Padfoot
UPDATE `creature_template` SET `faction`=17 WHERE `entry`=103;

-- Kobold Worker
-- Note: Only modelid updated; no creature_template field changed

-- Diseased Young Wolf
UPDATE `creature_template` SET `name`='Young Wolf' WHERE `entry`=299;

-- Smith Argus
UPDATE `creature_template` SET `subname`='Journeyman Blacksmith' WHERE `entry`=514;

-- Eldrin <Journeyman Tailor>
UPDATE `creature_template` SET `subname`='Journeyman Tailor' WHERE `entry`=1103;

-- Alchemist Mallory <Journeyman Alchemist>
UPDATE `creature_template` SET `subname`='Journeyman Alchemist' WHERE `entry`=1215;

-- Adele Fielder <Journeyman Leatherworker>
UPDATE `creature_template` SET `subname`='Journeyman Leatherworker' WHERE `entry`=1632;

-- Northshire Guard
UPDATE `creature_template` SET `minlevel`=55, `maxlevel`=55 WHERE `entry`=1642;

-- Lee Brown <Fisherman>
UPDATE `creature_template` SET `subname`='Fisherman' WHERE `entry`=1651;

-- Rebecca Laughlin <Tabard Designer>
UPDATE `creature_template` SET `subname`='Tabard Vendor' WHERE `entry`=5193;

-- Lilyssia Nightbreeze <Alchemy Trainer>
UPDATE `creature_template` SET `subname`='Expert Alchemist' WHERE `entry`=5499;

-- Tel'Athir <Apprentice Alchemist>
UPDATE `creature_template` SET `subname`='Journeyman Alchemist', `npcflag`=81, `trainer_type`=2 WHERE `entry`=5500;

-- Eldraeith <Herbalism Supplies>
UPDATE `creature_template` SET `subname`='Herbalism Supplier' WHERE `entry`=5503;

-- Therum Deepforge <Blacksmithing Trainer>
UPDATE `creature_template` SET `subname`='Expert Blacksmith' WHERE `entry`=5511;

-- Lilliam Sparkspindle <Engineering Trainer>
UPDATE `creature_template` SET `subname`='Expert Engineer' WHERE `entry`=5518;

-- Simon Tanner <Leatherworking Trainer>
UPDATE `creature_template` SET `subname`='Expert Leatherworker' WHERE `entry`=5564;

-- Sellandus <Apprentice Tailor>
UPDATE `creature_template` SET `subname`='Expert Tailor', `npcflag`=81, `trainer_type`=2 WHERE `entry`=5567;

-- Helene Peltskinner <Skinner>
UPDATE `creature_template` SET `subname`='Skinner' WHERE `entry`=6306;