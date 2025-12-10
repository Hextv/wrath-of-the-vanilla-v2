-- Bounty on Garrick Padfoot
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=6;

-- Kobold Camp Cleanup
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 10 Kobold Vermin, then return to Marshal McBride.', `RequiredNpcOrGoCount1`=10 WHERE `ID`=7;

-- Investigate Echo Ridge
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 10 Kobold Workers, then report back to Marshal McBride.', `QuestDescription`='$N, my scouts tell me that the kobold infestation is larger than we had thought.  A group of kobold workers has camped near the Echo Ridge Mine to the north.$B$BGo to the mine and remove them.  We know there are at least 10.  Kill them, see if there are more, then report back to me.', `RequiredNpcOrGoCount1`=10 WHERE `ID`=15;

-- Brotherhood of Thieves
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Bring 12 Red Burlap Bandanas to Deputy Willem outside the Northshire Abbey.', `RequiredItemCount1`=12 WHERE `ID`=18;

-- Skirmish at Echo Ridge
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 12 Kobold Laborers, then return to Marshal McBride at Northshire Abbey.', `RequiredNpcOrGoCount1`=12 WHERE `ID`=21;

-- Wolves Across the Border
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Bring 8 pieces of Tough Wolf Meat to Eagan Peltskinner outside Northshire Abbey.', `QuestDescription`='I hate those nasty timber wolves!  But I sure like eating wolf steaks...  Bring me tough wolf meat and I will exchange it for something you\'ll find useful.$B$BTough wolf meat is gathered from hunting the timber wolves and young wolves wandering the Northshire countryside.', `RequiredItemId1`=750 WHERE `ID`=33;

-- Report to Goldshire
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=54;

-- A Threat Within
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=783;

-- Rest and Relaxation
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=2158;

-- Encrypted Letter
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=3102;

-- Milly Osworth
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=3903;

-- Milly's Harvest
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=3904;

-- Grape Manifest
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=3905;

-- Eagan Peltskinner
UPDATE `quest_template` SET `QuestDescription`='Eagan Peltskinner is looking for someone to hunt wolves for him.  That\'s good news, because we\'re seeing a lot more wolves in Northshire Valley lately.$B$BIf you\'re interested then speak with Eagan.  He\'s around the side of the abbey, to the left.' WHERE `ID`=5261;
