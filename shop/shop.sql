-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Курсовой проект - БД интернет магазина
-- # Date: 2020-02-05
-- #
-- # 1. Общее описание
-- # БД интернет магазина
-- # должна содержать описание товаров, каталогов, цен на товары, скидок для различных категорий пользователей
-- # время поступления товара на склад, время продажи, цену продажи
-- # пользователей, категорию пользователя, имя, фамилию, email, телефон, адрес, дату рождения (предоставление скидки на ДР и 10 дней после)   
-- #
-- # 1.1 Создание таблиц
-- # 1.2 Создание связей и внешних ключей
-- # 1.3 Создание индексов
-- # 1.3 Создание запросов на выборку данных (вьюхи)
-- # 1.4 Создание запросов на обновление данных (продажи - через процедуры)
-- #
-- # 2. Оптимизация БД
-- # 2.1 Оптимизация - анализ нагрузки SHOW STATUS LIKE 'Key%' для системной базы
-- # SHOW VARIABLES LIKE 'innodb_buffer_pool_size'
-- # SHOW STATUS LIKE 'Innodb_buffer_pool_%'
-- #
-- # ************************************************
DROP DATABASE IF EXISTS shop;
CREATE DATABASE IF NOT EXISTS shop;

USE shop;

SHOW TABLES;

-- таблица пользователей
-- DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(100) NOT NULL COMMENT 'имя', 
  last_name VARCHAR(100) NOT NULL COMMENT 'фамилия',
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(120) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  user_type_id INT UNSIGNED NOT NULL
) COMMENT = 'таблица пользователей';

-- профиль пользователя
-- DROP TABLE IF NOT EXISTS user_profiles;
CREATE TABLE IF NOT EXISTS user_profiles(
	user_id INT UNSIGNED NOT NULL PRIMARY KEY,
	sex CHAR(1),
  	birthday DATE
);

-- адреса пользователя
-- у пользователя может быть несколько адресов доставки
-- уникальным является сочетание пользователя и адреса - составной первичный ключ
-- DROP TABLE IF EXISITS user_adresses;
CREATE TABLE IF NOT EXISTS user_adresses(
	user_id INT UNSIGNED NOT NULL,
	post_idx INT,
  	town VARCHAR(100),
  	address VARCHAR(255)
);

-- типы пользователей
-- DROP TABLE IF EXISTS user_types; 
CREATE TABLE IF NOT EXISTS user_types(
	user_type_id INT UNSIGNED NOT NULL PRIMARY KEY,
	type_name VARCHAR(255) NOT NULL,
	description TEXT 
);

-- товар
-- DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products(
	product_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	catalog_id INT UNSIGNED NOT NULL,
	base_price DECIMAL NOT NULL
);

-- описание товара
-- DROP TABLE IF EXISTS product_profile;
CREATE TABLE IF NOT EXISTS product_profile(
	product_id INT UNSIGNED NOT NULL PRIMARY KEY,
	description TEXT,
	purchased_at DATE
);

-- каталоги товаров
-- каталоги имеют терархическую струтктуру - поэтому хранят id родительского каталога
-- DROP TABLE IF EXISTS catalogs;
CREATE TABLE IF NOT EXISTS catalogs(
	catalog_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	parent_id INT UNSIGNED
);

-- возможные статусы заказа
-- оформлен, оплачен, отгружен, доставлен, отменен и т.п.
-- DROP TABLE IF EXISTS order_statuses;
CREATE TABLE IF NOT EXISTS order_statuses(
	status_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	description TEXT
);

-- заказ
-- DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
	order_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL
);

-- статусы заказа
-- отражают движение заказа (например)
-- оформлен -> оплачен -> отгружен -> доставлен -> выполнен
-- оформлен -> оплачен -> отменен
-- оформлен -> оплачен -> отгружен -> доставлен -> возврат -> отменен
-- на каждую операцию фиксируется дата
CREATE TABLE IF NOT EXISTS orders_order_statuses(
	order_id INT UNSIGNED NOT NULL,
	status_id INT UNSIGNED NOT NULL,
	set_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);

-- товары в заказе
-- DROP TABLE IF EXISTS order_products;
CREATE TABLE IF NOT EXISTS orders_products(
	order_id INT UNSIGNED NOT NULL,
	product_id INT UNSIGNED NOT NULL,
	price DECIMAL NOT NULL
);

-- таблица скидок
CREATE TABLE discounts(
	discount_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	discount DECIMAL UNIQUE NOT NULL
);

-- таблица скидок для пользователя
CREATE TABLE user_type_discounts(
	user_type_id INT UNSIGNED UNIQUE NOT NULL,
	discount_id INT UNSIGNED NOT NULL
);


