use coworking

-- Aqui este trigger nos suma 30 dias a la fecha de inicio (fecha_inicio) de la membresia 
--  y a su vez calcula automaticamente el cambio en la fecha de vencimiento, esta misma se guarda en el mismo registro de la membresía.


DELIMITER $$
DROP TRIGGER IF EXISTS trg_extension_membresia$$
CREATE TRIGGER trg_extension_membresia
BEFORE INSERT ON membresia
FOR EACH ROW
BEGIN
    SET NEW.fecha_fin = DATE_ADD(NEW.fecha_inicio, INTERVAL 30 DAY);
END$$

DELIMITER ;

-- PRUEBA DEL TRIGGER HECHO


-- Aqui basicamente insertamos una nueva membresia con su fecha de inicio
-- deja la fecha_fin como NULL  porque el propio trigger lo calculara  auto

INSERT INTO membresia
(tipo, estado, fecha_inicio, fecha_fin, usuarioID, tipoID)
VALUES
('Mensual', 'Activa', '2026-10-08', NULL, 1, 2);

-- Se consulta la membresía recién insertada usando su ID.
-- con LAST_INSERT_ID() obtiene el ID generado para el último INSERT y permite verificar que fecha_fin fue calculada correctamente
-- por el trigger: 2026-10-08 + 30 días = 2026-11-07.

SELECT *
FROM membresia
WHERE membresiaID = LAST_INSERT_ID();


