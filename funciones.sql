SELECT
AVG (Monto_Adjudicado)
FROM financiamiento;

CREATE FUNCTION `porcentaje_miembros_mujeres`(param1 INT , param2 INT) RETURNS int(11)
NO SQL
BEGIN
	DECLARE resultado INT;
 	DECLARE total_miembros INT;
	SET total_miembros=(param1 + param2);
	SET resultado = (param1 /total_miembros *100);
	RETURN resultado;
END

