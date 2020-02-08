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
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'таблица пользователей';

-- профиль пользователя
-- DROP TABLE IF NOT EXISTS user_profiles;
CREATE TABLE IF NOT EXISTS user_profiles(
	user_id INT UNSIGNED NOT NULL PRIMARY KEY,
	sex CHAR(1),
  	birthday DATE,
  	post_idx INT,
  	town VARCHAR(100),
  	address VARCHAR(255)
);

-- типы пользователей
-- DROP TABLE IF EXISTS user_types; 
CREATE TABLE IF NOT EXISTS user_types(
	user_id INT UNSIGNED NOT NULL PRIMARY KEY,
	type_name VARCHAR(255) NOT NULL,
	description TEXT 
);

-- товар
-- DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE
);

-- описание товара
-- DROP TABLE IF EXISTS product_profile;
CREATE TABLE IF NOT EXISTS product_profile(
	product_id INT UNSIGNED NOT NULL PRIMARY KEY,
	catalog_id INT UNSIGNED NOT NULL,
	description TEXT,
	purchased_at DATE,
	sold_at DATE
);

-- каталоги товаров
-- DROP TABLE IF EXISTS catalogs;
CREATE TABLE IF NOT EXISTS catalogs(
	catalog_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
);















