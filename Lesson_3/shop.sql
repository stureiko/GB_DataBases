CREATE DATABASE IF NOT EXISTS shop;
USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE IF NOT EXISTS catalogs (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет магазина';

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Имя пользователя'
) COMMENT = 'Зарегистрированные пользователи';

DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS prosucts (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Название',
	description TEXT COMMENT 'Описание товара',
	price DECIMAL(11,2) COMMENT 'Цнна товара',
	catalog_id INT UNSIGNED
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED,
	user_id INT UNSIGNED
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS oders_products;
CREATE TABLE IF NOT EXISTS oders_products(
	id INT UNSIGNED,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций'
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE IF NOT EXISTS discounts(
	id INT UNSIGNED,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0'
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE IF NOT EXISTS storehouses(
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Название склада'
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE IF NOT EXISTS storehouses_products(
	id INT UNSIGNED,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе'
) COMMENT = 'Запасы на складе';








