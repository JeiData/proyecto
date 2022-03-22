
-- CONSIGNA N° 1: 
-- En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. 
-- Si no tiene registros la tabla, reemplaza eliminación por inserción.
-- Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
-- Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.

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

-- Verficamos la inserción de los registros:

SELECT *FROM ref_gran_area_descripcion;

-- Por estar disponibles temporalmente, si se cierra la sesión o ingresa desde otro user, los cambios no son visibles.
-- Así para desechar los cambios, usamos ROLLBACK. Es importante tener en cuenta que antes de usar Rollback, solo funciona 
-- sin haber ejecutado antes el comando COMMIT :

ROLLBACK;

-- Por el contrario y en caso de querer confirmar el cambio de manera definitiva usamos:

COMMIT;


-- 1.2. TABLA REFERENCIA DISCIPLINA
-- En este caso eliminaré un registro de la tabal.

START TRANSACTION;
DELETE FROM
 ref_disciplina
WHERE 
    Disciplina_Id= 288;

-- Se verifica la eliminación del registro:

SELECT * FROM ref_disciplina WHERE Disciplina_Id= 288;

-- Pero, por ser un cambio temporal, si se cierra la sesión o ingresa desde otro user, los cambios no son visibles.
-- Así para desechar los cambios, usamos ROLLBACK. Es importante tener en cuenta que antes de usar Rollback, solo funciona 
-- sin haber ejecutado antes el comando COMMIT :

ROLLBACK;

-- Aplicando el SELECT anterior verificamos que el registro está nuevamente disponible.
-- A la inversa, y en caso de querer confirmar el cambio de manera definitiva usamos:

COMMIT;

