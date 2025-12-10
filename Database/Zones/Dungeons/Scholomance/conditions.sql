-- Darkmaster Gandling - Green Winter Hat
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup`=1853 AND `SourceEntry`=21525 AND `ConditionTypeOrReference`=12 AND `ConditionValue1`=2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `Comment`) VALUES (1, 1853, 21525, 12, 2, 'Green Winter Hat only drops when event 2 is active');
