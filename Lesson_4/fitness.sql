-- Создаём БД
CREATE DATABASE IF NOT EXISTS fitness;

-- Делаем её текущей
USE fitness;

-- Создаём таблицу пользователей
-- DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(120) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  type_id INT NOT NULL
);

-- типы пользователей
CREATE TABLE IF NOT EXISTS user_type (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	decription VARCHAR(255) NOT NULL
);

-- Таблица профилей
-- DROP TABLE IF EXISTS profiles;
CREATE TABLE IF NOT EXISTS profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  sex BOOL NOT NULL, -- 1 male, 0 - female
  birthday DATE,
  region_id INT UNSIGNED NOT NULL, -- районы где удобно заниматься, внешний ключ
  photo_id INT UNSIGNED NOT NULL, -- ключь из таблицы media.id
  fit_level INT UNSIGNED NOT NULL -- уровень подготовки
);

-- Таблица медиафайлов
-- DROP TABLE IF EXISTS media;
CREATE TABLE IF NOT EXISTS media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_type_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  size INT NOT NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица типов медиафайлов
-- DROP TABLE IF EXISTS media_types;
CREATE TABLE IF NOT EXISTS media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  training_id INT UNSIGNED NOT NULL -- связь с курсом
);

-- Таблица типов курсов
-- DROP TABLE IF EXISTS type_courses;
CREATE TABLE IF NOT EXISTS type_courses (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT 
);

-- Таблица курсов
-- DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	course_type_id INT UNSIGNED NOT NULL
);

-- Таблица упраженений
-- DROP TABLE IF EXISTS exercises;
CREATE TABLE IF NOT EXISTS exercises (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	courses_trainings_id INT UNSIGNED NOT NULL,
	media_id INT UNSIGNED NOT NULL
);

-- Таблица тренировок (для составления курсов)
-- DROP TABLE IF EXISTS courses_trainings;
CREATE TABLE IF NOT EXISTS courses_trainings (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	course_id INT UNSIGNED NOT NULL
);

-- таблица городов
CREATE TABLE IF NOT EXISTS cities (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

-- таблица районов
CREATE TABLE IF NOT EXISTS regions (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	city_id INT UNSIGNED NOT NULL
);

-- таблица тренировок 
CREATE TABLE IF NOT EXISTS trainings (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	exp_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	status_id INT NOT NULL,
	comm VARCHAR(255),
	training_id INT UNSIGNED NOT NULL
);

-- таблица статусов тренировки
CREATE TABLE IF NOT EXISTS train_status(
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	status_name VARCHAR(255) NOT NULL
);

-- связь пользователей и купленных курсов
CREATE TABLE IF NOT EXISTS programs(
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	course_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL
);