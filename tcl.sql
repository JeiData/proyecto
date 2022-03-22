
-- CONSIGNA N° 1: 

-- 1.1. TABLA REFERENCIA GRAN AREA DESCRIPCION
-- La variable llamada autocommit que ajusta su valor a 1, haciendo que cada operación impacte automáticamente sobre la tabla.

USE proyectos_ciencia;

SELECT @@AUTOCOMMIT;

-- Entonces, hay que desactivar esta variable.  

SET AUTOCOMMIT=0;

-- Luego:

START TRANSACTION;

INSERT INTO ref_gran_area_descripcion
VALUES
    (8, 'etimologia y lenguas');

-- Se verfica la inserción de los registros:

SELECT *FROM ref_gran_area_descripcion;

-- Por estar disponibles temporalmente, si se cierra la sesión o ingresa desde otro user, los cambios no son visibles.
-- Así para desechar los cambios, se usa ROLLBACK. Es importante no haber ejecutado el comando COMMIT antes de usar ROLLBACK:

ROLLBACK;

-- Por el contrario y en caso de querer confirmar el cambio de manera definitiva aplicamos:

COMMIT;


-- 1.2. TABLA REFERENCIA DISCIPLINA
-- En este caso eliminaré un registro de la tabla.

START TRANSACTION;
DELETE FROM
 ref_disciplina
WHERE 
    Disciplina_Id= 288;

-- Se verifica la eliminación del registro:

SELECT * FROM ref_disciplina WHERE Disciplina_Id= 288;

-- Para desechar estos cambios que son temporales, aplico:

ROLLBACK;

-- Aplicando el SELECT anterior verificamos que el registro está nuevamente disponible.
-- A la inversa, y en caso de querer confirmar el cambio de manera definitiva usamos:

COMMIT;

