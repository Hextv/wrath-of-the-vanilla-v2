-- A Rogue's Deal
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=8;

-- Rude Awakening
UPDATE `quest_template` SET `Flags`=8, `QuestDescription`='About time you woke up. We were ready to toss you into the fire with the others, but it looks like you made it.$b$bI am Mordo, the caretaker of the crypt of Deathknell. And you are the Lich King\'s slave no more.$b$bSpeak with Shadow Priest Sarvis in the chapel at the base of the hill, he will tell you more of what you must know.' WHERE `ID`=363;

-- The Mindless Ones
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Shadow Priest Sarvis wants you to kill 8 Mindless Zombies and 8 Wretched Zombies.', `RequiredNpcOrGoCount1`=8, `RequiredNpcOrGoCount2`=8 WHERE `ID`=364;

-- The Damned
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=376;

-- Night Web's Hollow
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Executor Arren wants you to kill 10 Young Night Web Spiders and 8 Night Web Spiders.', `RequiredNpcOrGoCount1`=10, `RequiredNpcOrGoCount2`=8 WHERE `ID`=380;

-- The Scarlet Crusade
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=381;

-- The Red Messenger
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=382;

-- Vital Intelligence
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=383;

-- Rattling the Rattlecages
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 12 Rattlecage Skeletons, and then return to Shadow Priest Sarvis in Deathknell when you are done.', `RequiredNpcOrGoCount1`=12 WHERE `ID`=3901;

-- Scavenging Deathknell
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=3902;

-- Marla's Last Wish
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=6395;
