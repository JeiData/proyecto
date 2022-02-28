CREATE VIEW Vista_integrantes
AS SELECT * FROM integrantes;

CREATE OR REPLACE VIEW Vista_integrantes_femeninos
AS SELECT Proyecto_Id, Cantidad_Miembros_F 
FROM integrantes
ORDER BY Cantidad_Miembros_F DESC ;

CREATE VIEW vista_financiamiento
AS SELECT
	   financiamiento.proyecto_id,
     financiamiento.Moneda_id,
     financiamiento.Monto_Adjudicado,
     ref_moneda.Moneda_id
FROM
    financiamiento
    ref_moneda
WHERE
    financiamiento.moneda_id = ref_moneda.moneda_id;
