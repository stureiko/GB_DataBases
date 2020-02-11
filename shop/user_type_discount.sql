#
# TABLE STRUCTURE FOR: user_type_discount
#
--
-- DROP TABLE IF EXISTS `user_type_discount`;
--
-- CREATE TABLE `user_type_discount` (
--  `user_type_id` int(10) unsigned NOT NULL,
--  `discount_id` int(10) unsigned NOT NULL,
--  UNIQUE KEY `user_type_id` (`user_type_id`),
--  KEY `discount_type_discount_id_fk` (`discount_id`),
--  CONSTRAINT `discount_type_discount_id_fk` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`) ON UPDATE CASCADE,
--  CONSTRAINT `discount_type_user_type_fk` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`user_type_id`) ON UPDATE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (0, 1);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (1, 2);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (2, 3);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (3, 4);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (4, 5);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (5, 6);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (6, 7);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (7, 8);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (8, 9);
INSERT INTO `user_type_discount` (`user_type_id`, `discount_id`) VALUES (9, 10);


