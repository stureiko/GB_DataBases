USE GeekBrainsDB;

SHOW TABLES;

SELECT * FROM tbl;

SELECT * FROM tbl WHERE value BETWEEN 11 AND 30;

SELECT * FROM tbl WHERE value IN (0, 10, 11, 92);

SELECT * FROM tbl WHERE first_name LIKE 'E%';

SELECT COUNT(*) FROM users;

DESCRIBE users;

SELECT * FROM users;

SELECT * FROM users WHERE birthday > '1990-01-01';

SELECT * FROM users WHERE birthday > '2000-01-01' AND birthday < '2010-01-01';

SELECT * FROM users WHERE birthday LIKE '198%';

SELECT 'й' RLIKE '[а-я]';

SELECT 12.45 RLIKE '[[:digit:]]' AS results; -- класс чисел

SELECT 'string' RLIKE '[[:alpha:]]'; -- класс строк

SELECT 'string туче' RLIKE '[[:alpha:]]';

SELECT 123.33 RLIKE '^[0-9]*\\.[0-9]{2}$';  -- регулярка для формата цены

SELECT * FROM users;

SELECT * FROM users ORDER BY name;

SELECT * FROM users WHERE birthday LIKE '198%' ORDER BY name;

SELECT 
	name, 
	FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) as Age
FROM 
	users
WHERE 
	birthday
LIKE
	'198%'
ORDER BY
	Age;





