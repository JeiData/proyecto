-- 1° CONSIGNA: Crear usuario con permiso de solo lectura sobre todas las tablas.

-- El nombre otorgado al usuario tiene dos partes: el nombre de usuario, 
-- que es el que se pondrá cuando se quiera ingresar y el @ que especifica el dominio desde el que se conectará. 
-- En este caso, sería local, desde el equipo donde está corriendo el motor de la bbdd.
-- También debe tener una contraseña.

CREATE USER 'USER1'@'LOCALHOST'IDENTIFIED BY '1User';

-- Al verificar la creación del usuario:

select * from mysql.user;

-- se percibe que no tiene permisos de ningún tipo. Por lo que a continuación se le asigna permiso de sólo lectura, es decir, para exclusivamente
-- consultas select, sobre las bases de datos, evitando así que éste realice algún tipo de cambio sobre las bases de datos a las cuales tenga acceso:

GRANT SELECT ON *.* TO 'USER1'@'LOCALHOST';
 

-- 2° CONSIGNA: Crear usuario con permiso de lectura, insercion y modificacion de datos, pero que no puede eliminar registros.

-- El nombre otorgado al usuario tiene dos partes: el nombre de usuario, que es el que se pondrá cuando se quiera ingresar y el @ que especifica el dominio desde el que se conectará. 
-- En este caso, se podría conectar desde cualquier lugar.
-- También debe tener una contraseña.


CREATE USER 'USER2'@'LOCALHOST'IDENTIFIED BY '2useR';

-- Verifico la creación del usuario:

select * from mysql.user;

-- se percibe que no tiene permisos de ningún tipo. Por lo que a continuación se le asigna permisos se lectura, inserción, modificación
-- sobre los objetos. Tiene restringida la eliminacion de registros:

GRANT SELECT, INSERT, ALTER ON *.* TO 'USER2'@'LOCALHOST';
