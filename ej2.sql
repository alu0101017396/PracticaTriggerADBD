DELIMITER //

CREATE TRIGGER trigger_insert_persona_vive_en_una_unica_vivienda BEFORE INSERT ON Persona FOR EACH ROW
BEGIN
    IF NEW.CalleBloq IS NOT NULL and NEW.CalleViv IS NOT NULL  THEN
        signal sqlstate '45000' set message_text = 'Una misma persona no puede tener dos domicilios';
    END IF;

END //

CREATE TRIGGER trigger_update_persona_vive_en_una_unica_vivienda BEFORE UPDATE ON Persona FOR EACH ROW
BEGIN
    IF NEW.CalleBloq IS NOT NULL and NEW.CalleViv IS NOT NULL  THEN
        signal sqlstate '45000' set message_text = 'Una misma persona no puede tener dos domicilios';
    END IF;


END //
DELIMITER ;