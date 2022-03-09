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

SELECT Proyecto_Id AS PROYECTO, porcentaje_miembros_mujeres (Cantidad_Miembros_F,Cantidad_miembros_M) AS PORCENTAJE_MUJERES
FROM integrantes ;


-----------------

-- SEGUNDA FUNCION

CREATE FUNCTION `financiamiento`(Moneda_id int) 
RETURNS varchar(15)
READS SQL DATA
BEGIN
	DECLARE resultado varchar (15);
	SET resultado= (select Moneda from proyectos_ciencia.ref_moneda where proyectos_ciencia.ref_moneda.moneda_id=moneda_id);
RETURN resultado;
END

-- Esta funciòn sería útil al momento de explorar la tabla de financiamiento, para poder ver 
-- las monedas correspondientes a los montos adjudicados para cada proyecto, como en la siguiente query:

select Proyecto_Id, financiamiento (Moneda_Id),Monto_Adjudicado from financiamiento;
