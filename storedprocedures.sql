
-- 1: (consigna) S.P. debe permitir indicar a través de un parámetro el campo de ordenamiento de una tabla y mediante un segundo parámetro, si el orden es descendente o ascendente.

-- Pensé un Stored Procedure para optimizar las consultas en la tabla "Financiamiento". Trabajando con la columna Monto_adjudicado se obtendría un ordenamiento ASC o DESC de
-- de los diferentes montos.

DELIMITER //

CREATE PROCEDURE `sp_ordenar_financiamiento`(IN ASC_DESC VARCHAR (10))
BEGIN
	IF ASC_DESC='ASC' THEN
		SELECT Proyecto_id, Monto_Adjudicado FROM proyectos_ciencia.financiamiento
		ORDER BY Monto_Adjudicado ASC;
   	ELSEIF ASC_DESC='DESC' THEN
		SELECT Proyecto_Id, Monto_adjudicado FROM proyectos_ciencia.financiamiento
		ORDER BY Monto_Adjudicado DESC;
END IF;
END
DELIMITER //

-- para invocarla:

CALL proyectos_ciencia.sp_ordenar_financiamiento('ASC');


-- 2: (consigna) S.P. que puede "insertar" registros en una tabla de tu proyecto o "eliminar" algún registro específico de una tabla de tu proyecto.

-- Para insertar registros, pueden ser dos opciones de SP:

-- 2.1:
-- Primero, creo un sp que devuelva el ultimo id de proyecto como parámetro de salida

DELIMITER //
CREATE PROCEDURE sp_ultimo_proyecto_2019 (OUT proyecto INT)
BEGIN 
	SELECT MAX(Proyecto_Id) into proyecto
    FROM proyectos_2019;
END

DELIMITER //


-- Ahora si, preparo el SP para poder insertar nuevos registros. El punto positivo es que se generará un ID adecuado, teniendo en cuenta 
-- el último registrado en la tabla, ya que lo ligaré con el SP anterior. Muy útil teniendo en cuenta que Proyecto_ID no es AUTOINCREMENT.

DELIMITER //
CREATE PROCEDURE `sp_insertar_nuevo_proyecto` (IN Proyecto_Id INT, IN Proyecto_fuente VARCHAR (15), IN Titulo VARCHAR (250), IN Resumen VARCHAR (2800), IN Codigo_identificacion VARCHAR (20), IN Palabras_clave VARCHAR (150))
BEGIN
		DECLARE NUEVO_PROYECTO INT;
        CALL sp_ultimo_proyecto(@ULTIMO_PROYECTO);
        SET NUEVO_PROYECTO= @ULTIMO_PROYECTO+1;
	
INSERT INTO proyectos_2019 VALUES (NUEVO_PROYECTO, Proyecto_fuente, Titulo, Resumen, Codigo_identificacion, Palabras_clave)
    
END

DELIMITER //

CALL sp_insertar_nuevo_proyecto(1,CONICET, Titulo, Resumen, Codigo_identificacion, Palabras_clave)

-- 2.2: 
-- Esta sería una opción un poco mas sencilla que la anterior pero que permitiría facilitar el ingreso de nuevos registros en la tabla "Ref_disciplina".

DELIMITER //
CREATE PROCEDURE `insercion_datos`( in disciplina_id INT, in gran_area_codigo INT, in area_descripcion VARCHAR (100), in disciplina_descripcion VARCHAR (200))
BEGIN
	INSERT INTO ref_disciplina (Disciplina_Id, Gran_area_codigo, Area_descripcion, Disciplina_descripcion)
	VALUES (@disciplina_id, @area_codigo, @area_descripcion, @disciplina_descripcion);
END
DELIMITER //


