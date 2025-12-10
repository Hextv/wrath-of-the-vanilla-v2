-- Saru Steelfury <Artisan Blacksmith>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1012 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 1012, 0, 7, 164, 125, 'Show menu if blacksmithing is 125 or higher');

-- Snarl <Expert Blacksmith>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=2782 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 2782, 0, 7, 164, 50, 'Show menu if blacksmithing is 50 or higher');

-- Yelmak <Expert Alchemist>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4126 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4126, 0, 7, 171, 50, 'Show menu if alchemy is 50 or higher');

-- Nogg <Expert Engineer>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4148 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4148, 0, 7, 202, 50, 'Show menu if engineering is 50 or higher');

-- Roxxik <Artisan Engineer>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4151 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4151, 0, 7, 202, 125, 'Show menu if engineering is 125 or higher');

-- Godan <Expert Enchanter>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4168 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4168, 0, 7, 333, 50, 'Show menu if enchanting is 50 or higher');

-- Karolek <Expert Leatherworker>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4209 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4209, 0, 7, 165, 50, 'Show menu if leatherworking is 50 or higher');

-- Magar <Expert Tailor>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4347 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4347, 0, 7, 197, 50, 'Show menu if tailoring is 50 or higher');
