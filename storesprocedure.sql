CREATE PROCEDURE `insercion_datos`
@disciplina_id INT,
@gran_area_codigo INT,
@area_descripcion VARCHAR (100),
@disciplina_descripcion VARCHAR (200)
AS
BEGIN
	INSERT INTO ref_disciplina (Disciplina_Id, Gran_area_codigo, Area_descripcion, Disciplina_descripcion)
    VALUES (@disciplina_id, @area_codigo, @area_descripcion, @disciplina_descripcion);
END
