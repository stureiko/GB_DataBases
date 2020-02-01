USE shop;

DROP FUNCTION IF EXISTS hello;

DELIMITER //

CREATE FUNCTION hello(Yer VARCHAR(4))
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	SET @N := DATE_FORMAT(NOW(), '%Y');
	SET @Age := @N - Yer;
	CASE
		WHEN @Age <= 30 THEN RETURN "Too young";
		WHEN @Age > 30 THEN RETURN "Normal";
	END CASE;
END//

DELIMITER ;


SELECT name, hello(DATE_FORMAT(u2.birthday_at, '%Y')) as Hello FROM users u2;
