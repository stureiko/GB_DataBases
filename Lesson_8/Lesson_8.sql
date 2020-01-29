-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 8 - использование JOIN
-- # Date: 2020-01-26
-- #
-- # 1. Добавить необходимые внешние ключи для всех таблиц базы данных vk (приложить команды).
-- #
-- # 2. По созданным связям создать ER диаграмму, используя Dbeaver (приложить графический файл к ДЗ).
-- #
-- # 3. Переписать запросы, заданые к ДЗ урока 6 с использованием JOIN (четыре запроса).
-- # 3.1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
-- # 3.2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- # 3.3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- # 3.4. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- #
-- # ************************************************

USE vk;

-- Задание 1. Добавить необходимые внешние ключи для всех таблиц базы данных vk (приложить команды).

-- для profiles
DESC profiles;

-- убераем требование NOT NULL с photo_id
ALTER TABLE profiles
MODIFY photo_id INT UNSIGNED;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL
      ON UPDATE CASCADE;
      
-- Для messages
DESC messages;

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
    
   
 -- для friendship
 DESCRIBE friendship;

 ALTER TABLE friendship
 	ADD CONSTRAINT friendship_status_id_fk
 		FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
 			ON UPDATE CASCADE;
 		
 ALTER TABLE friendship
 	ADD CONSTRAINT friendship_user_id_fk 
 		FOREIGN KEY (user_id) REFERENCES users(id)
 			ON UPDATE CASCADE;
 		
  ALTER TABLE friendship
 	ADD CONSTRAINT friendship_friend_id_fk 
 		FOREIGN KEY (friend_id) REFERENCES users(id)
 			ON UPDATE CASCADE;
 		
 -- для likes
DESCRIBE likes;

ALTER TABLE likes
	ADD CONSTRAINT likes_target_id_fk
		FOREIGN KEY (target_type_id) REFERENCES target_types(id)
			ON UPDATE CASCADE; 	

ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE;

-- для posts
DESCRIBE posts;

ALTER TABLE posts
	ADD CONSTRAINT posts_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE;

 ALTER TABLE posts
	ADD CONSTRAINT posts_media_id_fk
		FOREIGN KEY (media_id) REFERENCES media(id);
		
	
-- для media
DESCRIBE media;

ALTER TABLE media
	ADD CONSTRAINT media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id)
			ON UPDATE CASCADE;
ALTER TABLE media
	ADD CONSTRAINT media_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE;
	
-- для communities
DESCRIBE communities;

ALTER TABLE communities
	ADD CONSTRAINT comm_photo_id_fk
		FOREIGN KEY (photo_id) REFERENCES media(id)
		ON UPDATE CASCADE;
	
-- для communities_users
DESCRIBE communities_users;

ALTER TABLE communities_users
	ADD CONSTRAINT communities_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id)
			ON UPDATE CASCADE;

ALTER TABLE communities_users
	ADD CONSTRAINT communities_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE;

 -- для meetengs_users
 DESCRIBE meetings_users;

ALTER TABLE meetings_users
	ADD CONSTRAINT meetings_meeting_id_fk
		FOREIGN KEY (meeting_id) REFERENCES meetings(id)
		ON UPDATE CASCADE,
	ADD CONSTRAINT meetings_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
		ON UPDATE CASCADE;
 
-- # 3. Переписать запросы, заданые к ДЗ урока 6 с использованием JOIN (четыре запроса).
-- # 3.1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
-- найдем всех друзей


SELECT 
	(SELECT CONCAT_WS(' ', first_name, last_name) FROM users u2 WHERE id = from_user_id) AS User , COUNT(from_user_id) AS Num_messages 
		FROM messages m JOIN 
			(SELECT user_id AS id FROM friendship f2 WHERE friend_id = 10 AND status_id = 3
			UNION
			SELECT friend_id AS id FROM friendship WHERE user_id = 10 AND status_id = 3) AS Fr
		ON m.to_user_id = Fr.id OR m.from_user_id = Fr.id
		GROUP BY from_user_id
		ORDER BY Num_messages DESC
		LIMIT 1;
	

-- # 3.2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT CONCAT_WS(' ', first_name, last_name) AS User_name FROM users u2 
	JOIN
		(SELECT sp.id, COUNT(*) AS Total_likes
		FROM likes l
		JOIN 
			(SELECT user_id AS id FROM profiles p2 ORDER BY birthday DESC) AS sp
		ON l.target_id = sp.id		
		GROUP BY target_id
		ORDER BY Total_likes DESC
		LIMIT 10) AS us
	ON u2.id = us.id;


-- # 3.3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT CASE(p2.sex)
		WHEN 'm' THEN 'man'
		WHEN 'f' THEN 'woman'
	END AS sex, COUNT(*) AS Total_likes FROM likes l2 JOIN
	profiles p2
	ON l2.user_id = p2.user_id
	GROUP BY p2.sex
	ORDER BY Total_likes DESC;

-- # 3.4. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- в уроке 6 использовали 
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS user,
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = u2.id) +
	(SELECT COUNT(*) FROM  media WHERE media.user_id = u2.id) +
	(SELECT COUNT(*) FROM messages m2 WHERE m2.from_user_id = u2.id)
	AS Overall_activity
	FROM users u2
	ORDER BY Overall_activity
	LIMIT 10;
-- не смог подобрать проще.


   