DROP TRIGGER IF EXISTS check_products_before;
DELIMITER //
CREATE TRIGGER check_products_before BEFORE INSERT ON products
FOR EACH ROW
    BEGIN
        IF (ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT cancelled';
        END IF;
    END//
DELIMITER ;
