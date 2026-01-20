-- Vista 1:
CREATE OR REPLACE VIEW vw_usuarios_rutinas AS
SELECT
    u.UserID,
    u.Nombre AS Nombre_Usuario,
    r.RutinaID,
    r.Nombre AS Nombre_Rutina,
    ur.Fecha_de_Inicio,
    ur.Fecha_de_Fin
FROM Usuarios u
JOIN Usuarios_Rutinas ur ON u.UserID = ur.UserID
JOIN Rutinas_de_Ejercicios r ON ur.RutinaID = r.RutinaID;

-- Vista 2
CREATE OR REPLACE VIEW vw_rutinas_videos AS
SELECT
    r.RutinaID,
    r.Nombre AS Nombre_Rutina,
    v.VideoID,
    v.Nombre AS Nombre_Video,
    v.URL,
    rv.Orden
FROM Rutinas_de_Ejercicios r
JOIN Rutinas_Videos rv ON r.RutinaID = rv.RutinaID
JOIN Videos_de_Ejercicios v ON rv.VideoID = v.VideoID;

-- Vista 3
CREATE OR REPLACE VIEW vw_suscripciones_usuarios AS
SELECT
    u.UserID,
    u.Nombre AS Nombre_Usuario,
    s.SuscripcionID,
    s.Tipo_de_Suscripcion,
    s.Fecha_de_Compra
FROM Usuarios u
JOIN Suscripciones_o_Compras s ON u.UserID = s.UserID;

DROP FUNCTION IF EXISTS fn_total_videos_rutina;

DELIMITER $$

CREATE FUNCTION fn_total_videos_rutina(p_rutina_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_videos INT;

    SELECT COUNT(*)
    INTO total_videos
    FROM Rutinas_Videos
    WHERE RutinaID = p_rutina_id;

    RETURN total_videos;
END$$

DELIMITER ;

DROP FUNCTION IF EXISTS fn_usuario_tiene_suscripcion;

DELIMITER $$

CREATE FUNCTION fn_usuario_tiene_suscripcion(p_user_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;

    SELECT COUNT(*)
    INTO cantidad
    FROM Suscripciones_o_Compras
    WHERE UserID = p_user_id;

    RETURN cantidad > 0;
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS sp_asignar_rutina_usuario;

DELIMITER $$

CREATE PROCEDURE sp_asignar_rutina_usuario(
    IN p_user_id INT,
    IN p_rutina_id INT,
    IN p_fecha_inicio DATE
)
BEGIN
    INSERT INTO Usuarios_Rutinas (UserID, RutinaID, Fecha_de_Inicio, Fecha_de_Fin)
    VALUES (p_user_id, p_rutina_id, p_fecha_inicio, NULL);
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS sp_registrar_suscripcion;

DELIMITER $$

CREATE PROCEDURE sp_registrar_suscripcion(
    IN p_user_id INT,
    IN p_tipo_suscripcion VARCHAR(50),
    IN p_fecha_compra DATE
)
BEGIN
    INSERT INTO Suscripciones_o_Compras (Fecha_de_Compra, Tipo_de_Suscripcion, UserID)
    VALUES (p_fecha_compra, p_tipo_suscripcion, p_user_id);
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS trg_validar_suscripcion_before_insert;

DELIMITER $$

CREATE TRIGGER trg_validar_suscripcion_before_insert
BEFORE INSERT ON Suscripciones_o_Compras
FOR EACH ROW
BEGIN
    IF NEW.UserID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la suscripción debe tener un usuario asociado';
    END IF;

    IF NEW.Tipo_de_Suscripcion IS NULL OR NEW.Tipo_de_Suscripcion = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el tipo de suscripción es obligatorio';
    END IF;

    IF NEW.Fecha_de_Compra IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la fecha de compra es obligatoria';
    END IF;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS trg_evitar_rutina_duplicada;

DELIMITER $$

CREATE TRIGGER trg_evitar_rutina_duplicada
BEFORE INSERT ON Usuarios_Rutinas
FOR EACH ROW
BEGIN
    DECLARE existe INT;

    SELECT COUNT(*)
    INTO existe
    FROM Usuarios_Rutinas
    WHERE UserID = NEW.UserID
      AND RutinaID = NEW.RutinaID;

    IF existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el usuario ya tiene asignada esa rutina';
    END IF;
END$$

DELIMITER ;
