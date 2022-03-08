
CREATE FUNCTION `porcentaje_miembros_mujeres`(param1 INT , param2 INT) RETURNS int(11)
NO SQL
BEGIN
	DECLARE resultado INT;
 	DECLARE total_miembros INT;
	SET total_miembros=(param1 + param2);
	SET resultado = (param1 /total_miembros *100);
	RETURN resultado;
END

-----------------

CREATE FUNCTION `FINANCIAMIENTO`(MONEDA_id INT) RETURNS varchar(30) READS SQL 
DATA 
BEGIN 
	DECLARE resultado VARCHAR (30);
	SET resultado = (SELECT Monto_Solicitado FROM proyectos_ciencia.financiamiento WHERE proyectos_ciencia.financiamiento.moneda_id = moneda_id);
	RETURN resultado;
END

