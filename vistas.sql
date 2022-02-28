CREATE VIEW Vista_integrantes
AS SELECT * FROM integrantes;

CREATE OR REPLACE VIEW Vista_integrantes_femeninos
AS SELECT Proyecto_Id, Cantidad_Miembros_F 
FROM integrantes
ORDER BY Cantidad_Miembros_F DESC ;

CREATE VIEW Vista_Financiamiento
AS SELECT  Monto_Adjudicado, Proyecto_Id 
FROM financiamiento
INNER JOIN ref_disciplina ON Proyecto_Id=Proyecto_Id
ORDER BY Monto_Adjudicado DESC;
