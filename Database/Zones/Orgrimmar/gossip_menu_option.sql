-- Snarl <Expert Blacksmith>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=2782;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (2782, 0, 3, 'Train me.', 3266, 5, 16);

-- Nogg <Expert Engineer>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4148;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4148, 0, 3, 'Train me.', 3266, 5, 16);

-- Roxxik <Artisan Engineer>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4151;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4151, 0, 3, 'Train me.', 3266, 5, 16);
