-- Lucan Cordell <Expert Enchanter>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4161;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4161, 0, 3, 'Train me.', 3266, 5, 16);

-- Sellandus <Expert Tailor>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4344;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4344, 0, 3, 'Train me.', 3266, 5, 16);
