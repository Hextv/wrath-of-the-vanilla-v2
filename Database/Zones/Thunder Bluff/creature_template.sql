-- Karn Stonehoof <Expert Blacksmith>
UPDATE `creature_template` SET `subname`='Expert Blacksmith' WHERE `entry`=2998;

-- Kurm Stonehoof <Mining Supplier>
UPDATE `creature_template` SET `subname`='Mining Supplier' WHERE `entry`=3002;

-- Tepa <Expert Tailor>
UPDATE `creature_template` SET `subname`='Expert Tailor' WHERE `entry`=3004;

-- Una <Artisan Leatherworker>
UPDATE `creature_template` SET `subname`='Artisan Leatherworker' WHERE `entry`=3007;

-- Mak <Journeyman Leatherworker>
UPDATE `creature_template` SET `subname`='Journeyman Leatherworker', `npcflag`=81, `trainer_type`=2 WHERE `entry`=3008;

-- Bena Winterhoof <Expert Alchemist>
UPDATE `creature_template` SET `subname`='Expert Alchemist' WHERE `entry`=3009;

-- Teg Dawnstrider <Expert Enchanter>
UPDATE `creature_template` SET `subname`='Expert Enchanter' WHERE `entry`=3011;

-- Nida Winterhoof <Herbalism Supplier>
UPDATE `creature_template` SET `subname`='Expert Enchanter' WHERE `entry`=3014;

-- Kard Ragetotem <Sword and Dagger Merchant>
UPDATE `creature_template` SET `subname`='Sword and Dagger Merchant' WHERE `entry`=3021;

-- Naal Mistrunner <Cooking Supplier>
UPDATE `creature_template` SET `subname`='Cooking Supplier' WHERE `entry`=3027;

-- Sewa Mistrunner <Fishing Supplier>
UPDATE `creature_template` SET `subname`='Fishing Supplier' WHERE `entry`=3029;

-- Cairne Bloodhoof <High Chieftain>
UPDATE `creature_template` SET `minlevel`=63, `maxlevel`=63 WHERE `entry`=3057;

-- Honor Guard
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60, `rank`=0 WHERE `entry`=3083;

-- Bluffwatcher
UPDATE `creature_template` SET `minlevel`=55, `maxlevel`=55, `faction`=105 WHERE `entry`=3084;

-- Chepi <Reagent Vendor>
UPDATE `creature_template` SET `subname`='Reagent Vendor' WHERE `entry`=8361;

-- Kuruk <General Goods Vendor>
UPDATE `creature_template` SET `subname`='General Goods Vendor' WHERE `entry`=8362;

-- Shadi Mistrunner <Trade Goods Supplier>
UPDATE `creature_template` SET `subname`='Trade Goods Supplier' WHERE `entry`=8363;

-- Thrag Stonehoof <Journeyman Blacksmith>
UPDATE `creature_template` SET `subname`='Journeyman Blacksmith', `npcflag`=81, `trainer_type`=2 WHERE `entry`=10278;

-- Kray <Journeyman Alchemist>
UPDATE `creature_template` SET `subname`='Journeyman Alchemist', `npcflag`=81, `trainer_type`=2 WHERE `entry`=11047;

-- Vhan <Journeyman Tailor>
UPDATE `creature_template` SET `subname`='Journeyman Tailor', `npcflag`=81, `trainer_type`=2 WHERE `entry`=11051;

-- Mot Dawnstrider <Journeyman Enchanter>
UPDATE `creature_template` SET `subname`='Journeyman Enchanter', `npcflag`=81, `trainer_type`=2 WHERE `entry`=11071;

-- Tarn <Expert Leatherworker>
UPDATE `creature_template` SET `subname`='Expert Leatherworker', `npcflag`=81, `trainer_type`=2 WHERE `entry`=11084;

-- Hunter Sagewind
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60 WHERE `entry`=14440;

-- Hunter Ragetotem
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60 WHERE `entry`=14441;