-- # 1.2 Создание связей и внешних ключей

-- связь пользователей и профилей
ALTER TABLE user_profiles
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;
	
-- связь пользователей и их адресов
ALTER TABLE user_adresses
	ADD CONSTRAINT addresses_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;
		
-- связь пользователей и их типов
ALTER TABLE users
	ADD CONSTRAINT user_types_user_id_fk
		FOREIGN KEY (user_type_id) REFERENCES user_types(user_type_id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;
		
-- связь продукта и каталога
ALTER TABLE products
	ADD CONSTRAINT products_catalog_id_fk
		FOREIGN KEY (catalog_id) REFERENCES catalogs(catalog_id)
			ON UPDATE CASCADE;
		
-- связь продукта и его описания
ALTER TABLE product_profile
	ADD CONSTRAINT profile_product_id_fk
		FOREIGN KEY (product_id) REFERENCES products(product_id)
			ON UPDATE CASCADE;
		
-- связь в таблице каталога - иерархия
ALTER TABLE catalogs
	ADD CONSTRAINT catalogs_parent_id_fk
		FOREIGN KEY (parent_id) REFERENCES catalogs(catalog_id)
			ON UPDATE CASCADE;
		
-- связь заказа с пользователем
ALTER TABLE orders
	ADD CONSTRAINT orders_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE;
		
-- связь заказа и его статуса
ALTER TABLE orders_order_statuses
	ADD CONSTRAINT order_status_id_fk
		FOREIGN KEY (order_id) REFERENCES orders(order_id)
			ON UPDATE CASCADE;
		
-- связь статуса заказа с возможными статусами
ALTER TABLE orders_order_statuses
	ADD CONSTRAINT order_status_statuses_id_fk
		FOREIGN KEY (status_id) REFERENCES order_statuses(status_id)
			ON UPDATE CASCADE;
		
-- связь заказа и продуктов его составляющих
ALTER TABLE orders_products
	ADD CONSTRAINT order_orders_id_fk
		FOREIGN KEY (order_id) REFERENCES orders(order_id)
			ON UPDATE CASCADE,
	ADD CONSTRAINT order_products_id_fk
		FOREIGN KEY (product_id) REFERENCES products(product_id)
			ON UPDATE CASCADE;

-- связь типов скидок и самих скидок
ALTER TABLE user_type_discounts
	ADD CONSTRAINT discount_type_discount_id_fk
		FOREIGN KEY (discount_id) REFERENCES discounts(discount_id)
			ON UPDATE CASCADE;
	
-- связь скидок и пользователей
ALTER TABLE user_type_discounts
	ADD CONSTRAINT discount_type_user_type_fk
		FOREIGN KEY (user_type_id) REFERENCES user_types(user_type_id)
			ON UPDATE CASCADE;
		
		
-- # 1.3 Создание индексов

-- наиболее частые запросы для формирования индексов

-- найти товар по названию
-- выбрать товар определенной категории
-- сортировать товар по цене
-- получить товары заказа

CREATE INDEX products_name_idx ON products(name);
CREATE INDEX products_base_price_idx ON products(base_price);
CREATE INDEX odred_products_idx ON orders_products(order_id);

-- # 1.3 Создание запросов на выборку данных (вьюхи)
-- получить 10 товаров которые дольше всего лежали на складе перед продажей
SELECT p.product_id, p.name, 
		pr.purchased_at - os.set_at AS 'Time in store',
		ords.name
FROM products p
	JOIN orders_products op
		ON p.product_id = op.product_id
	JOIN orders ord
		ON op.order_id = ord.order_id
	JOIN orders_order_statuses os
		ON os.order_id = ord.order_id
	JOIN order_statuses ords
		ON os.status_id = ords.status_id
	JOIN product_profile pr
		ON pr.product_id = p.product_id
 	WHERE ords.name = 'complited'
	LIMIT 10;
	
-- получить 10 пользователей купивших на максимальные суммы за последний месяц
-- SELECT u2.id, u2.first_name, u2.last_name,
-- 		SUM(op.price)
-- 	FROM users u2
-- 	JOIN orders ords
-- 		ON u2.id - ords.user_id
-- 	JOIN orders_products op
-- 		ON ords.order_id = op.order_id
-- 	LIMIT 10;


-- процедуры и  функции
-- найти товар в описании которого есть строка 'sample_string'
-- CREATE PROCEDURE get_products_like_as (IN sample_string VARCHAR(255)
-- BEGIN
-- 	SELECT p.product_id AS id, p.catalog_id AS catalog, p.name AS product_name FROM products p
-- 	JOIN product_profile pf
-- 		ON p.product_id = pf.product_id
-- 			pf.description = LIKE sample_string;
-- END;




