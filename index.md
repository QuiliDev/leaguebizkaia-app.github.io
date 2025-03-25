# Documentación Base de Datos
## Gestion de usuarios

Creación, borrado y modificación de usuarios,concesión y retirada de privilegios, roles, perfiles, sinónimos

### Código del Procedimiento:
```sql
-- Crear roles
CREATE ROLE IF NOT EXISTS 'director';
CREATE ROLE IF NOT EXISTS 'gestor';
CREATE ROLE IF NOT EXISTS 'arbitro';
CREATE ROLE IF NOT EXISTS 'usuario';

-- Crear usuarios y asignar roles
CREATE USER IF NOT EXISTS 'director'@'localhost' IDENTIFIED BY '1234';
GRANT 'director' TO 'director'@'localhost';

CREATE USER IF NOT EXISTS 'gestor'@'localhost' IDENTIFIED BY '1234';
GRANT 'gestor' TO 'gestor'@'localhost';

CREATE USER IF NOT EXISTS 'arbitro'@'localhost' IDENTIFIED BY '1234';
GRANT 'arbitro' TO 'arbitro'@'localhost';

CREATE USER IF NOT EXISTS 'usuario'@'localhost' IDENTIFIED BY '1234';
GRANT 'usuario' TO 'usuario'@'localhost';

-- Asignar permisos
GRANT ALL PRIVILEGES ON reto3.* TO 'director';

GRANT SELECT, INSERT, UPDATE, DELETE ON reto3.* TO 'gestor';

GRANT SELECT ON reto3.* TO 'arbitro';
GRANT INSERT, UPDATE ON reto3.jornadas TO 'arbitro';

GRANT SELECT ON reto3.jornadas TO 'usuario';

-- Aplicar cambios
FLUSH PRIVILEGES;

```

### Imagen demostrativa
![Texto alternativo](./imagenes/imagen24.jpg)



## Procedimientos


### Procedimientos con estructuras de control alternativa simple o doble

-- Procedimiento 1: Insertar un nuevo equipo en la base de datos.
-- Siempre que no exista ya un equipo con el mismo nombre.Si el equipo no existe, se insertan valores predeterminados para el número de victorias, derrotas, puntos totales y total de partidos.

### Código del Procedimiento:

```sql
DELIMITER //

CREATE PROCEDURE InsertarEquipo(IN nombre VARCHAR(255), IN entrenador VARCHAR(255), IN fundacion DATE)
BEGIN
    DECLARE equipoExiste INT;
    
    -- Verificar si el equipo ya existe
    SELECT COUNT(*) INTO equipoExiste FROM Equipos WHERE Equ_nombre = nombre;
    
    IF equipoExiste = 0 THEN
        -- Insertar el nuevo equipo
        INSERT INTO Equipos (Equ_nombre, Equ_entrenador, Equ_fundacion, Equ_victorias, Equ_derrotas, Equ_puntos_totales, Equ_total_partidos)
        VALUES (nombre, entrenador, fundacion, 0, 0, 0, 0);
        
        SELECT 'Equipo insertado correctamente' AS Mensaje;
    ELSE
        SELECT 'El equipo ya existe' AS Mensaje;
    END IF;
END //

DELIMITER ;
```
### Imagen demostrativa
![Texto alternativo](./imagenes/imagen1.jpg)

### Imagen demostrativa
![Texto alternativo](./imagenes/imagen2.jpg)


-- Procedimiento 2: Modificar las victorias de un equipo si existe

```sql
DELIMITER //
CREATE PROCEDURE ModificarVictorias(IN nombre VARCHAR(255), IN victorias INT)
BEGIN
    DECLARE equipoExiste INT;
    
    -- Verificar si el equipo existe
    SELECT COUNT(*) INTO equipoExiste FROM Equipos WHERE Equ_nombre = nombre;
    
    IF equipoExiste > 0 THEN
        -- Actualizar las victorias del equipo
        UPDATE Equipos SET Equ_victorias = victorias WHERE Equ_nombre = nombre;
        
        SELECT 'Victorias actualizadas correctamente' AS Mensaje;
    ELSE
        SELECT 'El equipo no existe' AS Mensaje;
    END IF;
END //

DELIMITER ;
```
### Imagen demostrativa
![Texto alternativo](./imagenes/imagen3.jpg)

### Imagen demostrativa
![Texto alternativo](./imagenes/imagen4.jpg)


### Creación de procedimientos con la estructura de control alternativa múltiple

-- Procedimiento 3: Actualizar estado de la temporada
-- Este procedimiento actualiza el estado de una temporada según su ID.

```sql
DELIMITER //
CREATE PROCEDURE ActualizarEstadoTemporada(IN temporadaID INT, IN nuevoEstado VARCHAR(20))
BEGIN
    DECLARE estadoActual BOOLEAN;
    
    -- Obtener el estado actual de la temporada
    SELECT Tem_iniciado INTO estadoActual FROM Temporadas WHERE Tem_id = temporadaID;
    
    CASE
        WHEN estadoActual IS NULL THEN
            SELECT 'La temporada no existe' AS Mensaje;
        WHEN nuevoEstado = 'iniciar' AND estadoActual = FALSE THEN
            UPDATE Temporadas SET Tem_iniciado = TRUE WHERE Tem_id = temporadaID;
            SELECT 'Temporada iniciada correctamente' AS Mensaje;
        WHEN nuevoEstado = 'finalizar' AND estadoActual = TRUE THEN
            UPDATE Temporadas SET Tem_finalizado = TRUE WHERE Tem_id = temporadaID;
            SELECT 'Temporada finalizada correctamente' AS Mensaje;
        ELSE
            SELECT 'No se puede realizar la acción solicitada' AS Mensaje;
    END CASE;
END //
DELIMITER ;
```








## Creacion de vistas





## Creacion de Triggers