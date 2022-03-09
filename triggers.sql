-- TRIGGER NRO 1
-- Permitira llevar un control de la insercion de nuevos registros en la tabla Proyectos_2019.

-- 1 Creacion de la tabla de auditoria

CREATE TABLE Aud_Proyectos_2019 (
Id_movimiento INT NOT NULL AUTO_INCREMENT,
Fecha DATETIME NOT NULL,
Usuario_Id VARCHAR (30) NOT NULL,
Proyecto_Id INT NOT NULL,                   		-- DE LA TABLA PROYECTOS_2019
Proyecto_fuente VARCHAR (15) NULL,					-- DE LA TABLA PROYECTOS_2019
Titulo VARCHAR (250) NOT NULL,						-- DE LA TABLA PROYECTOS_2019
Resumen VARCHAR (2800) NOT NULL, 					-- DE LA TABLA PROYECTOS_2019
Codigo_identificacion VARCHAR (20) NULL,			-- DE LA TABLA PROYECTOS_2019
Palabras_clave VARCHAR (150)  NULL,					-- DE LA TABLA PROYECTOS_2019
Tipo_Operacion VARCHAR (200) NULL,
PRIMARY KEY (Id_movimiento)
);

-- 2 Creacion del Trigger
CREATE TRIGGER `insp_movimientos_proyectos2019`
AFTER INSERT ON Proyectos_2019 -- EVENTO QUE DESENCADENARIA EL TRIGGER
FOR EACH ROW
INSERT INTO Aud_Proyectos_2019 
(Id_movimiento,Fecha,Usuario_Id,Proyecto_Id,Proyecto_fuente,Titulo,Resumen,Codigo_identificacion,Palabras_clave,Tipo_operacion) -- COMANDO A EJECUTAR
VALUES 
(NULL, NOW(), SESSION_USER(), NEW.Proyecto_Id,NEW.Proyecto_fuente,NEW.Titulo,NEW.Resumen,NEW.Codigo_identificacion,NEW.Palabras_clave,'Se inserto un nuevo registro en Proyectos_2019');

-- Prueba: Inserto un valor en la tabla auditada para verificar el funcionamiento del trigger.

INSERT INTO Proyectos_2019
VALUES
(24655,'CONICET', 'SALUD MENTAL Y REDES SOCIALES', 'Este proyecto pretende investigar el vinculo entre el denominado burnout y el uso adictivo de redes sociales', '222019635478CO', 'Redes sociales. Psicologia.');
  

-- TRIGGER NRO 2 (BEFORE)
-- Permitira llevar un control de la insercion de nuevos registros en la tabla .

-- 1 Creacion de la tabla de auditoria
CREATE TABLE Aud_Financiamiento (
Id_movimiento INT NOT NULL AUTO_INCREMENT,
Fecha DATETIME NOT NULL,
Usuario_Id VARCHAR (30) NOT NULL,
Proyecto_Id INT NOT NULL,                   -- DE LA TABLA FINANCIAMIENTO
Moneda_Id INT NOT NULL,                     -- DE LA TABLA FINANCIAMIENTO
Monto_Solicitado INT NOT NULL,              -- DE LA TABLA FINANCIAMIENTO
Monto_Adjudicado INT NOT NULL,              -- DE LA TABLA FINANCIAMIENTO
Monto_Financiado_solicitado INT NOT NULL,   -- DE LA TABLA FINANCIAMIENTO
Monto_Financiado_adjudicado INT NOT NULL,   -- DE LA TABLA FINANCIAMIENTO
Tipo_Operacion VARCHAR (200) NULL,
PRIMARY KEY (Id_movimiento)
);

-- 2 Creacion del Trigger After
DROP TRIGGER IF EXISTS `insp_financiamiento`;

CREATE TRIGGER `aud_financiamiento`
BEFORE INSERT ON Financiamiento -- EVENTO QUE DESENCADENARIA EL TRIGGER
FOR EACH ROW
INSERT INTO aud_financiamiento
(Id_movimiento,Fecha,Usuario_Id,Proyecto_Id,Moneda_Id,Monto_Solicitado,Monto_Adjudicado,Monto_Financiado_Solicitado,Monto_Financiado_Adjudicado,Tipo_Operacion) -- COMANDO A EJECUTAR
VALUES 
(NULL, NOW(), SESSION_USER(), NEW.Proyecto_Id,NEW.Moneda_Id,NEW.Monto_Solicitado,NEW.Monto_Adjudicado,NEW.Monto_Financiado_Solicitado,NEW.Monto_Financiado_Adjudicado,'Se inserto un nuevo registro en Financiamiento');


-- Prueba: Inserto un valor en la tabla Financiamiento para verificar el funcionamiento del trigger.

INSERT INTO Financiamiento
VALUES
(24654, 1, 5000000, 65423654, 500000, 500000);
