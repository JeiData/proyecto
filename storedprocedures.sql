
-- El primer S.P. debe permitir indicar a través de un parámetro el campo de ordenamiento de una tabla y 
-- mediante un segundo parámetro, si el orden es descendente o ascendente:


DELIMITER %%
CREATE PROCEDURE `sp_int_fem`()
BEGIN
	SELECT Proyecto_Id, Cantidad_Miembros_F, Cantidad_miembros_M, Sexo_director FROM integrantes
	ORDER BY Cantidad_Miembros_F DESC ;
END 
DELIMITER %%

-- PARA APLICARLO SE INVOCA:

CALL sp_int_fem;


-- El otro S.P.  puede (1: insertar registros en una tabla de tu proyecto. 2: eliminar algún registro específico de una tabla 
-- de tu proyecto.)

-- Primero cree un SP para obtener el ultimo id de los registros 'gran_area':

DELIMITER %%
CREATE PROCEDURE `sp_ultima_gran_area` ()
BEGIN
	SELECT MAX(Gran_area_codigo) FROM proyectos_ciencia.ref_gran_area_descripcion;
END
DELIMITER %%

-- Luego cree el SP para la insercion de registros nuevos:

DELIMITER %%

CREATE PROCEDURE sp_crea_gran_area (IN Gran_area_codigo INT, IN Gran_area_descripcion VARCHAR (40))
BEGIN
	DECLARE Nueva_gran_area
	CALL sp_ultima_gran_area (@Nueva_gran_area)
	SET @Nueva_gran_area= @Nueva_gran_area+1;

	INSERT INTO ref_gran_area_descripcion VALUES ( Nueva_gran_area, Gran_area_codigo, Gran_area_descripcion,1, CURRENT_DATE (), current_date ());

END

DELIMITER %%
