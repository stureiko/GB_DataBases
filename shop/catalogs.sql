#
# TABLE STRUCTURE FOR: catalogs
#

-- DROP TABLE IF EXISTS `catalogs`;
--
--  CREATE TABLE `catalogs` (
--  `catalog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
--  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
--  `parent_id` int(10) unsigned,
--  PRIMARY KEY (`catalog_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (1, 'id', 'Itaque similique praesentium et excepturi et. Occaecati veniam eos vel voluptatibus dolor enim. Aspernatur qui sit in iusto.', null);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (2, 'reprehenderit', 'Dolore quis placeat quia. Rerum hic ratione et provident. Autem voluptatum dignissimos reprehenderit quo vitae numquam.', null);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (3, 'officia', 'Neque similique quo voluptatem quod quam aut eius. Aliquid cupiditate quia quis eius ut soluta. Rerum consequatur ex sint praesentium repellendus aperiam nihil. Commodi sunt labore beatae quod corporis voluptates perspiciatis.', 1);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (4, 'dolores', 'Sit molestias fugit et. Error dolor quod et animi. Quae necessitatibus quia deserunt veritatis iste et molestiae. Officia commodi quaerat aliquid eaque quo. Autem et a laboriosam delectus.', 1);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (5, 'et', 'Dolores officia quae itaque ut velit. Reiciendis et sint eos rerum modi aut. Sed sequi laborum ut sunt harum est ut.', 2);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (6, 'voluptatem', 'Non eum nulla quidem tempora aut. Nostrum sit dolorem et vel. Rerum ullam eveniet cum sint blanditiis. Architecto veniam rem modi cum.', 2);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (7, 'dolore', 'Quaerat et dolores sint nemo. Earum aut ut eos sapiente non in facilis illum. Ut atque esse nesciunt est voluptatum.', 3);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (8, 'officiis', 'Temporibus fugiat aut aut quasi nihil ut qui. Voluptatibus repellat quas minus dolorem nobis voluptas consequatur. Sed ab voluptatum et suscipit mollitia eveniet sint.', 4);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (9, 'voluptatem', 'Repudiandae omnis alias vel mollitia. Fugit velit et eos ratione itaque.', 5);
INSERT INTO `catalogs` (`catalog_id`, `name`, `description`, `parent_id`) VALUES (10, 'ut', 'Voluptatum eaque asperiores laboriosam dolores vitae laboriosam ipsum. Vel non voluptas ea temporibus mollitia. Delectus est odio deleniti libero aut dolorem earum. Id doloremque hic libero rerum optio aut.', 1);


