CREATE DATABASE IF NOT EXISTS GeekBrainsDB;
USE GeekBrainsDB;
CREATE TABLE IF NOT EXISTS Users (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    surname VARCHAR(250));
CREATE UNIQUE INDEX UserID ON Users(id);
CREATE DATABASE IF NOT EXISTS newDB;
