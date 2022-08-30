
INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('police', 'Police')
;

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(6, 'police', 0, 'recruit', 'Cadet', 300, '{}', '{}'),
(7, 'police', 1, 'officer', 'Officier', 350, '{}', '{}'),
(8, 'police', 3, 'sergeant', 'Sergent', 450, '{}', '{}'),
(9, 'police', 6, 'lieutenant', 'Lieutenant', 600, '{}', '{}'),
(10, 'police', 8, 'boss', 'Commandant', 1, '{}', '{}'),
(17, 'police', 2, 'officersup', 'Officier Sup', 400, '{}', '{}'),
(18, 'police', 4, 'sergeantc', 'Sergent-Chef', 500, '{}', '{}'),
(19, 'police', 7, 'captain', 'Capitaine', 1, '{}', '{}'),
(20, 'police', 5, 'major', 'Major', 550, '{}', '{}');


CREATE TABLE `wanted_players` (
  `id` int(11) NOT NULL,
  `author` text NOT NULL,
  `date` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `reason` text NOT NULL,
  `dangerosity` text NOT NULL,
  `prime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `wanted_players`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `wanted_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;