CREATE DATABASE proyectos_ciencia;

USE proyectos_ciencia;

CREATE TABLE Ref_gran_area_descripcion (
Gran_area_codigo INT NOT NULL,
Gran_area_descripcion VARCHAR (40) NOT NULL,
PRIMARY KEY (Gran_area_codigo)
);

CREATE TABLE Ref_disciplina (
Disciplina_Id INT NOT NULL,
Gran_area_codigo INT NOT NULL,
Area_descripcion VARCHAR (40) NOT NULL,
Disciplina_descripcion VARCHAR (40) NOT NULL,
PRIMARY KEY (Disciplina_Id),
FOREIGN KEY (Gran_area_codigo)
REFERENCES Ref_gran_area_descripcion (Gran_area_codigo)
);

CREATE TABLE Proyecto_disciplina (
Proyecto_Id INT NOT NULL,
Disciplina_Id INT NOT NULL,
PRIMARY KEY (Proyecto_Id),
FOREIGN KEY (Disciplina_Id)
REFERENCES Ref_disciplina (Disciplina_Id)
);

CREATE TABLE Ref_moneda (
Moneda_Id INT NOT NULL,
Moneda VARCHAR (10) NOT NULL,
Codigo VARCHAR (10) NOT NULL,
PRIMARY KEY (Moneda_id)
); 

CREATE TABLE Financiamiento (
Proyecto_Id INT NOT NULL,
Moneda_Id INT NOT NULL,
Monto_Solicitado INT NOT NULL,
Monto_Adjudicado INT NOT NULL,
PRIMARY KEY (Proyecto_Id),
FOREIGN KEY (Moneda_Id)
REFERENCES Ref_moneda (Moneda_Id)
);

CREATE TABLE Ref_Estado_Proyecto (
Estado_Id INT NOT NULL,
Descripcion VARCHAR (40) NOT NULL,
PRIMARY KEY (Estado_Id)
);

CREATE TABLE Estado (
Proyecto_Id INT NOT NULL,
Fecha_Inicio DATE NOT NULL,
Fecha_Finalizacion DATE NOT NULL,
Estado_Id INT NOT NULL,
PRIMARY KEY (Proyecto_Id),
FOREIGN KEY (Estado_Id)
REFERENCES Ref_Estado_Proyecto (Estado_Id)
);

CREATE TABLE Integrantes (
Proyecto_Id INT NOT NULL,
Cantidad_Miembros_F INT NOT NULL,
Cantidad_miembros_M INT NOT NULL,
Sexo_director VARCHAR (10) NOT NULL,
PRIMARY KEY (Proyecto_Id)
);

CREATE TABLE Proyectos_2019 (
Proyecto_Id INT NOT NULL,
Proyecto_fuente VARCHAR (15) NOT NULL,
Titulo VARCHAR (100) NOT NULL,
Resumen VARCHAR (200) NOT NULL,
Codigo_identificacion INT (15) NOT NULL,
Palabras_clave VARCHAR (100) NOT NULL,
PRIMARY KEY (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Financiamiento (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Integrantes (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Proyecto_disciplina (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Estado (Proyecto_Id)
);

INSERT INTO ref_estado_proyecto
VALUES
	(1, 'finalizado'),
	(2, 'en ejecución'),
	(3, 'interrumpido'),
	(4, 'no valido');
    
INSERT INTO ref_gran_area_descripcion
VALUES 
	(1, 'ciencias naturales y exactas'),
	(2, 'ingenierias y tecnologias'),
    (3, 'ciencias medicas y de la salud'),
    (4, 'ciencias agricolas'),
    (5, 'ciencias sociales'),
    (6, 'humanidades');
    
INSERT INTO ref_moneda
VALUES
	(1, 'pesos', 'ARS'),
    (2, 'dolares', 'USD'),
    (3, 'euros', 'EUR'),
    (4, 'libras', 'GBP');
    
INSERT INTO integrantes
VALUES
	(24573, 23, 15, 'M'),
    (24574, 13, 46, 'F'),
    (24575, 9, 6, 'F'),
    (24576, 17, 18, 'M'),
    (24577, 33, 21, 'F'),
    (24578, 15 , 6, 'F'),
    (24579, 33, 21, 'F'),
    (24580, 20 , 6, 'M'),
    (24581, 14, 11, 'F'),
    (24582, 2, 17, 'M'),
    (24583, 23,5, 'F'),
    (24584, 10, 7, 'F'),
    (24585, 22, 11, 'F'),
    (24586, 8, 2, 'M'),
    (24587, 16, 6, 'F'),
    (24588, 7, 14, 'M'),
    (24589, 36, 20, 'M'),
    (24590, 13, 32, 'F'),
    (24591, 29, 18, 'F'),
    (24592, 13, 26, 'M'),
    (24607, 17, 3, 'M'),
    (24609, 16, 21, 'M');
