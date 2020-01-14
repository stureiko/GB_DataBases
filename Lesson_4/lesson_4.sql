-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 4 - CRUD операции
-- # Date: 2020-01-13
-- #
-- # 1. Доработка БД vk
-- # 1.1 Правка таблицы profiles - корректировка поля sex
-- # 1.2 Изменяем таблицу messages - меняем from_user_id и to_user_id - не должны совпадать
-- # 1.3 Изменяем таблицу media_types - оставляем только три значения 'photo', 'video', 'audio'
-- # 1.4 Изменяем таблицу media - обновляем связь с таблицей media_types и user_id ставим случайным образом,
-- #     добавляем имя файла - ссылка на ресурс + user_id + его размер, добавляем данные в поле meta, меняем тип поля meta на json 
-- # 1.5 Изменяем таблицу friendship - user_id и friend_id не должны совпадать
-- # 1.6 Изменяем таблицу friendship_status - устанавливаем только три значения 'requested', 'confirmd' и 'interrupted'
-- # 1.7 Изменяем таблицу communities_users - устанавливаем user_id случайным образом
-- # 2. Доработка структуры БД
-- # 2.1 Добавляем таблицу с постами
-- # 2.2 В таблицу profiles добавим поле updated_at 
-- # 2.3 Добавлена таблица встреч
-- #
-- # ************************************************

USE vk;

-- users
SELECT * FROM users LIMIT 10;

-- profiles
SELECT * FROM profiles LIMIT 10;
UPDATE profiles SET sex = 'm' WHERE sex = '(';
UPDATE profiles SET sex = 'f' WHERE sex = '"';

-- messages
SELECT * FROM messages LIMIT 10;
UPDATE messages SET
   from_user_id = FLOOR(1 + (RAND() * 100)),
   to_user_id = FLOOR(1 + (RAND() * 100));
-- проверяем, что убрали все совпадения
SELECT * FROM messages WHERE from_user_id = to_user_id;
-- если нет - то повторяем пока не уберем все совпадения
UPDATE messages SET
   to_user_id = FLOOR(1 + (RAND() * 100)) 
   WHERE from_user_id = to_user_id;

-- media_types
SELECT * FROM media_types LIMIT 10;
DELETE FROM media_types;
TRUNCATE media_types;

INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio');

-- media
SELECT * FROM media LIMIT 10;
UPDATE media SET media_type_id = FLOOR(1 + (RAND() * 3));
UPDATE media SET user_id = FLOOR(1 + (RAND() * 10000));
UPDATE media SET filename = CONCAT('https://dropbox/vk/file_',user_id, '_', size);
UPDATE media SET metadata = CONCAT(
  '{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
   '"}');
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- friendship
SELECT * FROM friendship LIMIT 10;
UPDATE friendship SET
  user_id = FLOOR(1 + (RAND() * 10000)),
  friend_id = FLOOR(1 + (RAND() * 10000));

SELECT * FROM friendship WHERE user_id = friend_id;
UPDATE friendship SET
  user_id = FLOOR(1 + (RAND() * 10000))
  WHERE user_id = friend_id;

-- friendship_status
TRUNCATE friendship_statuses;
INSERT INTO friendship_statuses (name)
  VALUES ('Requested'), ('Confirmed'), ('Interrupted');
UPDATE friendship SET status_id = FLOOR(1 + (RAND() * 2));

-- communities_users
SELECT * FROM communities_users LIMIT 10;
UPDATE communities_users SET
  community_id = FLOOR(1 + (RAND() * 100)),
  user_id = FLOOR(1 + (RAND() * 10000));

-- posts
CREATE TABLE posts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    header VARCHAR(255),
    body TEXT NOT NULL,
    media_id INT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- add to profiles field 'updated_at'
ALTER TABLE profiles ADD COLUMN updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();

-- meetings
CREATE TABLE meetings (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE,
  scheduled_at DATETIME);

