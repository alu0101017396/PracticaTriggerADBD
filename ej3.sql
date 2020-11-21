DELIMITER //
CREATE TRIGGER trigger_actualizar_stock AFTER INSERT ON Pedido FOR EACH ROW
BEGIN
    UPDATE Productos, Pedido SET Productos.Stock = Productos.Stock - NEW.Cantidad
    WHERE Productos.CodigoBarras = NEW.CodBarras;
END //
DELIMITER ;