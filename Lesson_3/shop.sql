CREATE DATABASE IF NOT EXISTS shop;
USE shop;

CREATE TABLE IF NOT EXISTS catalogs (
	id INT UNSIGNED,
	name VARCHAR(255)
);