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
Area_descripcion VARCHAR (100) NOT NULL,
Disciplina_descripcion VARCHAR (200) NOT NULL,
PRIMARY KEY (Disciplina_Id),
FOREIGN KEY (Gran_area_codigo)
REFERENCES Ref_gran_area_descripcion (Gran_area_codigo)
);

CREATE TABLE Proyecto_disciplina (
Proyecto_Id INT NOT NULL,
Proyecto_disciplina INT NOT NULL,
Disciplina_Id INT NOT NULL,
PRIMARY KEY (Proyecto_Id, Proyecto_disciplina),
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
Monto_Financiado_solicitado INT NOT NULL,
Monto_Financiado_adjudicado INT NOT NULL,
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
Titulo VARCHAR (200) NOT NULL,
Resumen VARCHAR (100) NOT NULL,
Codigo_identificacion INT (20) NOT NULL,
Palabras_clave VARCHAR (150) NOT NULL,
PRIMARY KEY (Proyecto_Id),
FOREIGN KEY (Proyecto_Id) 
REFERENCES Financiamiento (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Integrantes (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Estado (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES Estado (Proyecto_Id),
FOREIGN KEY (Proyecto_Id)
REFERENCES  Proyecto_disciplina (Proyecto_Id)
);



