-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 6 - Операции, фильтровка и сортировка
-- # Date: 2020-01-24
-- #
-- # 1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).
-- # 2. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
-- # 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- # 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- # 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- #
-- # ************************************************

USE vk;
-- Задание 1.

-- Задание 2.
-- найдем пользователя у которого больше всего друзей
SELECT user_id, COUNT(friend_id) AS Num FROM friendship f2 GROUP BY user_id ORDER BY Num DESC;

-- используем пользователя user_id = 16
-- друзья пользователя 16
SELECT friend_id FROM friendship f2 WHERE user_id = 16;

-- найдем друга который больше всего с ним общался
SELECT 
	from_user_id, COUNT(id) AS Num
FROM 
	messages m2 
WHERE 
	to_user_id = 16 AND from_user_id IN 
		(SELECT friend_id FROM friendship f2 WHERE user_id = 16) 
GROUP BY from_user_id
ORDER BY Num DESC
LIMIT 1;

-- получим его имя
DESCRIBE users;
SELECT CONCAT_WS(' ', first_name, last_name) AS "User name" FROM users u2 WHERE id = 46;

-- итоговый запрос:
SELECT 
	id, CONCAT_WS(' ', first_name, last_name) AS "Most friend name"
FROM 
	users u2 
WHERE 
	id = (SELECT 
			from_user_id
		  FROM 
			messages m2 
		  WHERE 
			to_user_id = 16 AND from_user_id IN 
				(SELECT 
					friend_id 
				FROM 
					friendship f2 
				WHERE 
					user_id = 16) 
		  GROUP BY from_user_id
		  ORDER BY COUNT(id) DESC
		  LIMIT 1);


-- Задание 3 - Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- получим 10 самых молодых пользователей
SELECT 
	user_id, 
	(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS Age
FROM
	profiles
ORDER BY Age 
LIMIT 10;

-- MySQL не поддерживает LIMIT внутри подзапроса - по видимому на это и было задание
-- не знаю как сделать - сделал через временную таблицу

-- создаем временную таблицу
CREATE TEMPORARY TABLE 10_Yangest_users (
	id INT UNSIGNED NOT NULL PRIMARY KEY
);

-- получаем в нее 10 самых молодых пользователей (только их id)
INSERT INTO 10_Yangest_users (id) 
		SELECT 
			user_id
		FROM
			profiles
		ORDER BY 
			(TIMESTAMPDIFF(YEAR, birthday, NOW())) 
		LIMIT 10;

-- считаем лайки пользователей, входящих во временную таблицу
SELECT 
	COUNT(id) 
FROM 
	likes 
WHERE 
	user_id IN (
		SELECT 
			id
		FROM
			10_Yangest_users);
		
-- чистим за собой - удаляем временную таблицу
DROP TABLE 10_Yangest_users;

-- Задание 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- выбираем только мужчин или женщин
SELECT user_id FROM profiles p2 WHERE sex = 'm';

-- считаем для них количество лайков
SELECT COUNT(id) FROM likes WHERE user_id IN (SELECT user_id FROM profiles p2 WHERE sex = 'm')
UNION
SELECT COUNT(id) FROM likes WHERE user_id IN (SELECT user_id FROM profiles p2 WHERE sex = 'f');

-- Задание 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- посчитаем для каждого пользователя количество файлов, сообщений и лайков 
-- сгруппируем по user_id и просуммируем
-- выведем 10 первых 


SELECT 
	user_id AS user_id, 
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = media.user_id) AS 'User name', 
    COUNT(id) AS Num 
FROM media GROUP BY user_id
UNION
SELECT 
	from_user_id AS user_id, 
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = messages.from_user_id) AS 'User name', 
    COUNT(id) AS Num 
FROM messages GROUP BY user_id
UNION
SELECT 
	user_id AS user_id, 
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = likes.user_id) AS 'User name', 
	COUNT(id) AS Num FROM likes GROUP BY user_id
ORDER BY Num
LIMIT 10;


