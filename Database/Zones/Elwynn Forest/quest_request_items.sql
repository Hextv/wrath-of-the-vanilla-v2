-- Wolves Across the Border
DELETE FROM `quest_request_items` WHERE `ID`=33;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES (33, 6, 6, 'Hey $N. I\'m getting hungry...did you get that tough wolf meat?');
