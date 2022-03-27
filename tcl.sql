-- CONSIGNA N° 1: 
-- En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. 
-- Si no tiene registros la tabla, reemplaza eliminación por inserción.
-- Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
-- Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.

-- 1.1. TABLA REFERENCIA GRAN AREA DESCRIPCION
-- Por defecto, la variable autocommit hace que cada operación impacte automáticamente sobre la tabla.

USE proyectos_ciencia;

SELECT @@AUTOCOMMIT;

-- Para que esto no sea así, hay que desactivar esta variable.  

SET AUTOCOMMIT=0;

-- Luego:

START TRANSACTION;

INSERT INTO ref_gran_area_descripcion
VALUES
    (8, 'etimologia y lenguas'),
    (9, 'biotecnologia'),
    (10,'artes digitales'),
    (11, 'historia de la musica'),
    (12, 'etologia'),
    (13, 'biologia celular'),
    (14, 'psicología'),
    (15, 'ciencia de datos');

-- Verfico la inserción de registros:

SELECT *FROM ref_gran_area_descripcion;

-- Pero están disponibles temporalmente: si se cierra la sesión o ingresa desde otro user, los cambios no son visibles.
-- Así para desechar los cambios, se usa ROLLBACK. Importante: Rollback, solo funciona sin haber ejecutado antes el comando COMMIT :

ROLLBACK;

-- Por el contrario y en caso de querer confirmar el cambio de manera definitiva se usa:

COMMIT;

-- 1.2. TABLA REFERENCIA DISCIPLINA
-- En este caso eliminaré registros de la tabla.

SELECT @@AUTOCOMMIT;

SET AUTOCOMMIT=0;

START TRANSACTION;
INSERT INTO ref_disciplina
VALUES
	(289, 5, 'derecho','internacional publico'),
	(290, 5, 'derecho','datos personales'),
    (291, 5, 'sociologia','internacional publico'),
    (292, 3, 'fisica cuantica','espacio y tiempo'),
    (293, 2, 'astronomia','macroestructuras'),
    (294, 4, 'ciencias naturales y exactas','seleccion natural'),
    (295, 6, 'historia','arqueologia'),
    (296, 5, 'filosofia','posmodernidad');
    
SELECT * FROM ref_disciplina;

-- Para desechar los cambios, uso ROLLBACK. 

ROLLBACK;

-- A la inversa, y en caso de querer confirmar los cambios de manera definitiva:

COMMIT;


-- CONSIGNA N°2: 

-- Tabla REFERENCIA DISCIPLINA

START TRANSACTION;
INSERT INTO ref_disciplina VALUES (289, 6, 'arte', 'arte prehistorico');
INSERT INTO ref_disciplina VALUES (290, 2, 'psicologia', 'redes sociales');
INSERT INTO ref_disciplina VALUES (291, 3, 'tecnologia', 'robotica');
INSERT INTO ref_disciplina VALUES (292, 1, 'ciencias sociales', 'redes sociales');
SAVEPOINT NUEVA_DISCIPLINA_1_4;
INSERT INTO ref_disciplina VALUES (293, 4, 'arte', 'arte contemporaneo');
INSERT INTO ref_disciplina VALUES (294, 3, 'musica', 'historia de la musica siglo XV');
INSERT INTO ref_disciplina VALUES (295, 1, 'agronomia', 'comunidades y ambiente');
INSERT INTO ref_disciplina VALUES (296, 4, 'agronomia', 'pesticidas');
SAVEPOINT NUEVA_DISCIPLINA_5_8;

-- Se verifican los cambios:

SELECT * FROM ref_disciplina; 

-- Por un lado se incorporaron masivamente registros. 
-- Por el otro, en ACTION OUTPUT están los marcadores:  "NUEVA_DISCIPLINA_1_4" y "NUEVA_DISCIPLINA_5_8"

-- Para eliminar los últimos cuatro registros insertados, usaré:

ROLLBACK TO NUEVA_DISCIPLINA_1_4; 

-- de esta manera se borrarán los archivos correspondientes a la Disciplina_Id numeros 293, 294, 295 y 296 sin afectar los archivos anteriores.
