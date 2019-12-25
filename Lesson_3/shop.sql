CREATE DATABASE IF NOT EXISTS shop;
USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE IF NOT EXISTS catalogs (
	id INT UNSIGNED NOT NULL,
	name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет магазина';

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
	id INT UNSIGNED NOT NULL,
	name VARCHAR(255) COMMENT 'Имя пользователя',
	birthday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления'
) COMMENT = 'Зарегистрированные пользователи';

DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products (
	id INT UNSIGNED NOT NULL,
	name VARCHAR(255) COMMENT 'Название',
	description TEXT COMMENT 'Описание товара',
	price DECIMAL(11,2) COMMENT 'Цнна товара',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления',
	catalog_id INT UNSIGNED
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления',
	user_id INT UNSIGNED
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS oders_products;
CREATE TABLE IF NOT EXISTS oders_products(
	id INT UNSIGNED NOT NULL,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления',
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций'
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE IF NOT EXISTS discounts(
	id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	started_at DATETIME,
	finished_at DATETIME,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления',
	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0'
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE IF NOT EXISTS storehouses(
	id INT UNSIGNED NOT NULL,
	name VARCHAR(255) COMMENT 'Название склада',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления'
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE IF NOT EXISTS storehouses_products(
	id INT UNSIGNED NOT NULL,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления'
) COMMENT = 'Запасы на складе';








