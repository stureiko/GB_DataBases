CREATE DATABASE GeekBrainsDB;
USE GeekBrainsDB;
CREATE TABLE Users (
    id integer NOT NULL PRIMARY KEY,
    name char(50) NOT NULL,
    surname char(50));
CREATE UNIQUE INDEX UserID ON Users(id);
CREATE DATABASE newDB;
