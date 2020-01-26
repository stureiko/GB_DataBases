-- Разбор ДЗ к уроку 7

USE shop;

-- Задание 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT 
	u2.id, u2.name
FROM users u2
JOIN
orders o2
ON u2.id = o2.user_id;

-- Задание 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT
  p.id,
  p.name,
  c.name AS catalog
FROM
  products AS p
LEFT JOIN
  catalogs AS c
ON
  p.catalog_id = c.id;

