-- The Hunt Begins
DELETE FROM `quest_request_items` WHERE `ID`=747;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `CompletionText`) VALUES (747, 1, 'Providing meat and feathers for the tribe is the first step in proving yourself as a hunter before the Chief.');

-- Wildmane Cleansing
DELETE FROM `quest_request_items` WHERE `ID`=760;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `CompletionText`) VALUES (760, 1, 'The last water well remains fetid and poisonous, $N. You must not delay!');
