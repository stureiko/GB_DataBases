DROP TRIGGER IF EXISTS check_catalog_id_before;
DELIMITER //
CREATE TRIGGER check_catalog_id_before BEFORE INSERT ON products
FOR EACH ROW
    BEGIN
        DECLARE cat_id INT;
        SELECT id INTO cat_id FROM catalogs ORDER BY id LIMIT 1;
        SET NEW.catalog_id = COALESCE(NEW.catalog_id, cat_id);
    END//
