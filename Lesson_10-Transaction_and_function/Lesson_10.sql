-- # ************************************************
-- #
-- # Author: Стурейко Игорь
-- # Project: Geekbrains.Databases
-- # Lesson 10 - транзакции, администрирование, хранимые процедуры
-- # Date: 2020-02-06
-- #
-- # 1. Проанализировать какие запросы могут выполняться наиболее часто в процессе
-- # работы приложения и добавить необходимые индексы
-- #
-- # 2. Построить запрос, который будет выводить следующие столбцы:
-- # - имя группы
-- # - среднее количество пользователей в группе
-- # - самый молодой пользователь группы
-- # - самый пожилой пользователь группы
-- # - всего пользователей в группе
-- # - отношение в процентах числа пользователей группы к общему числу пользователей системы
-- #
-- # ************************************************


-- # Задание 1. Проанализировать какие запросы могут выполняться наиболее часто в процессе
-- # работы приложения и добавить необходимые индексы
-- Запросы:
  -- поиск по емайлу
  -- поиск друзей-друзей
  -- поиск последних новостей

CREATE UNIQUE INDEX users_email_uq ON users(email);

-- поиск по friendship(friend_id) - внешний ключ - уже есть индекс

CREATE INDEX messages_created_at_idx ON messages(created_at);

CREATE INDEX media_updated_at_idx ON media(updated_at);

CREATE INDEX posts_updated_at_idx ON posts(updated_at);


-- # Задание 2. Построить запрос, который будет выводить следующие столбцы:
-- # - имя группы
-- # - среднее количество пользователей в группе
-- # - самый молодой пользователь группы
-- # - самый пожилой пользователь группы
-- # - всего пользователей в группе
-- # - отношение в процентах числа пользователей группы к общему числу пользователей системы

SELECT DISTINCT communities.name,
  AVG(communities_users.user_id) OVER (PARTITION BY communities_users.community_id) AS Ave_users_in_Group,
  MAX(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS Yangest,
  MIN(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS Oldest,
  COUNT(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS Num_users,
  COUNT(profiles.birthday) OVER (PARTITION BY communities_users.community_id) / COUNT(users.id) OVER() * 100 AS "%%"
  FROM communities
    JOIN communities_users
      ON communities.id = communities_users.community_id
    LEFT JOIN users
      ON communities_users.user_id = users.id
    JOIN profiles
      ON users.id = profiles.user_id;
