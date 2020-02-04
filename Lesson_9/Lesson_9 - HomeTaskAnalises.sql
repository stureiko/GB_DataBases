-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 9 - транзакции, администрирование, хранимые процедуры
-- # Date: 2020-01-30
-- #
-- # 1. Транзакции
-- # 1.1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- # Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
-- #
-- # 1.2. Создайте представление, которое выводит название name товарной позиции из таблицы products и 
-- # соответствующее название каталога name из таблицы catalogs.
-- # 
-- # 1.3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
-- # В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
-- # Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
-- # если дата присутствует в исходном таблице и 0, если она отсутствует.
-- #
-- # 1.4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
-- # Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
-- #
-- # 
-- # 2. Администрирование
-- # 2.1 Создайте двух пользователей которые имеют доступ к базе данных shop. 
-- # Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
-- # второму пользователю shop — любые операции в пределах базы данных shop.
-- # 
-- # 2.2 (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, 
-- # имя пользователя и его пароль. Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
-- # Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.
-- # 
-- #
-- # 3. Хранимые процедуры
-- # 3.1 Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- # в зависимости от текущего времени суток. 
-- # С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- # с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
-- #
-- # 3.2 В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- # Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- # Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- # При попытке присвоить полям NULL-значение необходимо отменить операцию.
-- # 
-- # 3.3 (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- # Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- # Вызов функции FIBONACCI(10) должен возвращать число 55.
-- #
-- # ************************************************

USE shop;
-- # Задание 1.1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- # Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
-- решение верно!
START TRANSACTION;
	DELETE FROM sample.users WHERE id = 1;
	INSERT INTO sample.users SELECT * FROM shop.users u WHERE id = 1;
	DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- # Задание 1.2. Создайте представление, которое выводит название name товарной позиции из таблицы products и 
-- # соответствующее название каталога name из таблицы catalogs.
-- мое решение 
CREATE VIEW position_catalogs AS 
	SELECT p2.name AS product_name, c2.name AS catalog_name 
		FROM products p2 
			JOIN catalogs c2 
		ON p2.catalog_id = c2.id;

-- решение преподавателя - отличие в первой строке и взят LEFT JOIN
CREATE OR REPLACE VIEW position_catalogs AS 
	SELECT p2.name AS product_name, c2.name AS catalog_name 
		FROM products p2 
			LEFT JOIN catalogs c2 
				ON p2.catalog_id = c2.id;	
	
-- # Задание 1.3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
-- # В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
-- # Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
-- # если дата присутствует в исходном таблице и 0, если она отсутствует.

show tables;
CREATE TABLE IF NOT EXISTS posts(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL, 
	created_at DATE NOT NULL
);

INSERT INTO posts VALUES
	(NULL, 'первая запись', '2018-08-01'),
	(null, 'вторая запись', '2018-08-04'),
	(NULL, 'третья запись', '2018-08-16'),
	(NULL, 'четвертая запись', '2018-08-17');
	
SELECT * FROM posts;

CREATE TEMPORARY TABLE last_days(
	day INT
);

INSERT INTO last_days VALUES
	(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
	(11), (12), (13), (14), (15), (16), (17), (18), (19), (20), 
	(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT 
	DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day,
	NOT ISNULL(p.name) AS order_exist
	FROM last_days AS l
	LEFT JOIN 
		posts AS p
		ON 
			DATE(DATE('2018-08-31') - INTERVAL l.day DAY) = p.created_at
		ORDER BY day;
	
	
	
-- # Задание 1.4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
-- # Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

INSERT INTO posts VALUES
	(NULL, 'первая запись', '2018-08-01'),
	(null, 'вторая запись', '2018-08-04'),
	(NULL, 'третья запись', '2018-08-16');

INSERT INTO posts VALUES	
	(NULL, 'пятая запись', '2018-08-19'),
	(null, 'шестая запись', '2018-08-21'),
	(NULL, 'седьмая запись', '2018-08-23'),
	(NULL, 'восьмая запись', '2018-08-30');
	
SELECT * FROM posts ORDER BY created_at;

SELECT *
	FROM posts
	JOIN
		(SELECT 
			created_at
		FROM posts
		ORDER BY created_at DESC
		LIMIT 5, 1) AS delpst
	ON
		posts.created_at <= delpst.created_at;

DELETE posts
	FROM posts
	JOIN
		(SELECT 
			created_at
		FROM posts
		ORDER BY created_at DESC
		LIMIT 5, 1) AS delpst
	ON
		posts.created_at <= delpst.created_at;
	
	
-- # Задание 2.1 Создайте двух пользователей которые имеют доступ к базе данных shop. 
-- # Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
-- # второму пользователю shop — любые операции в пределах базы данных shop.

CREATE USER 'shop_read'@'localhost'IDENTIFIED BY '123';
GRANT SELECT, SHOW VIEW ON shop.* TO 'shop_read'@'localhost';

CREATE USER 'shop'@'localhost' IDENTIFIED BY '123';
GRANT ALL ON shop.* TO 'shop'@'localhost';

DROP USER 'shop_read'@'localhost';
DROP USER 'shop'@'localhost';
	
-- # 2.2 (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, 
-- # имя пользователя и его пароль. Создайте представление username таблицы accounts, предоставляющий доступ к столбцам id и name. 
-- # Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.
	
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	password VARCHAR(255)
);

INSERT INTO accounts (name, password) VALUES
	('name1', 'pass1'),
	('name2', 'pass2'),
	('name3', 'pass3');

CREATE VIEW username AS SELECT id, name FROM accounts;

SELECT * FROM username;

CREATE USER IF NOT EXISTS 'accounts_read'@'localhost' IDENTIFIED BY '123';
GRANT SELECT (id, name) ON shop.username TO 'accounts_read'@'localhost';

DROP USER IF EXISTS 'accounts_read'@'localhost';

-- # 3.1 Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- # в зависимости от текущего времени суток. 
-- # С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- # с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

-- данный скрипт отрабатывает на MySQL Workbench, НО отказывается работат в DBeaver!

DELIMITER §

CREATE FUNCTION hello()
	RETURNS VARCHAR(255) NO SQL
	BEGIN
		DECLARE h_time;
		SET h_time = DATE_FORMAT(NOW(), '%H');
		CASE
			WHEN h_time BETWEEN 0 AND 6 THEN RETURN "Доброй ночи";
			WHEN h_time BETWEEN 6 AND 12 THEN RETURN "Доброе утро";
			WHEN h_time BETWEEN 12 AND 18 THEN RETURN "Добрый день";
			WHEN h_time BETWEEN 18 AND 0 THEN RETURN "Добрый вечер";
		END CASE;
	END§

DELIMITER ;

-- # 3.2 В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- # Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- # Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- # При попытке присвоить полям NULL-значение необходимо отменить операцию.

DROP TRIGGER IF EXISTS check_products_before;
DELIMITER //
CREATE TRIGGER check_products_before BEFORE INSERT ON products
FOR EACH ROW
    BEGIN
        IF (ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT cancelled';
        END IF;
    END//
DELIMITER ;

-- # 3.3 (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- # Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- # Вызов функции FIBONACCI(10) должен возвращать число 55.

CREATE FUNCTION fibonacchi(IN num INT)
	RETURNS INT DETERMINISTIC
	BEGIN
		SET @i := 0;
		SET @s := 0;
		WHILE @i <= num DO
			SET @s = @s + @i;
			SET @i = @i + 1;
		END WHILE;
		RETURN @s;
	END//

