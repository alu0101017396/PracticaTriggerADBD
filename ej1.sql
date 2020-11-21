DELIMITER //

CREATE PROCEDURE crear_email(IN nombre VARCHAR(45), IN dominio VARCHAR(45), OUT email VARCHAR(45))
BEGIN

   SET email = CONCAT(nombre, '@', dominio);

END //

CREATE TRIGGER trigger_crear_email_before_insert BEFORE INSERT ON Cliente FOR EACH ROW
BEGIN
    IF NEW.email IS NULL THEN
        CALL crear_email(NEW.NOMBRE, 'tiendaviveros.es', @emailAux);
        set NEW.email = @emailAux;
    END IF;
END //

DELIMITER ;