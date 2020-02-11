#
# TABLE STRUCTURE FOR: users
#
--
-- DROP TABLE IF EXISTS `users`;
--
-- CREATE TABLE `users` (
--  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'имя',
--  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'фамилия',
--  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
--  `phone` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
--  `created_at` datetime DEFAULT current_timestamp(),
--  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
--  `user_type_id` int(10) unsigned NOT NULL,
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `email` (`email`),
--  UNIQUE KEY `phone` (`phone`),
--  KEY `user_types_user_id_fk` (`user_type_id`),
--  CONSTRAINT `user_types_user_id_fk` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица пользователей';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (1, 'Johnathan', 'Rutherford', 'kwilkinson@example.org', '1-262-348-2218x14266', '1985-04-19 20:48:00', '1996-09-12 02:03:21', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (2, 'Ocie', 'Kuhic', 'tillman.troy@example.net', '+62(1)1863218060', '1975-11-09 21:06:14', '2016-11-03 19:11:39', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (3, 'Eliza', 'Kuhlman', 'mcole@example.com', '(496)135-4280x5286', '1974-01-04 13:56:07', '1992-07-18 10:30:36', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (4, 'Mariana', 'Ernser', 'lpowlowski@example.net', '1-238-778-3288', '1972-06-06 08:45:27', '1970-02-24 10:51:59', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (5, 'Dorothy', 'Connelly', 'mmckenzie@example.org', '03041620915', '2007-01-28 12:18:11', '1992-05-17 17:16:56', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (6, 'Morris', 'Streich', 'raven.trantow@example.net', '02668789832', '2010-08-22 09:29:29', '1980-10-03 00:19:13', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (7, 'Earnest', 'Grimes', 'lucinda.bashirian@example.org', '002-504-2041', '2003-12-13 20:08:55', '1990-06-09 16:52:29', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (8, 'Walton', 'Flatley', 'gleichner.finn@example.org', '082-591-2849', '2008-09-09 16:00:55', '1978-01-19 21:43:10', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (9, 'Edwardo', 'Sporer', 'marcelo69@example.net', '1-957-031-9282', '2014-08-07 20:53:38', '1974-12-29 04:59:18', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (10, 'Katharina', 'Abernathy', 'libbie.ankunding@example.org', '(789)003-4401', '2019-03-06 16:49:56', '1988-04-11 21:02:34', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (11, 'Cordelia', 'Bayer', 'nelle.marvin@example.org', '(685)040-0195x774', '1990-05-02 18:03:20', '2006-01-03 23:16:56', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (12, 'Mekhi', 'Flatley', 'eleonore13@example.org', '194.985.7658', '1996-04-15 00:13:38', '2017-11-02 15:54:40', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (13, 'Tanner', 'Crooks', 'trey.lemke@example.net', '1-198-818-4125x176', '1987-04-12 21:30:12', '2015-11-27 21:07:14', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (14, 'Taya', 'Keebler', 'verlie16@example.org', '07599314083', '1977-08-01 11:59:12', '1991-04-19 22:46:11', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (15, 'Tillman', 'Gerlach', 'zhalvorson@example.org', '1-491-280-1972', '1989-06-07 02:07:28', '1996-03-29 18:29:27', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (16, 'Franz', 'Cormier', 'itowne@example.com', '(344)063-6108x6492', '1992-01-22 21:09:49', '1980-09-28 16:53:41', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (17, 'Zora', 'Leannon', 'lauryn16@example.org', '(106)369-5894x38072', '2008-07-17 20:46:59', '1971-11-11 23:54:16', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (18, 'Adolphus', 'Heathcote', 'vpouros@example.com', '(782)216-0664', '1996-07-26 14:03:29', '1991-05-14 04:44:27', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (19, 'Miracle', 'Heller', 'hamill.keyon@example.net', '144.287.9153', '1977-05-20 06:13:48', '2002-02-26 23:31:43', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (20, 'Gabrielle', 'Kassulke', 'ibauch@example.org', '(306)699-1438x93049', '2017-03-25 11:27:33', '2000-03-31 07:53:48', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (21, 'Michele', 'Welch', 'zechariah59@example.org', '(224)914-5301x345', '2014-02-17 23:37:02', '1970-08-21 12:31:04', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (22, 'Hyman', 'Kemmer', 'edythe.grady@example.org', '(616)235-3557x403', '1998-10-25 06:03:15', '2017-06-30 06:05:19', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (23, 'Lexi', 'Kessler', 'ernesto47@example.com', '1-621-701-9094', '1993-12-16 05:08:31', '1971-10-18 20:01:42', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (24, 'Alfonzo', 'Shanahan', 'reyes10@example.org', '08786664660', '2013-03-09 21:08:20', '2007-07-14 15:40:01', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (25, 'Ila', 'Windler', 'yhermiston@example.com', '08725348911', '1982-10-29 08:43:00', '2002-03-15 01:03:13', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (26, 'Zoe', 'Auer', 'gdubuque@example.com', '(751)876-2065x071', '2010-06-23 18:27:42', '1995-09-01 13:45:42', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (27, 'Tillman', 'Roberts', 'schmeler.leland@example.net', '+74(1)6588386588', '1974-01-16 10:52:19', '2000-02-27 07:57:03', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (28, 'Maureen', 'Ondricka', 'chuels@example.org', '537.676.9663x480', '1978-03-29 09:16:33', '1978-04-05 01:45:12', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (29, 'Marley', 'Hauck', 'dkozey@example.net', '842-960-7265', '1993-11-29 19:51:09', '2014-01-13 12:21:07', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (30, 'Paris', 'Gleason', 'nico57@example.net', '115-150-7167', '1994-08-18 05:32:18', '2004-10-23 07:29:24', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (31, 'Forrest', 'Tremblay', 'hershel.boehm@example.net', '+36(3)7851743868', '1999-06-08 15:16:18', '1970-09-11 19:54:36', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (32, 'Rosemary', 'O\'Hara', 'rnienow@example.net', '1-285-007-3357', '1977-12-15 05:29:00', '1994-06-30 12:22:58', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (33, 'Lawrence', 'Ullrich', 'rowe.sarai@example.net', '1-420-617-8072x951', '1977-07-04 07:01:39', '2012-07-12 14:15:14', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (34, 'Laurie', 'Marvin', 'bella80@example.org', '325.006.4426x32347', '1992-04-13 20:23:01', '2006-10-23 05:04:46', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (35, 'Lelah', 'Conn', 'ytorphy@example.net', '1-906-011-2626x7273', '1972-07-20 22:54:35', '1993-05-20 03:24:39', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (36, 'Katelynn', 'Harvey', 'hammes.evert@example.net', '902-116-9531x9912', '1975-11-03 19:39:59', '2002-07-01 08:24:41', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (37, 'Terry', 'Kling', 'mellie54@example.com', '(648)002-0192x34251', '1980-05-20 18:38:09', '2012-05-25 07:18:31', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (38, 'Charles', 'Casper', 'kirk88@example.com', '257.740.9075x781', '2001-05-27 19:19:13', '2002-10-14 03:48:17', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (39, 'Asia', 'Bayer', 'jerad74@example.org', '1-385-160-4360x025', '1977-04-28 23:31:05', '2010-02-17 18:40:14', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (40, 'Katelynn', 'Hoeger', 'hulda.roob@example.net', '1-607-173-9718', '1979-07-25 19:10:31', '1994-10-21 23:04:53', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (41, 'Elyssa', 'Harvey', 'torphy.shaniya@example.net', '839-282-1199x53551', '1997-04-09 04:49:56', '1973-02-27 19:28:44', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (42, 'Vickie', 'Eichmann', 'lebsack.floyd@example.org', '02747707665', '2018-08-21 15:48:16', '1982-07-05 10:15:08', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (43, 'Tatum', 'Little', 'romaguera.nicola@example.org', '+32(6)1407413293', '2016-10-15 18:30:17', '1988-03-13 16:33:33', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (44, 'Markus', 'Emmerich', 'norberto.jast@example.org', '+41(4)9476298767', '1991-04-13 02:51:57', '1972-08-25 14:46:09', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (45, 'Ashly', 'Thiel', 'terry29@example.net', '006-016-3218x091', '2016-05-25 16:01:05', '1973-10-19 20:17:51', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (46, 'Leda', 'Deckow', 'manuel.abernathy@example.com', '(319)262-6591', '2001-01-11 23:31:58', '1989-11-26 12:50:36', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (47, 'Timothy', 'Beier', 'kuvalis.alexa@example.org', '891-480-4541', '1991-06-23 13:28:51', '1999-02-09 20:55:34', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (48, 'Elvis', 'Hane', 'pouros.gino@example.net', '037.103.8476x63178', '1970-09-27 00:10:09', '1974-08-02 20:33:58', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (49, 'Rosa', 'Howell', 'leif.jones@example.net', '+69(6)2541593410', '1973-11-13 18:59:30', '2018-03-24 13:56:58', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (50, 'Monty', 'Vandervort', 'dayna52@example.org', '721-397-8971', '2004-08-10 19:50:16', '1994-08-06 02:51:17', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (51, 'Delfina', 'Von', 'eglover@example.net', '913.834.4469x478', '1990-01-21 11:00:27', '1997-03-24 00:51:48', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (52, 'Deshawn', 'Cremin', 'flatley.aiyana@example.org', '(489)444-0947', '2003-09-21 17:39:24', '1982-07-18 08:09:46', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (53, 'Bonnie', 'Dooley', 'fparker@example.com', '567.055.6811x428', '1979-12-03 17:05:25', '1978-11-16 08:12:02', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (54, 'Gregg', 'Koss', 'angelo.osinski@example.com', '381-013-6638', '1991-05-07 23:09:08', '1973-05-28 21:31:20', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (55, 'Karine', 'Walsh', 'andreane23@example.net', '920-684-3070x9660', '2007-01-16 03:44:36', '2005-01-27 12:55:06', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (56, 'Angelo', 'Dietrich', 'millie18@example.net', '1-567-131-3617', '2013-10-29 00:51:04', '1986-11-21 03:53:05', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (57, 'Quinton', 'Sauer', 'qhomenick@example.com', '(046)038-6711x16335', '1976-08-01 06:27:09', '1981-12-04 08:22:08', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (58, 'Hudson', 'Dietrich', 'erika00@example.org', '317-899-7012', '1975-12-04 16:26:09', '1977-09-29 20:00:46', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (59, 'Erik', 'Collier', 'kraig16@example.com', '278-601-5536', '1984-01-06 08:13:18', '2016-11-08 17:19:45', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (60, 'Wava', 'Schuster', 'rickie.hermiston@example.com', '(094)195-0751', '1984-07-03 10:49:37', '1979-04-10 18:29:33', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (61, 'Vida', 'Hudson', 'bailey86@example.com', '+82(9)5261548854', '2002-08-19 05:25:02', '1997-09-19 15:54:44', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (62, 'Aleen', 'Kertzmann', 'earline47@example.net', '(516)334-7616x32085', '2011-03-21 01:56:45', '1992-03-21 23:17:56', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (63, 'Layla', 'VonRueden', 'koby.schaden@example.net', '313.421.0843x3028', '2001-06-18 05:21:56', '1994-10-16 17:52:01', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (64, 'Shane', 'Connelly', 'arlo55@example.org', '1-524-082-6612', '1985-09-17 00:06:38', '1986-03-08 18:01:04', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (65, 'Pearlie', 'Dickens', 'fschultz@example.org', '+29(2)7800006001', '2016-11-24 18:35:46', '1990-11-23 13:36:07', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (66, 'Holly', 'Baumbach', 'yasmine43@example.org', '1-369-855-2959', '1986-08-09 20:56:51', '1970-01-31 12:48:31', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (67, 'Patricia', 'Kertzmann', 'braden.simonis@example.net', '497-704-3255x94361', '1987-01-12 22:58:18', '1993-02-21 21:00:57', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (68, 'Sean', 'Stoltenberg', 'donavon.emmerich@example.net', '+23(0)0654025609', '1987-05-06 23:15:03', '2010-10-01 18:48:24', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (69, 'Ethan', 'Streich', 'millie00@example.net', '167.176.6350x93757', '1971-02-01 03:25:05', '2020-01-31 20:56:46', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (70, 'Sofia', 'Crist', 'yklein@example.net', '04048987074', '1974-09-08 06:22:02', '2000-10-02 04:35:28', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (71, 'Gwendolyn', 'Satterfield', 'qveum@example.net', '(694)366-3837x26717', '1987-01-01 03:13:24', '2016-10-17 19:22:21', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (72, 'Godfrey', 'Sipes', 'amanda08@example.com', '1-218-781-7662', '1986-10-22 20:11:14', '2011-11-08 05:25:26', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (73, 'Annamarie', 'Zemlak', 'alene.wehner@example.org', '02260758837', '2017-09-19 08:43:33', '2001-10-06 06:14:01', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (74, 'Kennedi', 'Lindgren', 'wuckert.trevion@example.net', '938.105.1576x450', '2011-02-09 07:45:01', '1977-07-23 15:25:08', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (75, 'Tomasa', 'Hartmann', 'kelley70@example.org', '532-155-3341', '2008-03-31 16:32:13', '2010-10-14 08:53:35', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (76, 'Rylee', 'Mohr', 'bailey.schuster@example.com', '960-029-8776', '2017-07-13 12:50:49', '1979-06-17 00:40:39', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (77, 'Florine', 'Osinski', 'johnston.raheem@example.org', '09739204960', '1977-12-08 21:30:29', '1996-12-12 21:25:37', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (78, 'Marion', 'Kuhlman', 'mtreutel@example.net', '06926701796', '1978-01-06 21:06:00', '1986-08-18 22:52:01', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (79, 'Hubert', 'Rodriguez', 'jessyca16@example.com', '02293146249', '2009-04-09 14:28:45', '1972-11-28 20:10:33', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (80, 'Ladarius', 'Yundt', 'schuyler09@example.org', '071.642.5154x80191', '1998-06-03 16:03:14', '1980-12-24 08:27:57', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (81, 'Brook', 'Mitchell', 'pansy62@example.org', '01353946731', '1999-12-30 18:04:54', '2006-05-08 14:23:45', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (82, 'Eda', 'Daniel', 'zakary.dare@example.net', '(923)976-3060x7675', '1976-06-05 02:31:44', '1980-01-29 12:30:11', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (83, 'Elizabeth', 'Swaniawski', 'waylon.runolfsdottir@example.net', '1-304-064-9694', '2017-10-31 02:03:44', '1992-02-19 23:01:29', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (84, 'Gillian', 'Rolfson', 'coleman.gutkowski@example.org', '+17(0)7302435948', '1977-03-07 00:00:17', '1975-11-22 00:08:33', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (85, 'Leland', 'Sawayn', 'hollis.satterfield@example.org', '+09(9)0410739539', '2017-05-14 13:03:26', '2011-07-30 09:11:38', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (86, 'Fausto', 'Schimmel', 'lane.mills@example.com', '1-937-011-3563x4922', '1997-03-28 11:06:49', '2005-07-19 21:50:47', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (87, 'Marjorie', 'Trantow', 'powlowski.reymundo@example.com', '333.545.3373x71239', '2002-08-19 12:42:44', '1990-12-21 19:44:28', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (88, 'Joannie', 'Denesik', 'turner.donavon@example.com', '+23(1)1208964173', '1982-04-22 13:54:31', '1986-04-16 02:51:28', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (89, 'Camden', 'McCullough', 'king.wilbert@example.com', '+52(2)7868980013', '1970-08-12 23:30:54', '1989-02-27 01:34:00', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (90, 'Stephon', 'Lind', 'lois63@example.org', '181-807-0590x364', '2001-12-25 08:40:54', '1982-05-14 13:30:11', 9);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (91, 'Kianna', 'Leannon', 'uupton@example.org', '07004204490', '2010-06-24 08:34:27', '2019-12-15 04:57:50', 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (92, 'Eugenia', 'Rodriguez', 'showe@example.com', '197.298.0522', '2016-03-23 16:36:23', '1996-10-20 18:44:37', 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (93, 'Lessie', 'Legros', 'coby76@example.com', '486.986.8630', '1977-03-01 03:02:08', '1985-10-12 04:16:48', 2);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (94, 'Nicolas', 'Harber', 'bfahey@example.net', '+82(3)4100267841', '2013-10-25 12:15:28', '1981-02-13 19:37:22', 3);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (95, 'Chyna', 'Hills', 'idell03@example.net', '927.571.9432x40171', '2003-12-28 02:59:06', '2002-09-22 07:31:47', 4);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (96, 'Justen', 'Gulgowski', 'carolyne73@example.net', '168.212.4677x862', '2014-05-21 02:23:34', '2016-01-08 06:09:07', 5);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (97, 'Mauricio', 'Roob', 'yschmitt@example.com', '(120)484-8768', '2004-12-31 20:42:35', '1980-09-30 04:21:59', 6);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (98, 'Jodie', 'Purdy', 'jackeline.ledner@example.org', '1-225-849-6159', '2008-11-29 02:19:35', '2006-09-16 19:50:35', 7);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (99, 'Kristopher', 'Konopelski', 'penelope42@example.org', '+07(1)4610030622', '2000-10-10 02:14:31', '1996-12-22 03:45:01', 8);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) VALUES (100, 'Estella', 'Gutmann', 'norberto45@example.net', '1-028-649-7646', '2003-12-08 06:29:07', '1983-11-27 15:45:23', 9);


