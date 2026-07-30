DELETE FROM `command` WHERE `name` LIKE 'wpvp %';

DELETE FROM `command` WHERE `name` = 'wpvp';

INSERT INTO `command` (`name`, `security`, `help`) VALUES
('wpvp', 3, 'Syntax: .wpvp help\nPlayerbot World PvP GM commands.');
