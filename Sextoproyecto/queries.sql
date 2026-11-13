 -- Habilita trabajo con llaves foraneas

 PRAGMA foreign_keys = ON;

 --Tabla Libro
 CREATE TABLE IF NOT EXISTS LAVANDERIA (
    id_lavanderia INTEGER PRIMARY KEY ,
    nombre TEXT NOT NULL,
    horario TEXT,
    direccion TEXT NOT NULL
 );

 --TABLA CLIENTE
 CREATE TABLE IF NOT EXISTS CLIENTE (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    telefono TEXT NOT NULL
 );

 --TABLA INTERMEDIA 
 CREATE TABLE IF NOT EXISTS LAVANDERIA_CLIENTE(
    lavanderia_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY(lavanderia_id) REFERENCES lavanderia (id_lavanderia),
    FOREIGN KEY(cliente_id) REFERENCES cliente (id_cliente),
    PRIMARY KEY(lavanderia_id, cliente_id)
 );

 --INSERTA 
 INSERT INTO lavanderia(nombre, horario, direccion)
 VALUES('lavanderia daireli', '9:00am', 'la romana');


--insertar clientes 

INSERT INTO cliente(nombre, apellido, telefono)
VALUES('Juan','Perez','829-898-3478');

INSERT INTO cliente(nombre, apellido, telefono)
VALUES('Maria','Rosario','849-298-1910');

--INSERTAR CLIENTE / LAVANDERIA
INSERT INTO lavanderia_cliente(lavanderia_id, cliente_id)
VALUES(2, 3);

--CONSULTAR CON INNER JOIN
SELECT 
nombre,
horario,
direccion AS 'lavanderia'
FROM lavanderia_cliente
INNER JOIN cliente ON
lavanderia_cliente.cliente_id = cliente.id_cliente
INNER JOIN lavanderia ON 
lavanderia_cliente.lavanderia_id = lavanderia.id_lavanderia;