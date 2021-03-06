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

-- # Задание 1.1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- # Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
DELETE FROM sample.users WHERE id = 1;
INSERT INTO sample.users SELECT * FROM shop.users u WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- # Задание 1.2. Создайте представление, которое выводит название name товарной позиции из таблицы products и 
-- # соответствующее название каталога name из таблицы catalogs.

CREATE VIEW position_catalogs AS 
	SELECT p2.name AS product_name, c2.name AS catalog_name 
		FROM products p2 
			JOIN catalogs c2 
		ON p2.catalog_id = c2.id;

-- # Задание 1.3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
-- # В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
-- # Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
-- # если дата присутствует в исходном таблице и 0, если она отсутствует.

	
-- # Задание 1.4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
-- # Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

-- # 3.1 Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- # в зависимости от текущего времени суток. 
-- # С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- # с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

-- данный скрипт отрабатывает на MySQL Workbench, НО отказывается работат в DBeaver!

DELIMITER //;

CREATE FUNCTION hello()
	RETURNS VARCHAR(255) DETERMINISTIC
	BEGIN
		SET @time := DATE_FORMAT(NOW(), '%H');
		CASE
			WHEN @time BETWEEN 0 AND 6 THEN RETURN "Доброй ночи";
			WHEN @time BETWEEN 6 AND 12 THEN RETURN "Доброе утро";
			WHEN @time BETWEEN 12 AND 18 THEN RETURN "Добрый день";
			WHEN @time BETWEEN 18 AND 0 THEN RETURN "Добрый вечер";
		END CASE;
	END//

DELIMITER ;//

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

