-- Call of Water (Shaman)
DELETE FROM `quest_request_items` WHERE `ID`=63;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `CompletionText`) VALUES (63, 1, 'The brazier still reflects the ambient light from the area, and the flame shifts slightly as you move closer.$B$BThe corruption along the hills seems to have kept its distance, and besides the missing components, the brazier looks prepared for the ritual to summon a cleansed manifestation of water.');

-- Hamuul Runetotem
DELETE FROM `quest_request_items` WHERE `ID`=1489;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `CompletionText`) VALUES (1489, 1, NULL);
