-- Therum Deepforge <Expert Blacksmith>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=581 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 581, 0, 7, 164, 50, 'Show menu if blacksmithing is 50 or higher');

-- Lilliam Sparkspindle <Expert Engineer>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4146 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4146, 0, 7, 202, 50, 'Show menu if engineering is 50 or higher');

-- Lucan Cordell <Expert Enchanter>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4161 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4161, 0, 7, 333, 50, 'Show menu if enchanting is 50 or higher');

-- Lilyssia Nightbreeze <Expert Alchemist>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4201 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4201, 0, 7, 171, 50, 'Show menu if alchemy is 50 or higher');

-- Simon Tanner <Expert Leatherworker>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4203 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4203, 0, 7, 165, 50, 'Show menu if leatherworking is 50 or higher');

-- Sellandus <Expert Tailor>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4344 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4344, 0, 7, 197, 50, 'Show menu if tailoring is 50 or higher');

-- Georgio Bolero <Artisan Tailor>
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=4353 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES (15, 4353, 0, 7, 197, 125, 'Show menu if tailoring is 125 or higher');
