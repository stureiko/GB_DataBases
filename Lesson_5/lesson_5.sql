-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 5 - Операции, фильтровка и сортировка
-- # Date: 2020-01-19
-- #
-- # 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
-- #
-- # 2.Таблица users была неудачно спроектирована. 
-- #   Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- #   Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
-- #
-- # 3.В таблице складских запасов tbl в поле value могут встречаться самые разные цифры: 
-- #   0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- #   Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- #   Однако, нулевые запасы должны выводиться в конце, после всех записей.
-- #
-- #
-- # ************************************************

-- Задание 1
UPDATE users SET created_at = NOW(), updated_at = NOW();

-- Задание 2
UPDATE users SET created_at = DATE_FORMAT(STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),'%Y-%m-%d %H:%i'), 
                 updated_at = DATE_FORMAT(STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i'),'%Y-%m-%d %H:%i');
ALTER TABLE users MODIFY COLUMN created_at DATETIME, updated_at DATETIME;

-- Задание 3
-- Мне не нравится решение, но лучше не понял как сделать
SELECT *, value as val FROM tbl WHERE value > 0
UNION ALL
SELECT*, value + (SELECT MAX(value) FROM tbl) + 1 AS val FROM tbl WHERE value = 0
ORDER BY val;
