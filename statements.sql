/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios2 (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
)

-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
)

-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios2 ADD COLUMN id_rol INT;

UPDATE usuarios2
SET id_rol = CASE id_usuario
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 4
    WHEN 5 THEN 1
    WHEN 6 THEN 2
    WHEN 7 THEN 3
    WHEN 8 THEN 4
    WHEN 9 THEN 1
    WHEN 10 THEN 2
    WHEN 11 THEN 3
    WHEN 12 THEN 4
    WHEN 13 THEN 1
    WHEN 14 THEN 2
    WHEN 15 THEN 3
    WHEN 16 THEN 4
    WHEN 17 THEN 1
    WHEN 18 THEN 2
    WHEN 19 THEN 3
    WHEN 20 THEN 4
END
WHERE id_usuario IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

-- PASO 4
-- Tu código aquí
SELECT usuarios2.id_usuario, usuarios2.nombre, usuarios2.apellido, usuarios2.email, usuarios2.edad, roles.nombre_rol
    FROM usuarios2
    JOIN roles ON usuarios2.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias(
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
)

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios2 ADD COLUMN id_categoria INT

-- PASO 3
-- Tu código aquí
UPDATE usuarios2
SET id_categoria = CASE id_usuario
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 4
    WHEN 5 THEN 5
    WHEN 6 THEN 6
    WHEN 7 THEN 7
    WHEN 8 THEN 8
    WHEN 9 THEN 9
    WHEN 10 THEN 10
    WHEN 11 THEN 1
    WHEN 12 THEN 2
    WHEN 13 THEN 3
    WHEN 14 THEN 4
    WHEN 15 THEN 5
    WHEN 16 THEN 6
    WHEN 17 THEN 7
    WHEN 18 THEN 8
    WHEN 19 THEN 9
    WHEN 20 THEN 10
END
WHERE id_usuario IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

-- PASO 4
-- Tu código aquí
SELECT usr.id_usuario, usr.nombre, usr.apellido, usr.email, usr.edad, roles.nombre_rol, cat.nombre_categoria
	FROM usuarios2 AS usr
	JOIN (roles, categorias AS cat) ON usr.id_rol = roles.id_rol AND usr.id_categoria = cat.id_categoria;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias(
	id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios2(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
)
-- PASO 2
-- Tu código aquí
    INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
    (1, 1), (1, 2), (1, 3),
    (2, 4), (2, 5),
    (3, 6), (3, 7),
    (4, 8), (4, 9), (4, 10)

-- PASO 3
-- Tu código aquí
SELECT usr.id_usuario, usr.nombre, usr.apellido, usr.email, usr.edad, roles.nombre_rol, cat.nombre_categoria
	FROM usuarios_categorias AS userCat
	JOIN (roles, categorias AS cat, usuarios2 AS usr) 
        ON userCat.id_usuario = usr.id_usuario 
        AND userCat.id_categoria = cat.id_categoria 
        AND usr.id_rol = roles.id_rol;