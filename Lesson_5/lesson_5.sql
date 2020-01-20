-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 5 - Операции, фильтровка и сортировка
-- # Date: 2020-01-19
-- #
-- # 1. Операторы, фильтрация, сортировка и ограничение
-- # 1.1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
-- #
-- # 1.2 Таблица users была неудачно спроектирована. 
-- #   Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- #   Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
-- #
-- # 1.3 В таблице складских запасов tbl в поле value могут встречаться самые разные цифры: 
-- #   0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- #   Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- #   Однако, нулевые запасы должны выводиться в конце, после всех записей.
-- #
-- # 1.4 (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- #   Месяцы заданы в виде списка английских названий ('may', 'august')
-- #
-- # 1.5 (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
-- #   SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
-- #
-- # Практическое задание теме “Агрегация данных”
-- # 2.1 Подсчитайте средний возраст пользователей в таблице users
-- #
-- # 2.2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- #   Следует учесть, что необходимы дни недели текущего года, а не года рождения.
-- #
-- # 2.3 (по желанию) Подсчитайте произведение чисел в столбце таблицы
-- #
-- #
-- # ************************************************
USE GeekBrainsDB;
-- Задание 1.1
UPDATE users SET created_at = NOW(), updated_at = NOW();

-- Задание 1.2
UPDATE users SET created_at = DATE_FORMAT(STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),'%Y-%m-%d %H:%i'), 
                 updated_at = DATE_FORMAT(STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i'),'%Y-%m-%d %H:%i');
ALTER TABLE users MODIFY COLUMN created_at DATETIME, updated_at DATETIME;

-- Задание 1.3

SELECT
  *
FROM
  tbl
ORDER BY
  value = 0, value;
 
-- Задание 1.4
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя',
  birthday DATE COMMENT 'Дата рождения');
 
INSERT INTO
  users (name, birthday)
VALUES
  ('Alex', '1984-11-20'),
  ('Ksu', '1984-10-20'),
  ('Sergey', '1985-09-20'),
  ('Ivan', '1988-08-20'),
  ('Boris', '2010-07-20'),
  ('Sveta', '2006-05-20'),
  ('Olga', '2005-04-20'),
  ('Oleg', '1945-03-20'),
  ('Andrey', '1978-02-20'),
  ('Masha', '1999-01-20');

SELECT * FROM users WHERE DATE_FORMAT(birthday, '%M') IN ('may', 'november');

-- Задание 1.5
DROP TABLE IF EXISTS catalogs;

CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

INSERT INTO
	catalogs (name)
VALUES
	('name 1'),
	('name 2'),
	('name 3'),
	('name 4'),
	('name 5'),
	('name 6');

SELECT * FROM catalogs;

SELECT 
	* 
FROM
	catalogs
WHERE
	id IN (5, 2, 1)
ORDER BY 
	FIELD(id, 5, 1, 2);


-- Задание 2.1
SELECT AVG(DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(birthday, '%Y')) AS Average_Age FROM users;
-- разный ответ?!
SELECT
	AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS Average_Age
FROM
	users;

-- Задание 2.2
SELECT 
	DATE_FORMAT(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday), DAY(birthday)), '%W') AS day, COUNT(*) AS total
FROM
	users
GROUP BY
	day
ORDER BY
	total;

-- Задание 2.3
-- в качестве значений возмем возраст пользователей из задания 2.1
-- решение подсмотрим в интернете :)
SELECT
	EXP(SUM(LOG(TIMESTAMPDIFF(YEAR, birthday, NOW())))) AS MULT
FROM
	users;

