USE vk;

SHOW TABLES;

DESCRIBE friendship;

-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

-- выберем всех пользователем с дружбой с выбранным user_id = 10 и подтвержденным статусом дружбы
SELECT * FROM friendship f2 WHERE (user_id = 10 OR friend_id = 10) AND status_id = 3;

-- соберем этот результат в лдин столбец только с id для дальнейшего использования
SELECT user_id AS id FROM friendship f2 WHERE friend_id = 10 AND status_id = 3
UNION
SELECT friend_id AS id FROM friendship WHERE user_id = 10 AND status_id = 3;

-- вытащим все сообщения от этих пользователей
SELECT from_user_id 
	FROM messages m2 
		WHERE to_user_id = 10 
			AND from_user_id IN (
				SELECT user_id AS id FROM friendship f2 WHERE friend_id = 10 AND status_id = 3
				UNION
				SELECT friend_id AS id FROM friendship WHERE user_id = 10 AND status_id = 3);

DESCRIBE users;

-- заменим id на имя и фамилию пользователя
SELECT (SELECT CONCAT_WS(' ', first_name, last_name) FROM users u2 WHERE id = from_user_id) AS 'User'
	FROM messages m2 
		WHERE to_user_id = 10 
			AND from_user_id IN (
				SELECT user_id AS id FROM friendship f2 WHERE friend_id = to_user_id AND status_id = 3
				UNION
				SELECT friend_id AS id FROM friendship WHERE user_id = to_user_id AND status_id = 3);

-- полсчитаем количество сообщения от каждого пользователя
-- сгруппируем по пользователю и отсртируем по количеству сообщений
SELECT 	(SELECT CONCAT_WS(' ', first_name, last_name) FROM users u2 WHERE id = from_user_id) AS 'User',
		COUNT(*) AS Total_num_messages
	FROM messages m2 
		WHERE to_user_id = 10 
			AND from_user_id IN (
				SELECT user_id AS id FROM friendship f2 WHERE friend_id = to_user_id AND status_id = 3
				UNION
				SELECT friend_id AS id FROM friendship WHERE user_id = to_user_id AND status_id = 3)
		GROUP BY User
		ORDER BY Total_num_messages DESC
	LIMIT 1;

-- если убрать условие подтверждения дружбы
SELECT 	(SELECT CONCAT_WS(' ', first_name, last_name) FROM users u2 WHERE id = from_user_id) AS 'User',
		COUNT(*) AS Total_num_messages
	FROM messages m2 
		WHERE to_user_id = 10 
			AND from_user_id IN (
				SELECT user_id AS id FROM friendship f2 WHERE friend_id = to_user_id
				UNION
				SELECT friend_id AS id FROM friendship WHERE user_id = to_user_id
				)
		GROUP BY User
		ORDER BY Total_num_messages DESC
		LIMIT 1;


-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- статус таргета должен быть user = 2
SELECT * FROM target_types;

-- получаем 10 самых молодых пользователей
SELECT user_id FROM profiles p2 ORDER BY birthday DESC LIMIT 10;

-- получаем id пользователей которых больше всего лайкали - именно пользователей
SELECT target_id, COUNT(*) 
FROM likes l 
	WHERE target_type_id = 2 
		AND target_id IN 
			(SELECT * FROM (SELECT user_id FROM profiles p2 ORDER BY birthday DESC LIMIT 10) AS sorted_profiles)
	GROUP BY target_id;

-- просуммируем для получения итоговой суммы
SELECT SUM(likes_per_user) AS likes_total FROM (
	SELECT COUNT(*) AS likes_per_user
	FROM likes l 
		WHERE target_type_id = 2 
			AND target_id IN 
				(SELECT * FROM (SELECT user_id FROM profiles p2 ORDER BY birthday DESC LIMIT 10) AS sorted_profiles)
		GROUP BY target_id
) AS Counted_likes;
			

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT CASE(sex)
		WHEN 'm' THEN 'man'
		WHEN 'f' THEN 'woman'
	END AS sex,
	COUNT(*) AS likes_count
	FROM (
			SELECT 
				user_id AS user,
				(SELECT sex FROM profiles p2 WHERE user_id = user) AS sex
			FROM likes l2
		) dummy_table
	GROUP BY sex
	ORDER BY likes_count DESC;

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS user,
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = u2.id) +
	(SELECT COUNT(*) FROM  media WHERE media.user_id = u2.id) +
	(SELECT COUNT(*) FROM messages m2 WHERE m2.from_user_id = u2.id)
	AS Overall_activity
	FROM users u2
	ORDER BY Overall_activity
	LIMIT 10;
	
