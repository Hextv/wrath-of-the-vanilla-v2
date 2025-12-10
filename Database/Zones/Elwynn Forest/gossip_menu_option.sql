-- Kitta Firewind <Enchanting Trainer>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4169;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4169, 0, 3, 'Train me.', 3266, 5, 16);
