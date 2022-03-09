-- PRIMERA FUNCION

CREATE FUNCTION `porcentaje_miembros_mujeres`(param1 INT , param2 INT) RETURNS int(11)
DETERMINATE
BEGIN
	DECLARE resultado INT;
 	DECLARE total_miembros INT;
	SET total_miembros=(param1 + param2);
	SET resultado = (param1 /total_miembros *100);
	RETURN resultado;
END


-- Estoy trabajando con Proyectos de Ciencia y Tecnología financiados por el Estado Nacional, la utilidad de esta función sería poder conocer la composición 
-- de mujeres en cada proyecto. Un modo de usarla sería:

USE proyectos_ciencia;

SELECT Proyecto_Id, porcentaje_miembros_mujeres (Cantidad_Miembros_F,Cantidad_miembros_M) 
FROM integrantes ;


-----------------

-- SEGUNDA FUNCION

CREATE FUNCTION `FINANCIAMIENTO`(MONEDA_id INT) RETURNS varchar(30) READS SQL 
DATA 
BEGIN 
	DECLARE resultado VARCHAR (30);
	SET resultado = (SELECT Monto_Solicitado FROM proyectos_ciencia.financiamiento WHERE proyectos_ciencia.financiamiento.moneda_id = moneda_id);
	RETURN resultado;
END

