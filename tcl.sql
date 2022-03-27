-- CONSIGNA N° 1: 
-- En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. 
-- Si no tiene registros la tabla, reemplaza eliminación por inserción.
-- Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
-- Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.

-- 1.1. TABLA ref_gran_area_descripcion
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

-- 1.2. TABLA ref_disciplina

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
-- Tabla usada: proyectos_2019

START TRANSACTION;
INSERT INTO proyectos_2019 VALUES (24654, 'CONICET', 'Ciencia de Datos: un enfoque social', 'Los datos estan presentes en nuestra vida cotidiana','22920180100066CO', 'Datos. Ciencia. Sociedad');
INSERT INTO proyectos_2019 VALUES (24655, 'ANPCYT', 'Inteligencia artificial para el analisis automatizado de imagenes medicas', 'no publicado','23920180100066CO', 'Salud. Inteligencia artificial');
INSERT INTO proyectos_2019 VALUES (24656, 'ANPCYT', 'Migraciones y Transformaciones Sociales en Aglomeraciones Medianas y Pequeñas de la Argentina en Perspectiva Comparada', ' Heterogeneizacion y Fragmentacion Social y Urbana. ','22920180120066CO', 'Migracion. Cultura');
INSERT INTO proyectos_2019 VALUES (24657, 'CONICET', 'Desarrollo de tecnologias sustentables aplicando los principios de la quimica verde.', 'No especificado','22920180100067CO', 'Quimica. Sustentabilidad. Ambiente');
SAVEPOINT nuevo_proyecto_24654_24657;
INSERT INTO proyectos_2019 VALUES (24658, 'CONICET', 'Nanocompuestos de Polipropilenos Ramificados para uso en Tecnologias de Espumado', 'Los datos estan presentes en nuestra vida cotidiana','22920180100066CO', 'Datos. Ciencia. Sociedad');
INSERT INTO proyectos_2019 VALUES (24659, 'CONICET', 'El aprendizaje espaciado y los mecanismos que optimizan la formacion y la persistencia de memorias.', 'Recuerdos y entrenamiento neuronal.','22920180100166CO', 'Neurociencia. Psicologia. Memoria');
INSERT INTO proyectos_2019 VALUES (24660, 'CONICET', 'Utilización de recursos mineros argentinos para el desarrollo de materiales compuestos', 'Desarrollo De Materiales A Base De Polimeros Biodegradables De Origen Renovable','22920180100066CO', 'Ambiente. Polimeros. Quimica');
INSERT INTO proyectos_2019 VALUES (24661, 'CONICET', 'Astrofisica de sistemas estelares galacticos y extragalacticos', 'Estructura Y Evolucion Quimica De La Vi­a Lactea Y Del Sistema Magallanico, A Partir De Datos Observacionales','22920180100066CO', 'Astronomia. Cumulos. Galaxias');
SAVEPOINT nuevo_proyecto_24658_24661;

-- Se verifican los cambios:

SELECT * FROM proyectos_2019; 

-- Por un lado se incorporaron masivamente registros EN FORMA TEMPORAL. 
-- Por el otro, en ACTION OUTPUT están los marcadores "nuevo_proyecto_24654_24657" y "nuevo_proyecto_24658_24661":  

-- Para eliminar el savepoint de los primeros cuatro registros insertados, usaré:

RELEASE SAVEPOINT nuevo_proyecto_24654_24657; 

