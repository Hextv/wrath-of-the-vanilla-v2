-- Guild Vault
DELETE FROM `gameobject` WHERE `id`=187299;

-- Lexicon of Power
DELETE FROM `gameobject` WHERE `id`=193981;

-- Portal to Blasted Lands
DELETE FROM `gameobject` WHERE `id` IN (195141, 195142);

-- Meeting Stone: Onyxia's Lair
DELETE FROM `gameobject` WHERE `guid`=7013 AND `id`=185321;

-- Meeting Stone: Zul'Gurub
DELETE FROM `gameobject` WHERE `guid`=10124 AND `id`=185433;

-- Meeting Stone: Karazhan
DELETE FROM `gameobject` WHERE `guid`=14003 AND `id`=184463;

-- Meeting Stone: Caverns of Time
DELETE FROM `gameobject` WHERE `guid`=17269 AND `id`=182560;

-- Meeting Stone: Ahn'Qiraj
DELETE FROM `gameobject` WHERE `guid`=49434 AND `id`=185322;
