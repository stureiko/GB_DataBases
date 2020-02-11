-- Урок 4
-- CRUD операции


-- Работа с БД vk
-- Загружаем дамп консольным клиентом
DROP DATABASE vk;
CREATE DATABASE vk;

-- Переходим в папку с дампом (/home/ubuntu)
-- mysql -u root -p vk < vk.dump.sql

-- Дорабатываем тестовые данные
SHOW TABLES;

-- users
SELECT * FROM users LIMIT 10;

-- profiles
SELECT * FROM profiles LIMIT 10;

CREATE TEMPORARY TABLE sex (sex CHAR(1));
INSERT INTO sex VALUES ('m'), ('f');
UPDATE profiles SET sex = (SELECT sex FROM sex ORDER BY RAND() LIMIT 1);

SHOW TABLES;
-- messages
SELECT * FROM messages LIMIT 10;
UPDATE messages SET
  from_user_id = FLOOR(1 + (RAND() * 100)),
  to_user_id = FLOOR(1 + (RAND() * 100))
;

-- media_types
SELECT * FROM media_types LIMIT 10;
DELETE FROM media_types;
TRUNCATE media_types;

INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio')
;

-- media
SELECT * FROM media LIMIT 10;
UPDATE media SET media_type_id = FLOOR(1 + (RAND() * 3));
UPDATE media SET user_id = FLOOR(1 + (RAND() * 100));
UPDATE media SET filename = CONCAT('https://dropbox/vk/file_', size);
UPDATE media SET metadata = CONCAT(
  '{"', 
  'owner', 
  '":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
   '"}');
DESC media;   
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- friendship
SELECT * FROM friendship LIMIT 10;
UPDATE friendship SET
  user_id = FLOOR(1 + (RAND() * 100)),
  friend_id = FLOOR(1 + (RAND() * 100))
;

DESC friendship;

-- friendship_statuses
SELECT * FROM friendship_statuses;
TRUNCATE friendship_statuses;
INSERT INTO friendship_statuses (name)
  VALUES ('Requested'), ('Confirmed');
UPDATE friendship SET status_id = FLOOR(1 + (RAND() * 2));  

-- communities
SELECT * FROM communities LIMIT 10;
DELETE FROM communities WHERE id > 20;

-- communities_users
SELECT * FROM communities_users LIMIT 10;
UPDATE communities_users SET
  community_id = FLOOR(1 + (RAND() * 20)),
  user_id = FLOOR(1 + (RAND() * 100))
;



-- Предложения по доработке структуры БД vk (только для ознакомления и анализа)

-- Предложение 1:
-- Таблица Profiles содержит столбец hometown. В больших городах живет много жителей
-- и у каждого user будет строковое написание названия его города,
-- которое будет повторяться много раз.
-- Возможно оптимальнее будет создать ещё одну таблицу 'place' с двумя столбцами:
-- id и name_place.

-- Предложение 2:
-- В нашей БД явно не хватает самой главной части: ленты с постами пользователей,
-- обычными текстовыми постами или ссылками на наши медиафайлы.
CREATE TABLE posts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    body TEXT NOT NULL,
    media_id INT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Предложение 3:
-- Продолжая, можно предположить, что нам нужна таблица для лайков/дизлайков к этим
-- постам, для комментариев к постам, для комментариев к комментариям, но это, я так
-- понимаю, на текущий момент лишнее.

-- Отвечая на Ваш вопрос о связях между users и  friendship. Считаю , что связь один к одному.
-- Так как один ключ соответсует тлько одному ключу. 
-- То есть у user может быть только одна пара user_id и friend_id и наоборот.
-- ну а из того что есть, я бы точно по другому сдела бы frendship.
--  В текущей ситуации мне кажеться сложным, получить всех друзей одного user.
-- Я бы наврное сделал две таблицы "ЗапросыДружбы" и "Дружба".
-- Причем в таблице "Дружба" сдела бы поля Друг_1 и Друг_2. И после того, как факт
-- дружбы будет утсновлен вносил бы две зеркальные записи.
-- Тогда лекго получить список друзей select Друг_1 from Дружба where Друг_2 = Нужный user

-- Предложение 4:
-- Таблица лайков
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL ,
  media_id INT UNSIGNED NOT NULL ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 );
 
 -- Предложение 5:
 -- Создаём таблицу пользователей
-- здесь небольшие изменения 
-- 1. для phone меньше символов, 120 по моему многовато
-- 2. email вынесен в отдельную таблицу, email ов может быть много
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(16) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);
DROP TABLE IF EXISTS user_emails;
CREATE TABLE user_emails (
  user_id INT UNSIGNED NOT NULL,  
  email VARCHAR(128) NOT NULL UNIQUE,
  email_type ENUM ('main' ,'reserved') NOT NULL DEFAULT 'main',
  PRIMARY KEY(user_id, email)
);

