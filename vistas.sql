CREATE VIEW Proyecto_disciplina
AS SELECT
	Proyecto_disciplina.proyecto_id,
	Proyecto_disciplina.disciplina_id,
	ref_disciplina.Disciplina_Id,
    ref_disciplina.Area_descripcion,
    ref_disciplina.Disciplina_descripcion
FROM
    Proyecto_disciplina, 
    ref_disciplina
WHERE
    Proyecto_disciplina.disciplina_id=ref_disciplina.Disciplina_Id;

------------

CREATE VIEW Vista_integrantes
AS SELECT * FROM integrantes;

---------------
CREATE OR REPLACE VIEW Vista_integrantes_femeninos
AS SELECT Proyecto_Id, Cantidad_Miembros_F 
FROM integrantes
ORDER BY Cantidad_Miembros_F DESC ;

----------------

CREATE VIEW vista_financiamiento
AS SELECT
	 financiamiento.Proyecto_Id,
     financiamiento.Monto_Adjudicado,
     ref_moneda.Moneda_Id,
     ref_moneda.Moneda
FROM
    financiamiento, 
    ref_moneda
WHERE
    financiamiento.moneda_id=ref_moneda.Moneda;

------------

CREATE OR REPLACE VIEW Prioridades_inversion
AS SELECT Proyecto_Id, Monto_Adjudicado
FROM financiamiento
ORDER BY Monto_Adjudicado DESC ;
