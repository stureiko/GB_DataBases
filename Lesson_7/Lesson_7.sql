-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 7 - сложные запросы
-- # Date: 2020-01-25
-- #
-- # 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
-- # 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
-- # 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
-- #
-- # ************************************************

USE shop;
-- Задание 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT name FROM users u2 WHERE id IN (SELECT user_id FROM orders);

-- Задание 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT name, (SELECT name FROM catalogs c2 WHERE c2.id = p2.catalog_id) AS 'Catalog name' FROM products p2 WHERE name LIKE 'AMD%';

-- Задание 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

-- Создаем таблицы и вставляем значения
DROP TABLE IF EXISTS flights;
CREATE TABLE IF NOT EXISTS flights(
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	f_from VARCHAR(255) NOT NULL,
	f_to VARCHAR(255) NOT NULL
);

INSERT INTO flights VALUES 
	(1, 'mos', 'spb'),
	(2, 'irk', 'mos'),
	(3, 'arh', 'spb');

DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
	label VARCHAR(255) NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

INSERT INTO cities VALUES
	('mos', 'Москва'),
	('spb', 'Санкт-Петербург'),
	('irk', 'Иркутск'),
	('arh', 'Архангельск');


-- получаем все содержимое таблицы полетов, заменяя метки городов на их русские названия
SELECT id, (SELECT name FROM cities c1 WHERE c1.label = f1.f_from) AS 'From', (SELECT name FROM cities c1 WHERE c1.label = f1.f_to) AS 'To' FROM flights f1;