-- Таблица профилей
-- здесь тип поля sex заменён на ENUM 
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  sex ENUM('male', 'female') NOT NULL,
  birthday DATE,
  hometown VARCHAR(100),
  photo_id INT UNSIGNED NOT NULL
);

-- Таблица дружбы
-- заменил тип поля status на ENUM, чтоб не создавать отдельную таблицу для статусов
-- количество статусов конечное и небольшоу
DROP TABLE IF EXISTS friendship;
CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL,
  friend_id INT UNSIGNED NOT NULL,
  status ENUM ('requested', 'confirmed', 'interrupted') NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (user_id, friend_id)
);

-- Таблица медиафайлов
-- мне кажется поле size не нужно, его можно получить из файловой системы
DROP TABLE IF EXISTS media;
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_type_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Предложение 6:
-- Попробовала создать таблицу с закладками
-- Пока еще не совсем разобралась, поэтому не уверена, что это нужно было делать так

CREATE TABLE favorites (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  favorites_types_id INT UNSIGNED NOT NULL
);

CREATE TABLE favorites_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED NOT NULL,
  media_type_id INT UNSIGNED NOT NULL
);

-- Предложение 7:
sex CHAR(1) NOT NULL,   
/*Предложение 1: пол лучше связать сразу с именем, тем более что это практически всегда
 заполняемое поле */

-- Предложение 8:
-- Разделение таблицы profiles на две таблицы: profile_type и profile_data.
-- Преимущества:
-- 1.Параметры профиля могут расширяться и чтобы не обновлять структуру таблиц сам
-- перечень атрибутов профиля можно хранить в отдельной таблице, 
-- и тогда добавление еще одного атрибута это добавление просто записи в таблицу
-- profile_type
-- 2. Так как часто не все атрибуты заполняют, а при этом таблица резервируется под все
-- значения колонок, то в случае разделенной таблицы будут занимать место только те
-- атрибуты которые внесли
-- Недостатки:
-- 1. В простом варианте разделения таблиц не можем принудительно указать разные типы
-- данных для разных атрибутов. 
-- В данном случае можем использовать общее текстовое поле, которое уже можно при
-- программировании приводить к опредленному типу.
-- 2. Чуть сложнее будут запросы при вытягивании данных по атрибутам.

-- Таблица атрибутов профилей
CREATE TABLE profile_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);
INSERT INTO profile_type (`id`, `name`) VALUES (1, 'hometown');
INSERT INTO profile_type (`id`, `name`) VALUES (2, 'highschool');
INSERT INTO profile_type (`id`, `name`) VALUES (3, 'hobby');
INSERT INTO profile_type (`id`, `name`) VALUES (4, 'photo_id');

-- Таблица значений атрибутов профилей
CREATE TABLE profile_data (
  user_id INT UNSIGNED NOT NULL,
  profile_type_id INT UNSIGNED NOT NULL,
  content VARCHAR(150) NOT NULL,
  PRIMARY KEY (user_id, profile_type_id)
);

-- Предложение 8:
-- добавила колонку обновления данных в профиле, по которой можно будет формировать
-- новости в дальнейшем
-- изменила photo_id на photo_path, т.к. кажется, можно хранить уникальные ссылки на
-- аватары сразу в данной таблице 
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  sex CHAR(1) NOT NULL,
  birthday DATE,
  hometown VARCHAR(100),
  photo_path VARCHAR(255) NOT NULL,
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);

-- Предложение 9:
-- добавила колонку статуса прочтения сообщения
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  from_user_id INT UNSIGNED NOT NULL,
  to_user_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  is_important BOOLEAN,
  is_delivered BOOLEAN,
  is_read BOOLEAN,
  created_at DATETIME DEFAULT NOW()
);

-- Предложение 10:
-- создала три статуса (requested, confirmed, rejected)
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);

-- Реализация
SELECT * FROM friendship_statuses;
INSERT INTO friendship_statuses (name) VALUE ('Rejected');

-- Предложение 11:
-- создала три типа данных (аудио, видео, фото)
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

-- Предложение 12:
CREATE TABLE meet_communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE,
  meet_point DATETIME, 
);

-- Реализация
CREATE TABLE meetings (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE,
  scheduled_at DATETIME 
);

-- Предложение 13:
-- я бы добавил: hold document (хранение документов. id, is_uploaded boolean, 
-- is_downloaded boolean); 
-- payments (платежи, id, type_currency, exchange_currency, is_sended boolean, is_get boolean), 
-- catalogues_good (каталог товаров, id, type_currency, select, payments
-- (можно обратиться к таблице выше))


-- Замена первичного ключа
CREATE INDEX id_pk_unique ON smsusers (id)
ALTER TABLE parent DROP PRIMARY KEY;
ALTER TABLE parent ADD PRIMARY KEY (userid);



-- Использование справки в терминальном клиенте
HELP SELECT;

-- Документация
-- https://dev.mysql.com/doc/refman/8.0/en/
-- http://www.rldp.ru/mysql/mysql80/index.htm

